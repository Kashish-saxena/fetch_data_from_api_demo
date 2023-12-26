import 'package:api_demo/services/api_service.dart';
import 'package:api_demo/utils/album_response_model.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<AlbumResponseModel>> futureAlbums;

  @override
  void initState() {
    super.initState();
    futureAlbums = ApiService.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return FutureBuilder<List<AlbumResponseModel>>(
      future: futureAlbums,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<AlbumResponseModel> albums = snapshot.data!;

          return ListView.builder(
            itemCount: albums.length,
            itemBuilder: (context, index) {
              AlbumResponseModel album = albums[index];
              return Container(
                decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadiusDirectional.circular(10)),
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      minLeadingWidth: 5,
                  title: Text(album.title ?? ""),
                  leading: Text(album.id.toString(),style: TextStyle(fontSize: 20),),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }

        return CircularProgressIndicator();
      },
    );
  }
}
