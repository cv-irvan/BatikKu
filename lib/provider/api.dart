import 'dart:convert';

import 'package:batikku/model/popularBatikModel.dart';
import 'package:batikku/utils/url.dart';
import 'package:http/http.dart' as client;

class Api {
  Future popularBatik() async {
    final getbatik = await client.get(url);
    if (getbatik.statusCode == 200) {
      return PopolarBatikModel.fromJson(json.decode(getbatik.body));
    } else {
      print('gagal ${getbatik.statusCode}');
    }
  }
}
