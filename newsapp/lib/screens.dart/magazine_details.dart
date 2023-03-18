import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:newsapp/screens.dart/Issues_screen.dart';
import 'package:newsapp/utils/app_layout.dart';
import 'package:newsapp/utils/app_style.dart';

class MagazineDetails extends StatefulWidget {
  const MagazineDetails({super.key});

  @override
  State<MagazineDetails> createState() => _MagazineDetailsState();
}

class _MagazineDetailsState extends State<MagazineDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: AppLayout.getHeight(90),
            child: Column(
              children: [
                Gap(AppLayout.getHeight(20)),
                Container(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: AppLayout.getWidth(10),
                              vertical: AppLayout.getHeight(8)),
                          child: InkWell(
                            onTap: () {
                              debugPrint("Issues pressed");
                            },
                            child: Text(
                              "Issues".toUpperCase(),
                              style: Style.menuFontStyle,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: AppLayout.getWidth(10)),
                          child: InkWell(
                            onTap: () {
                              debugPrint("Articles pressed");
                            },
                            child: Text(
                              "Articles".toUpperCase(),
                              style: Style.menuFontStyle,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: AppLayout.getWidth(10)),
                          child: InkWell(
                            onTap: () {
                              debugPrint("On my device pressed");
                            },
                            child: Text(
                              "On my device".toUpperCase(),
                              style: Style.menuFontStyle,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: AppLayout.getWidth(10)),
                          child: InkWell(
                            onTap: () {
                              debugPrint("Bookmarks pressed");
                            },
                            child: Text(
                              "Bookmarks".toUpperCase(),
                              style: Style.menuFontStyle,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: AppLayout.getWidth(10)),
                          child: InkWell(
                            onTap: () {
                              debugPrint("clips pressed");
                            },
                            child: Text(
                              "clips".toUpperCase(),
                              style: Style.menuFontStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Style.menuColors,
                  thickness: 1,
                ),
                Gap(AppLayout.getHeight(10)),
              ],
            ),
          ),
          IssuesView(),
        ],
      ),
    );
  }
}
