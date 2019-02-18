import 'package:redux/redux.dart';
import 'package:sanxing/common/redux/task/task_state.dart';
import 'package:sanxing/common/enums/taskPage_enum.dart';

final taskPageReducer = combineReducers<TaskPageState>([
  // This will update task page behavior & trigger animaiton in task page
  TypedReducer<TaskPageState, UpdateTaskPageAction>(updateTaskPageViewReducer),
]);

TaskPageState updateTaskPageViewReducer(TaskPageState taskPage, UpdateTaskPageAction action) {
  taskPage.view = action.view;
  return taskPage;
}

class UpdateTaskPageAction {
  final TaskPageViewEnum view;
  UpdateTaskPageAction(this.view);
}
