import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dioredux3/model/sepatu.dart';

class Providers {
  static String url = "https://sepatu.gopla.xyz/";
  static String token =
      "bearerHeaders eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZF91c2VyIjoxMDYsImVtYWlsIjoia2FrYSIsImFsYW1hdCI6Imtha2EiLCJ0ZWxwIjoia2FrYSIsInJvbGUiOiJVc2VyIiwiaWF0IjoxNTg4NTEwNjk4fQ.6Oguxl0sUtomixUMGnYaq1jMHzCVYTytetW7W_WUYFg";

  static Future getSepatuList() async {
    Dio dio = Dio();
    Response response;

    response = await dio.get("$url/sepatu/group/bestSeller");
    if (response.statusCode == 200) {
      final List rawData = jsonDecode(jsonEncode(response.data));
      List datalist = rawData.map((f) => Sepatu.fromJson(f)).toList();
      return datalist;
    } else {
      return null;
    }
  }

  static Future getKeranjangList() async {
    Dio dio = Dio();
    dio.options.headers["Authorization"] = token;
    return dio.get("$url/keranjang");
  }

  static Future postDataKeranjang(int id, int jumlah) async {
    Dio dio = Dio();
    dio.options.headers["Authorization"] = token;
    await dio.post("$url/keranjang", data: {
      "id_sepatu": id,
      "jumlah": jumlah,
    });
  }

  static Future deleteDataKeranjang(int id) async {
    Dio dio = Dio();
    dio.options.headers["Authorization"] = token;
    await dio.delete("$url/keranjang/$id");
  }

  static Future putQtyKeranjang(int id, int jumlah) async {
    Dio dio = Dio();
    dio.options.headers["Authorization"] = token;
    await dio.put("$url/keranjang", data: {"id_sepatu": id, "jumlah": jumlah});
  }
}
