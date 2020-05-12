import 'dart:convert';

import 'package:dioredux3/providers/providers.dart';
import 'package:dioredux3/redux/action/main_action.dart';
import 'package:dioredux3/redux/model/app_state.dart';
import 'package:dioredux3/redux/model/main_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:redux/redux.dart';

class ListBuild extends StatefulWidget {
  @override
  _ListBuildState createState() => _ListBuildState();
}

class _ListBuildState extends State<ListBuild> {
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

  void message(String data) {
    Fluttertoast.showToast(
        msg: "$data",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MainState>(
      converter: (store) => store.state.mainState,
      builder: (context, state) {
        return Container(
          child: ListView.builder(
              itemCount: state.carts.length,
              padding: EdgeInsets.all(10),
              itemBuilder: (context, i) {
                int dataSubtotal(data1, data2) {
                  return data1 * data2;
                }

                int harga = state.carts[i]['Sepatu']['harga'];
                int jumlah = state.carts[i]['jumlah'];

                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    title: Text("Id: " +
                        state.carts[i]['id_sepatu'].toString() +
                        " " +
                        state.carts[i]['Sepatu']['nama']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Text("Rp. " +
                                  state.carts[i]['Sepatu']['harga'].toString()),
                              IconButton(
                                  icon: Icon(Icons.remove_circle),
                                  onPressed: () {
                                    if (state.carts[i]['jumlah'] > 1) {
                                      Providers.putQtyKeranjang(
                                              state.carts[i]['id_sepatu'],
                                              state.carts[i]['jumlah'] - 1)
                                          .then((_) async {
                                        await initCarts();
                                        setState(() {});
                                      });
                                    }
                                  }),
                              Text(state.carts[i]['jumlah'].toString()),
                              IconButton(
                                  icon: Icon(Icons.add_circle),
                                  onPressed: () {
                                    Providers.putQtyKeranjang(
                                            state.carts[i]['id_sepatu'],
                                            state.carts[i]['jumlah'] + 1)
                                        .then((_) async {
                                      await initCarts();
                                      setState(() {});
                                    });
                                  }),
                            ],
                          ),
                        ),
                        Text("Subtotal : Rp. " +
                            dataSubtotal(jumlah, harga).toString()),
                      ],
                    ),
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => Providers.deleteDataKeranjang(
                                    state.carts[i]['id_sepatu'])
                                .then((_) async {
                              message("Data Dihapus");
                              await initCarts();
                              setState(() {});
                            })),
                  ),
                );
              }),
        );
      },
    );
  }
}
