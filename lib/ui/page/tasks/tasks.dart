import 'package:flutter/material.dart';
import 'package:sanxing/ui/page/tasks/tasks_item.dart';
import 'package:sanxing/ui/page/tasks/tasks_transformer.dart';
import 'package:sanxing/utils/weekName.dart';


class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageTransformer(
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
            }
          );
        }
      )
    );
  }
}
