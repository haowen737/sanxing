import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:sanxing/ui/page/tasks/tasks_item.dart';
import 'package:sanxing/ui/page/tasks/tasks_transformer.dart';
import 'package:sanxing/utils/weekName.dart';
import 'package:sanxing/common/redux/app/app_state.dart';
import 'package:sanxing/common/redux/task/task_state.dart';
import 'package:sanxing/common/enums/taskPage_enum.dart';

class Tasks extends StatefulWidget {
  Size deviceSize;
  
  Tasks(this.deviceSize);

  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> with TickerProviderStateMixin{
// class Tasks extends StatelessWidget {

  Animation<double> animationWidth;
  Animation<double> animationHeight;
  AnimationController controller;
  TaskPageViewEnum _lastTaskPageStatus = TaskPageViewEnum.collapse;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 450), vsync: this
    );
    animationWidth = Tween(begin: 320.0, end: widget.deviceSize.width).animate(controller)
      ..addListener(() {
        setState(()=>{});
      });
    final animation = CurvedAnimation(parent: controller, curve: Cubic(0.12, 0.6, 0.18, 1.0));
    animationHeight = Tween(begin: 420.0, end: widget.deviceSize.height).animate(animation)
      ..addListener(() {
        setState(()=>{});
      });
    
    // controller.forward();
  }
  void dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }

  void _animationRun(TaskPageViewEnum taskPage) {
    if (taskPage == _lastTaskPageStatus) return;
    if (taskPage == TaskPageViewEnum.expend) {
      controller.forward();
    }
    if (taskPage == TaskPageViewEnum.collapse) {
      controller.reverse();
    }
    if (taskPage != _lastTaskPageStatus) {
      _lastTaskPageStatus = taskPage;
    }
    print('------_animationRun');
    print(taskPage);
  }

  Widget flexContainer(deviceSize, Widget child) {
    return StoreConnector<AppState, TaskPageState>(
      converter: (Store<AppState> store) {
        return store.state.taskPage;
      },
      builder: (BuildContext context, TaskPageState taskPage) {
        // const size = taskPageViewSizeMap(task)
        _animationRun(taskPage.view);
        return SizedBox.fromSize(
          size: Size(animationWidth.value, animationHeight.value),
          child: child
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Positioned(
      bottom: 0,
      left: 0,
      child: DefaultTextStyle(
        style: TextStyle(fontSize: 15, color: Color.fromRGBO(0, 0, 0, 1)),
        child: flexContainer(
          deviceSize,
          PageTransformer(
            pageViewBuilder: (context, visibilityResolver) {
              return PageView.builder(
                controller: PageController(viewportFraction: 0.85),
                itemCount: weekSetFull.length,
                itemBuilder: (context, index) {
                  final item = weekSetFull[index];
                  final pageVisibility =
                      visibilityResolver.resolvePageVisibility(index);

                  // print(index);
                  // print(pageVisibility);
                  return TaskItem(
                    index: index,
                    item: item,
                    pageVisibility: pageVisibility,
                  );
                });
            }))));
  }
}
