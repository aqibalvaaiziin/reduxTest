import 'package:dioredux3/redux/model/app_state.dart';
import 'package:dioredux3/redux/reducer/main_reducer.dart';

AppState reducer(AppState state, action) {
  return AppState(mainState: mainReducer(state.mainState, action));
}
