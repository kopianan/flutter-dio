import 'dart:convert';

import 'package:dio/dio.dart' as http_dio;
import 'package:flutter_dio/api/models/post_model/post_model.dart';

class ApiProvider {
  http_dio.Dio dio = http_dio.Dio();

  Future<List<PostModel>> getDataPostFromApiAsync() async {
    http_dio.Response response =
        await dio.get("https://jsonplaceholder.typicode.com/post");

    if (response.statusCode == 200) {
      final List rawData = jsonDecode(jsonEncode(response.data));
      List<PostModel> listPostModel =
          rawData.map((f) => PostModel.fromJson(f)).toList();

      return listPostModel;
    } else {
      return null;
    }
  }
}
