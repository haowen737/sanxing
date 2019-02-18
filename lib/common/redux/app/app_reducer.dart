import 'package:sanxing/common/redux/app/app_state.dart';
import 'package:sanxing/common/redux/task/task_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    isLoading: false,
    taskPage: taskPageReducer(state.taskPage, action),
  );
}
