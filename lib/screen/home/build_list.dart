import 'package:dioredux3/model/sepatu.dart';
import 'package:dioredux3/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BuildList extends StatefulWidget {
  final List<Sepatu> data;

  BuildList({this.data});

  @override
  _BuildListState createState() => _BuildListState();
}

class _BuildListState extends State<BuildList> {
  void message(String data) {
    Fluttertoast.showToast(
        msg: "$data",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: widget.data.length,
        itemBuilder: (context, i) => ListTile(
          title: Text(widget.data[i].nama),
          subtitle: Text("Rp. " + widget.data[i].harga.toString()),
          trailing: IconButton(
            icon: Icon(Icons.add_circle),
            onPressed: () {
              Providers.postDataKeranjang(widget.data[i].idSepatu, 1).then((_) {
                message("Data ditambahkan ke keranjang");
              });
            },
          ),
        ),
      ),
    );
  }
}
