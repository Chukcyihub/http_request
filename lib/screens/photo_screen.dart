import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_http/models/photo_model.dart';
import 'package:http/http.dart' as http;

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  final TextStyle myStyle = const TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w800,
    color: Colors.blue,
  );

  Future getPhoto() async {
    var response = await http.get(
      Uri.https("jsonplaceholder.typicode.com", "photos"),
    );

    var jsonData = jsonDecode(response.body);
    List<Photo> photos = [];

    for (var json in jsonData) {
      photos.add(Photo.fromJson(json));
    }

    return photos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Photos"),
      ),
      body: Card(
        child: FutureBuilder(
            future: getPhoto(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(),
                      Text("Loading ...", style: myStyle),
                    ],
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://www.google.com/url?sa=i&url=https%3A%2F%2Fstore4.manutd.com%2Fen%2F&psig=AOvVaw1woTs82jPMa7V7Kz3xc0du&ust=1667565417104000&source=images&cd=vfe&ved=0CA0QjRxqFwoTCNiPxKSDkvsCFQAAAAAdAAAAABAE"),
                        ),
                      ),
                      child: ListTile(
                        onTap: () {},
                        title: Container(
                          height: 100,
                          margin: const EdgeInsets.only(bottom: 10),
                          clipBehavior: Clip.none,
                          child: Image(
                              image: NetworkImage(
                                  snapshot.data[index].url + ".jpg")),
                        ),
                      ),
                    );
                  }),
                );
              }
            }),
      ),
    );
  }
}
