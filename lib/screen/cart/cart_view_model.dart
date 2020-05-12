import 'dart:convert';

import 'package:dioredux3/providers/providers.dart';
import 'package:dioredux3/redux/action/main_action.dart';
import 'package:dioredux3/redux/model/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import './cart.dart';

abstract class CartViewModel extends State<Cart> {
  Store<AppState> store;

  Future initCarts() async {
    Providers.getKeranjangList().then((value) {
      store.dispatch(
        SetCart(
          carts: List.from(
            json.decode(jsonEncode(value.data)),
          ),
        ),
      );
    }).catchError((err) => print(err.toString()));
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await initCarts();
      store = StoreProvider.of<AppState>(context);
    });
  }
}
