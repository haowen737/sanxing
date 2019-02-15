import 'package:flutter/material.dart';
import 'package:sanxing/ui/page/tasks/tasks_transformer.dart';
import 'package:sanxing/ui/widgets/textHero.dart';
import 'package:sanxing/utils/routedata.dart';
import 'package:sanxing/ui/page/taskDetail/task_detail.dart';
import 'package:sanxing/ui/widgets/taskTileHero.dart';

class TaskTile extends StatelessWidget {

  TaskTile({
    @required this.index,
    @required this.item,
    @required this.pageVisibility,
  });

  final index;
  final item;
  final PageVisibility pageVisibility;

  Widget _applyTextEffects({
    @required double translationFactor,
    @required Widget child,
  }) {
    final double xTranslation = pageVisibility.pagePosition * translationFactor;

    return Opacity(
      opacity: pageVisibility.visibleFraction,
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
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          item,
          style: textTheme.title.copyWith(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),
          )));

    return GestureDetector(
      onTap: () {
        Navigator.push(context, PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation animation,
        Animation secondaryAnimation) {
            return TaskDetail(
              item: item,
              index: index,
              pageVisibility: pageVisibility,
            );
          },
          transitionsBuilder: (BuildContext context, Animation animation,
        Animation secondaryAnimation, Widget child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 1.0),
                end: Offset.zero,
              ).animate(animation),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset.zero,
                  end: const Offset(0.0, 1.0),
                ).animate(secondaryAnimation),
                child: child,
              )
            );
          }));
        // Navigator.pushNamed(context, RouteCollect.taskDetail);
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
    return Padding(
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
            ]))));
  }
}