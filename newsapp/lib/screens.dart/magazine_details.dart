import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:newsapp/screens.dart/Issues_screen.dart';
import 'package:newsapp/screens.dart/articles_screen.dart';
import 'package:newsapp/screens.dart/bookMarks_screen.dart';
import 'package:newsapp/screens.dart/clips_screen.dart';
import 'package:newsapp/screens.dart/onMyDev_screen.dart';
import 'package:newsapp/screens.dart/settings_screen.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: AppLayout.getHeight(140),
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
                          child: TextButton(
                            onPressed: () {
                              debugPrint("Issues pressed");
                              setState(() {
                                selectedWidget = WidgetMarker.issues;
                                isSelected == !isSelected;
                              });
                            },
                            child: Text(
                              "Issues".toUpperCase(),
                              style: TextStyle(
                                  color: isSelected
                                      ? Colors.blue[700]
                                      : Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: AppLayout.getWidth(10)),
                          child: TextButton(
                            onPressed: () {
                              debugPrint("Articles pressed");
                              setState(() {
                                selectedWidget = WidgetMarker.articles;
                                isSelected == !isSelected;
                              });
                            },
                            child: Text(
                              "Articles".toUpperCase(),
                              style: TextStyle(
                                  color: isSelected
                                      ? Colors.blue[700]
                                      : Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: AppLayout.getWidth(10)),
                          child: TextButton(
                            onPressed: () {
                              debugPrint("On my device pressed");
                              setState(() {
                                selectedWidget = WidgetMarker.onMyDevice;
                                isSelected == !isSelected;
                              });
                            },
                            child: Text(
                              "On my device".toUpperCase(),
                              style: TextStyle(
                                  color: isSelected
                                      ? Colors.blue[700]
                                      : Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: AppLayout.getWidth(10)),
                          child: TextButton(
                            onPressed: () {
                              debugPrint("Bookmarks pressed");
                              setState(() {
                                selectedWidget = WidgetMarker.bookMarks;
                                isSelected == !isSelected;
                              });
                            },
                            child: Text(
                              "Bookmarks".toUpperCase(),
                              style: TextStyle(
                                  color: isSelected
                                      ? Colors.blue[700]
                                      : Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: AppLayout.getWidth(10)),
                          child: TextButton(
                            onPressed: () {
                              debugPrint("clips pressed");
                              setState(() {
                                selectedWidget = WidgetMarker.clips;
                                isSelected == !isSelected;
                              });
                            },
                            child: Text(
                              "clips".toUpperCase(),
                              style: TextStyle(
                                  color: isSelected
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
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          debugPrint("Settings Tapped");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SettingsScreen()));
        },
        child: Icon(Icons.settings),
        backgroundColor: Colors.grey,
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
