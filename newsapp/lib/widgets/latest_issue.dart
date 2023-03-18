import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:newsapp/screens.dart/class_models/editions_model.dart';
import 'package:newsapp/utils/app_constants.dart';

import '../utils/app_layout.dart';
import '../utils/app_style.dart';

class LatestEdition extends StatelessWidget {
  final String issueDate;
  final String issueId;
  final String issueImg;
  final dynamic issuePrice;

  const LatestEdition({
    super.key,
    required this.issueDate,
    required this.issueId,
    required this.issueImg,
    required this.issuePrice,
  });

  @override
  Widget build(BuildContext context) {
    //final EdtDetails editionDetails;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppLayout.getWidth(5),
              vertical: AppLayout.getHeight(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    issueDate,
                    style: Style.boldText,
                  ),
                  Gap(AppLayout.getWidth(5)),
                  Icon(
                    Icons.info_outline,
                    size: 18,
                  ),
                  //Icon(FluentSystemIcons.ic_fluent_share_android_regular)
                ],
              ),
            ],
          ),
        ),
        Gap(AppLayout.getHeight(10)),
        Text(issueId),
        Gap(AppLayout.getHeight(20)),
        InkWell(
          onTap: () {
            debugPrint("Magazine tapped");
          },
          child: Container(
            color: Color(0xFF50C878),
            height: AppLayout.getHeight(335),
            width: AppLayout.getWidth(200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: AppLayout.getHeight(295),
                  width: AppLayout.getWidth(200),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage("$imgPrefix+$issueImg")),
                  ),
                ),
                Gap(AppLayout.getHeight(8)),
                Text(
                  issuePrice,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
