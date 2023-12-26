import 'dart:convert';
import 'dart:developer';

import 'package:api_demo/utils/album_response_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<AlbumResponseModel>> fetchData() async {
    List<AlbumResponseModel> albums = [];

    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums?userId=1'));

    try {
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          albums = albumModelFromJson(response.body);
          log("albums are $albums");
          // final Map<String, dynamic> jsonResponse = json.decode(response.body);
        }
      }
    } catch (e) {
      log('Error in loading data $e');
    }

    return albums;
  }
}
