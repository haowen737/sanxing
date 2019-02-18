import 'package:flutter/material.dart';

enum TaskPageViewEnum {
  collapse,
  expend
}
// Map<TaskPageViewEnum, Size> taskPageViewSizeMap = TaskPageViewSizeMap<TaskPageViewEnum, Size>(TaskPageViewEnum.values);

// taskPageViewSizeMap.put(TaskPageViewEnum.collapse, Size getSize(Size deviceSize) {
//   Size(deviceSize.width, deviceSize.height / 2)});
    
// taskPageViewSizeMap.put(TaskPageViewEnum.expend, Size getSize(Size deviceSize) {
//   Size(deviceSize.width, deviceSize.height)}
// );

Size taskPageViewSizeMap (deviceSize, TaskPageViewEnum view) {
  print('check size');
  print(view);
  switch (view) {
    case TaskPageViewEnum.collapse:
      return Size(deviceSize.width, deviceSize.height / 2);
      break;
    case TaskPageViewEnum.expend:
      return Size(deviceSize.width, deviceSize.height);
      break;
    default: // 没有这个，会看到一个警告。
      return Size(deviceSize.width, deviceSize.height / 2);
  }
}