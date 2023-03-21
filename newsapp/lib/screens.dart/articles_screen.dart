// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:newsapp/class_models/articles_model.dart';

import '../widgets/stories.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  Future<Stories?>? getStories;

  @override
  void initState() {
    super.initState();
    getStories = parseStories();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            FutureBuilder<Stories?>(
              future: getStories,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  //debugPrint("${snapshot.data!.articles!.first}");
                  debugPrint("Data loaded");
                  return StoriesView(
                    thumb: snapshot.data!.articles!.first.thumb,
                    magname: snapshot.data!.articles!.first.magname,
                    issuename: snapshot.data!.articles!.first.issuename,
                    title: snapshot.data!.articles!.first.title,
                    timeRead: snapshot.data!.articles!.first.timeRead,
                  );
                } else if (snapshot.hasError) {
                  return Text("Couldn't load stories");
                }
                return CircularProgressIndicator.adaptive();
              },
            ),
          ],
        ),
      ),
    );
  }
}
