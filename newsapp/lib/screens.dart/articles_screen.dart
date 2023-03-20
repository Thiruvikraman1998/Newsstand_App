import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:newsapp/class_models/articles_model.dart';

import '../widgets/stories.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  Future<Stories>? getStories;

  @override
  void initState() {
    super.initState();
    getStories = parseStories();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: const [
          StoriesView(),
          StoriesView(),
          StoriesView(),
          StoriesView(),
          StoriesView(),
          StoriesView(),
          StoriesView(),
          StoriesView(),
          // FutureBuilder<Stories>(
          //   future: getStories,
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return StoriesView(
          //         thumb: snapshot.data!.stories!.first.thumb,
          //         magname: snapshot.data!.stories!.first.magname,
          //         issuename: snapshot.data!.stories!.first.issuename,
          //         title: snapshot.data!.stories!.first.title,
          //         timeRead: snapshot.data!.stories!.first.timeRead,
          //       );
          //     } else if (snapshot.hasError) {
          //       return Text("Couldn't load stories");
          //     }
          //     return CircularProgressIndicator();
          //   },
          // ),
        ],
      ),
    );
  }
}
