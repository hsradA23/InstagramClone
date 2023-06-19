// This page is supposed to have the infinite scroll feed
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/widgets/post.dart';

import 'package:http/http.dart' as http;
import 'package:json_response/json_response.dart';

JsonArray users = JsonArray.empty();

getData() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/'));
  users = JsonArray.from(response: response);
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    getData();
    return Container(
      // color: CupertinoColors.activeBlue,
      constraints: const BoxConstraints.expand(),
      child: ListView.builder(
        itemCount: 50,
        itemBuilder: (BuildContext context, int index) {
          return index % 2 == 1
              ? const Divider()
              : Post(
                  index: index,
                  users: users,
                );
        },
      ),
    );
  }
}
