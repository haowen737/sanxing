import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sanxing/ui/page/tasks/tasks_transformer.dart';
import 'package:sanxing/ui/widgets/taskTileHero.dart';
import 'package:sanxing/ui/widgets/taskTile.dart';

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (DragUpdateDetails detail) {
        print(detail.globalPosition);
      },
      child: TaskTileHero(
        tag: 'hero-tile-${widget.item}',
        child: TaskTile(
          item: widget.item,
          index: widget.index,
          pageVisibility: widget.pageVisibility,
        )));
  }
}
