import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sanxing/ui/page/tasks/tasks_transformer.dart';
import 'package:sanxing/ui/widgets/textHero.dart';
import 'package:sanxing/utils/routedata.dart';

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

  Widget _applyTextEffects({
    @required double translationFactor,
    @required Widget child,
  }) {
    final double xTranslation = widget.pageVisibility.pagePosition * translationFactor;

    return Opacity(
      opacity: widget.pageVisibility.visibleFraction,
      child: Transform(
        alignment: FractionalOffset.topLeft,
        transform: Matrix4.translationValues(
          xTranslation,
          0.0,
          0.0,
        ),
        child: child,
      ),
    );
  }

  // title is a hero widget
  _titleWidget(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var titleText = _applyTextEffects(
      translationFactor: 380.0,
      child: TextHero(
        padding: const EdgeInsets.all(10.0),
        tag: 'hero-task-${widget.index}',
        item: widget.item,
        style: textTheme.title.copyWith(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),
        ));

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteCollect.taskDetail);
      },
      child: titleText
    );
  }

  _taskContent(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Text('Should containe child'),
            Text('Should containe child'),
            Text('Should containe child'),
          ],
        )
      ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (DragUpdateDetails detail) {
        print(detail.globalPosition);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 8.0,
        ),
        child: Material(
          elevation: 3.0,
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(20.0),
          child: OverflowBox(
            child: Column(
              children: [
                _taskContent(context),
                _titleWidget(context)
              ])))));
  }
}
