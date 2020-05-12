import 'package:dioredux3/redux/model/app_state.dart';
import 'package:dioredux3/redux/reducer/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

Future<Store<AppState>> createStore() async {
  return Store(
    reducer,
    initialState: AppState.initial(),
    distinct: true,
    middleware: [LoggingMiddleware.printer()],
  );
}
