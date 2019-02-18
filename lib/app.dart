import 'package:flutter/material.dart';
import 'package:sanxing/ui/page/timeline/timeline.dart';
import 'package:sanxing/ui/page/home/home.dart';
import 'package:sanxing/utils/routedata.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sanxing/common/redux/app/app_state.dart';
import 'package:sanxing/common/redux/app/app_reducer.dart';
import 'package:sanxing/common/redux/task/task_state.dart';
import 'package:redux_logging/redux_logging.dart';

class App extends StatelessWidget {

  // Store is a calass that holds my sanxing State Tree
  final store = Store<AppState>(
    appReducer,
    initialState: AppState(
      isLoading: false,
      taskPage: TaskPageState()
    ),
    middleware: [LoggingMiddleware.printer()],
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Colors.white,
        ),
        home: Home(),
        routes: <String, WidgetBuilder>{
          RouteCollect.home: (BuildContext context) => Home(),
          RouteCollect.timeline: (BuildContext context) => Timeline(),
        },
      ));
  }
}
