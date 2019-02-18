import 'package:flutter/material.dart';
import 'package:sanxing/common/enums/taskPage_enum.dart';

class TaskPageState {
  TaskPageViewEnum view;
  Size size;

  TaskPageState({
    this.view = TaskPageViewEnum.collapse,
  });
}