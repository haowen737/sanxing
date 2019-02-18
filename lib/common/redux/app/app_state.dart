import 'package:sanxing/common/redux/task/task_state.dart';

class AppState {
  final bool isLoading;
  TaskPageState taskPage;

  AppState({this.isLoading = false, this.taskPage});

  // task page state will controller behavior of task page

}
