import 'package:dioredux3/redux/model/app_state.dart';
import 'package:dioredux3/redux/model/main_state.dart';
import 'package:dioredux3/screen/cart/list_build.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import './cart_view_model.dart';

class CartView extends CartViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Keranjang"),
        centerTitle: true,
      ),
      body: StoreConnector<AppState, MainState>(
        converter: (store) => store.state.mainState,
        builder: (context, state) {
          return state.carts.length > 0
              ? Container(
                  child: ListBuild(),
                )
              : Container(
                  child: Center(
                    child: Text(
                      "Data Kosong",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
