import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sanxing/ui/page/tasks/tasks_transformer.dart';
import 'package:sanxing/common/redux/task/task_reducer.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sanxing/common/redux/app/app_state.dart';
import 'package:sanxing/common/enums/taskPage_enum.dart';

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
  double _backDropWidth = 0;
  double _backDropHeight = 0;

  TaskPageViewEnum _dragAction;

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
  Widget _titleWidget(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var titleText = _applyTextEffects(
      translationFactor: 380.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          '$_dragAction widget.item',
          style: textTheme.title.copyWith(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),
          )));

      return titleText;
  }

  Widget _taskContent(BuildContext context) {
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

  Widget _backDrop(BuildContext contex) {
    return SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(20.0)
        ),
        child: Text('xxx')
      ));
  }

  void _handleVerticalDragUpdate(DragUpdateDetails details) {
    final offset = details.delta.dy;

    setState(() {
      _dragAction = offset > 0
        ? TaskPageViewEnum.collapse
        : TaskPageViewEnum.expend;
    });
  }

  void _handleVerticalDragEnd(DragEndDetails details, Store store) {
    store.dispatch(UpdateTaskPageAction(
      _dragAction
    ));
  }

  @override
  Widget build(BuildContext context) {

    return StoreConnector<AppState, Store>(
      converter: (Store store) {
        // return (TaskPageViewEnum action) {
        //   store.dispatch(UpdateTaskPageAction(action));
        // };
        return store;
      },
      builder: (BuildContext context, Store store) {
        final boxSize = taskPageViewSizeMap(
          MediaQuery.of(context).size,
          store.state.taskPage.view
        );
        // print(boxSize);
        // print(store.state.taskPage.view);
        return GestureDetector(
          onVerticalDragUpdate: (DragUpdateDetails details) => _handleVerticalDragUpdate(details),
          onVerticalDragEnd: (DragEndDetails details) => _handleVerticalDragEnd(details, store),
          child: SizedBox.fromSize(
            size: boxSize,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 8.0,
              ),
              // elevation: 3.0,
              // borderRadius: BorderRadius.circular(20.0),
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  _backDrop(context),
                  Column(
                    children: [
                      _taskContent(context),
                      _titleWidget(context),
                    ])]))));
    });
  }
}
