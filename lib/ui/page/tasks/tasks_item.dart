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
  double _top = 0.0;
  double _backDropWidth = 0;
  double _backDropHeight = 0;

  void _clearStateTop() {
    setState(() {
      _top = 0.0;
    });
  }

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
          '$_top widget.item',
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

  void _handleVerticalDragUpdate(DragUpdateDetails details, VoidCallback callback) {
    // print(detail.globalPosition);
    // TODO: this top is for test only
    final offset = details.delta.dy;
    final deviceSize = MediaQuery.of(context).size;

    setState(() {
      _top += details.delta.dy;
    });
    // print(callback);
    callback();

    if (offset > 0) {
      return ;
    }

    setState(() {
      _backDropHeight = deviceSize.height + offset;
    });
  }

  void _handleVerticalDragEnd(DragEndDetails details) {
      _clearStateTop();
  }

  @override
  Widget build(BuildContext context) {
    AnimationController _taskAnimationController;

    return StoreConnector<AppState, VoidCallback>(
      converter: (Store<AppState> store) {
        return () {
          store.dispatch(UpdateTaskPageAction(TaskPageViewEnum.expend));
        };
      },
      builder: (BuildContext context, VoidCallback callback) {
        return GestureDetector(
          onVerticalDragUpdate: (DragUpdateDetails details) => _handleVerticalDragUpdate(details, callback),
          onVerticalDragEnd: (DragEndDetails details) => _handleVerticalDragEnd(details),
          child: SizedBox.expand(
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
