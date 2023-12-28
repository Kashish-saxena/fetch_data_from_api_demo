import 'dart:developer';

import 'package:api_demo/utils/post_response_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<PostResponseModel>> fetchData() async {
    List<PostResponseModel> posts = [];

    // final response = await http
    //     .get(Uri.parse('https://jsonplaceholder.typicode.com/posts?userId=1'));
    final response;

    response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    try {
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          posts = postModelFromJson(response.body);
          log("posts are $posts");
          // final Map<String, dynamic> jsonResponse = json.decode(response.body);
        }
      }
    } catch (e) {
      log('Error in loading data $e');
    }

    return posts;
  }
}
