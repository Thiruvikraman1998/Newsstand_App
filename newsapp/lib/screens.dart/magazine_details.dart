import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:newsapp/screens.dart/Issues_screen.dart';
import 'package:newsapp/screens.dart/articles_screen.dart';
import 'package:newsapp/screens.dart/bookMarks_screen.dart';
import 'package:newsapp/screens.dart/clips_screen.dart';
import 'package:newsapp/screens.dart/onMyDev_screen.dart';
import 'package:newsapp/utils/app_layout.dart';
import 'package:newsapp/utils/app_style.dart';

enum WidgetMarker { issues, articles, onMyDevice, bookMarks, clips }

class MagazineDetails extends StatefulWidget {
  const MagazineDetails({super.key});

  @override
  State<MagazineDetails> createState() => _MagazineDetailsState();
}

class _MagazineDetailsState extends State<MagazineDetails> {
  WidgetMarker selectedWidget = WidgetMarker.issues;
  final bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: AppLayout.getHeight(120),
            padding: EdgeInsets.only(
              top: AppLayout.getHeight(60),
              bottom: AppLayout.getHeight(15),
            ),
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: AppLayout.getWidth(10),
                            vertical: AppLayout.getHeight(8)),
                        child: InkWell(
                          onTap: () {
                            debugPrint("Issues pressed");
                            setState(() {
                              selectedWidget = WidgetMarker.issues;
                              isSelected;
                            });
                          },
                          child: Text(
                            "Issues".toUpperCase(),
                            style: TextStyle(
                                color: isSelected == true
                                    ? Colors.blue[700]
                                    : Colors.grey),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: AppLayout.getWidth(10)),
                        child: InkWell(
                          onTap: () {
                            debugPrint("Articles pressed");
                            setState(() {
                              selectedWidget = WidgetMarker.articles;
                            });
                          },
                          child: Text(
                            "Articles".toUpperCase(),
                            style: TextStyle(
                                color: isSelected == true
                                    ? Colors.blue[700]
                                    : Colors.grey),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: AppLayout.getWidth(10)),
                        child: InkWell(
                          onTap: () {
                            debugPrint("On my device pressed");
                            setState(() {
                              selectedWidget = WidgetMarker.onMyDevice;
                            });
                          },
                          child: Text(
                            "On my device".toUpperCase(),
                            style: TextStyle(
                                color: isSelected == true
                                    ? Colors.blue[700]
                                    : Colors.grey),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: AppLayout.getWidth(10)),
                        child: InkWell(
                          onTap: () {
                            debugPrint("Bookmarks pressed");
                            setState(() {
                              selectedWidget = WidgetMarker.bookMarks;
                            });
                          },
                          child: Text(
                            "Bookmarks".toUpperCase(),
                            style: TextStyle(
                                color: isSelected == true
                                    ? Colors.blue[700]
                                    : Colors.grey),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: AppLayout.getWidth(10)),
                        child: InkWell(
                          onTap: () {
                            debugPrint("clips pressed");
                            setState(() {
                              selectedWidget = WidgetMarker.clips;
                            });
                          },
                          child: Text(
                            "clips".toUpperCase(),
                            style: TextStyle(
                                color: isSelected == true
                                    ? Colors.blue[700]
                                    : Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          getSelectedWidget(),
        ],
      ),
    );
  }

  Widget getSelectedWidget() {
    switch (selectedWidget) {
      case WidgetMarker.issues:
        return getIssueScreen();
      case WidgetMarker.articles:
        return getArticleScreen();
      case WidgetMarker.onMyDevice:
        return getOnMyDeviceScreen();
      case WidgetMarker.bookMarks:
        return getBookmarksScreen();
      case WidgetMarker.clips:
        return getClipsScreen();
    }
    // ignore: dead_code
    return getIssueScreen();
  }

  Widget getIssueScreen() {
    return IssuesView();
  }

  Widget getArticleScreen() {
    return ArticleScreen();
  }

  Widget getOnMyDeviceScreen() {
    return OnMyDeviceScreeen();
  }

  Widget getBookmarksScreen() {
    return BookMarkScreen();
  }

  Widget getClipsScreen() {
    return ClipsScreen();
  }
}
