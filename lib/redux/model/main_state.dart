import 'package:meta/meta.dart';

@immutable
class MainState {
  final List carts;

  MainState({@required this.carts});

  factory MainState.initial() {
    return MainState(carts: []);
  }

  MainState copyWith({List carts}) {
    return MainState(carts: carts ?? this.carts);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainState &&
          runtimeType == other.runtimeType &&
          carts == other.carts;

  @override
  int get hashCode => carts.hashCode;
}
