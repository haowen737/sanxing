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
  final Size deviceSize;
  
  Tasks(this.deviceSize);

  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> with TickerProviderStateMixin{
  Animation<double> animationWidth;
  Animation<double> animationHeight;
  Animation<double> animationEdgeVertical;
  Animation<double> animationEdgeHorizontal;
  AnimationController controller;
  AnimationController edgeAnimationController;
  TaskPageViewEnum _lastTaskPageStatus = TaskPageViewEnum.collapse;

  @override
  void initState() {
    super.initState();
    final deviceWidth = widget.deviceSize.width;
    final deviceHeight = widget.deviceSize.height;

    controller = AnimationController(
      duration: const Duration(milliseconds: 650), vsync: this
    );
    edgeAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1000), vsync: this
    );

    final animation = CurvedAnimation(parent: controller, curve: Cubic(0.18, 0.6, 0.08, 1.0));
    final edgeAnimation = CurvedAnimation(parent: edgeAnimationController, curve: Curves.fastOutSlowIn);

    animationWidth = Tween(begin: deviceWidth, end: deviceWidth).animate(controller)
      ..addListener(() { setState(() => {});});

    animationHeight = Tween(begin: 420.0, end: widget.deviceSize.height).animate(animation)
      ..addListener(() { setState(()=> {});});
      
    animationEdgeVertical = Tween(begin: 16.0, end: 10.0).animate(edgeAnimation)
      ..addListener(() { setState(() => {}); });
    animationEdgeHorizontal = Tween(begin: 8.0, end: 2.0).animate(edgeAnimation)
      ..addListener(() { setState(() => {}); });
    // controller.forward();
  }
  
  void dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }

  // Anination runner
  void _animationRun(TaskPageViewEnum taskPage) {
    // taskPage status == last
    // return to optimize
    if (taskPage == _lastTaskPageStatus) return;

    // excute expand animation
    if (taskPage == TaskPageViewEnum.expend) {
      controller.forward();
      edgeAnimationController.forward();
    }

    // excute collapse animation
    if (taskPage == TaskPageViewEnum.collapse) {
      controller.reverse();
      edgeAnimationController.reverse();
    }

    // animation excuted, mark pageStatus
    if (taskPage != _lastTaskPageStatus) {
      _lastTaskPageStatus = taskPage;
    }
    print('------_animationRun');
    print(taskPage);
  }

  // Resize if animaiton trigger
  Widget flexContainer(Widget child) {
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
    return Positioned(
      bottom: 0,
      left: 0,
      child: DefaultTextStyle(
        style: TextStyle(fontSize: 15, color: Color.fromRGBO(0, 0, 0, 1)),
        child: flexContainer(
          PageTransformer(
            pageViewBuilder: (context, visibilityResolver) {
              return PageView.builder(
                controller: PageController(viewportFraction: 0.85),
                itemCount: weekSetFull.length,
                itemBuilder: (context, index) {
                  final item = weekSetFull[index];
                  final pageVisibility =
                      visibilityResolver.resolvePageVisibility(index);

                  return TaskItem(
                    padding: EdgeInsets.symmetric(
                      vertical: animationEdgeVertical.value,
                      horizontal: animationEdgeHorizontal.value,
                    ),
                    index: index,
                    item: item,
                    pageVisibility: pageVisibility,
                  );
                });
            }))));
  }
}
