// This is the widget for a single instagram post
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:json_response/json_response.dart';

// ignore: must_be_immutable
class Post extends StatelessWidget {
  Random random = Random();
  final JsonArray users;
  final int index;
  Post({super.key, required this.users, required this.index});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              // Post header
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.person_2_sharp,
                ),
                Text(users.isEmpty
                    ? "Username"
                    : users.get(index: index % 10).getString(key: 'name')),
                const Spacer(),
                CupertinoButton(child: const Text("Follow"), onPressed: () {}),
                const Icon(Icons.more_horiz),
              ],
            ),
          ),
        ),
        AspectRatio(
          aspectRatio: 1,
          child: Image.network(
            'https://picsum.photos/seed/picsum${random.nextInt(100)}/1700',
            loadingBuilder: imageLoadProgress,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                // Button row
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  Icon(CupertinoIcons.heart),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(CupertinoIcons.text_bubble),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(CupertinoIcons.paperplane),
                  Spacer(),
                  Icon(CupertinoIcons.bookmark),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  " ${50 + random.nextInt(100)} likes",
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  " ${1 + random.nextInt(9)} weeks ago",
                  style: const TextStyle(color: Colors.black45, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget imageLoadProgress(
    BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
  if (loadingProgress == null) return child;
  return Center(
    child: Container(
      padding: const EdgeInsets.all(150),
      child: CircularProgressIndicator(
        color: Colors.black54,
        value: loadingProgress.expectedTotalBytes != null
            ? (loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!) *
                    0.9 +
                0.1
            : null,
      ),
    ),
  );
}
