import 'dart:async';
import 'package:api_demo/screens/individual_screen.dart';
import 'package:api_demo/services/api_service.dart';
import 'package:api_demo/utils/post_response_model.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<PostResponseModel>> futureposts;

  @override
  void initState() {
    super.initState();
    futureposts = ApiService.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFB495),
      appBar: AppBar(
        backgroundColor: Color(0xffEFB495),
        title: Text(
          "Posts",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return FutureBuilder<List<PostResponseModel>>(
      future: futureposts,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PostResponseModel> posts = snapshot.data ?? [];
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              PostResponseModel post = posts[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              IndividualScreen(body: post.body ?? "")));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffEF9595),
                      borderRadius: BorderRadiusDirectional.circular(10)),
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    minLeadingWidth: 5,
                    title: Text(
                      "Title",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      post.title ?? "",
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: Text(
                      post.id.toString(),
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
