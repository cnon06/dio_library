import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'model.dart';

class WebService {
  static Future<List<User>> getData() async {
    debugPrint("data çağırıldı");
    try {
      var response =
          await Dio().get("https://jsonplaceholder.typicode.com/users/");

      if (response.statusCode == 200) {
        // debugPrint(response.data.toString());
        // debugPrint(response.data);
        return UserFromJson(response.data);
      } else {
        return Future.error("error");
      }
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }
}
