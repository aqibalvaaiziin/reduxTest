import 'package:dioredux3/providers/providers.dart';
import 'package:dioredux3/screen/cart/cart.dart';
import 'package:dioredux3/screen/home/build_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget cart() {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.only(top: 40),
      decoration:
          BoxDecoration(color: Colors.lightBlueAccent, shape: BoxShape.circle),
      child: Stack(
        children: <Widget>[
          Center(
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Cart()),
              ),
            ),
          ),
          Container(
            width: 15,
            height: 15,
            margin: EdgeInsets.only(left: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                "99",
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: Providers.getSepatuList(),
          builder: (BuildContext context, AsyncSnapshot snashot) {
            switch (snashot.connectionState) {
              case ConnectionState.none:
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
                break;
              case ConnectionState.waiting:
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
                break;
              case ConnectionState.active:
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
                break;
              case ConnectionState.done:
                return Container(
                    child: Column(
                  children: <Widget>[
                    cart(),
                    Expanded(
                        child: BuildList(
                      data: snashot.data,
                    ))
                  ],
                ));
                break;
            }
            return Container();
          },
        ),
      ),
    );
  }
}
