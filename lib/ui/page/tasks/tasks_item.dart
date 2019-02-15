import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sanxing/ui/page/tasks/tasks_transformer.dart';
import 'package:sanxing/ui/widgets/taskTileHero.dart';
import 'package:sanxing/ui/page/tasks/taskTile.dart';

class TaskItem extends StatefulWidget {
  TaskItem({
    @required this.index,
    @required this.item,
    @required this.pageVisibility,
  });

  final index;
  final item;
  final PageVisibility pageVisibility;

  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  double _top = 0.0;
  double _backDropWidth = 0;
  double _backDropHeight = 0;

  void _clearStateTop() {
    setState(() {
      _top = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return GestureDetector(
      onVerticalDragUpdate: (DragUpdateDetails details) {
        // print(detail.globalPosition);
        // TODO: this top is for test only
        final offset = details.delta.dy;
        setState(() {
          _top += details.delta.dy;
        });

        if (offset > 0) {
          return ;
        }

        setState(() {
          _backDropHeight = deviceSize.height + offset;
        });

      },
      onVerticalDragEnd: (DragEndDetails details) {
        _clearStateTop();
      },
      child: TaskTile(
        item: '$_top widget.item',
        index: widget.index,
        backDropHeight: _backDropHeight,
        backDropWidth: _backDropWidth,
        pageVisibility: widget.pageVisibility,
      ));
  }
}
