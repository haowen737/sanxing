import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:sanxing/ui/page/tasks/tasks_item.dart';
import 'package:sanxing/ui/page/tasks/tasks_transformer.dart';
import 'package:sanxing/utils/weekName.dart';
import 'package:sanxing/common/redux/app/app_state.dart';
import 'package:sanxing/common/redux/task/task_state.dart';
import 'package:sanxing/common/enums/taskPage_enum.dart';

class Tasks extends StatelessWidget {
  Widget flexContainer(deviceSize, Widget child) {
    return StoreConnector<AppState, TaskPageState>(
      converter: (Store<AppState> store) {
        return store.state.taskPage;
      },
      builder: (BuildContext context, TaskPageState taskPage) {
        print(taskPage.view);
        // const size = taskPageViewSizeMap(task)
        return SizedBox.fromSize(
          size: taskPageViewSizeMap(deviceSize, taskPage.view),
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
