import 'package:dioredux3/redux/action/main_action.dart';
import 'package:dioredux3/redux/model/main_state.dart';
import 'package:redux/redux.dart';

final mainReducer = combineReducers<MainState>(
    [TypedReducer<MainState, SetCart>(_setMainState)]);

MainState _setMainState(MainState state, SetCart payload) {
  return state.copyWith(carts: payload.carts);
}
