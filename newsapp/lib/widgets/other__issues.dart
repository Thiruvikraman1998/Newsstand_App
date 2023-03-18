import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:newsapp/utils/app_layout.dart';
import 'package:newsapp/utils/app_style.dart';

import '../utils/app_constants.dart';

class OtherIssues extends StatelessWidget {
  final String issueDate;
  final String issueId;
  final String issueImg;
  final dynamic issuePrice;

  const OtherIssues({
    super.key,
    required this.issueDate,
    required this.issueId,
    required this.issueImg,
    required this.issuePrice,
  });

  @override
  Widget build(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(15)),
      padding: EdgeInsets.symmetric(
          horizontal: AppLayout.getWidth(5), vertical: AppLayout.getHeight(10)),
      height: AppLayout.getHeight(140),
      child: Row(
        children: [
          Container(
              child: Row(
            children: [
              Container(
                height: AppLayout.getHeight(120),
                width: AppLayout.getWidth(80),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "${imgPrefix}1587650944/1679026933/images/thumb/390_thumb_1.jpg"),
                  ),
                ),
              ),
              Gap(AppLayout.getWidth(15)),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Dainik Bhaskar $issueId"),
                  Text("Issue Date${issueDate}"),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Style.buttonColor)),
                    child: Text(issuePrice == 'Free' ? "Read" : "Buy"),
                  ),
                ],
              ),
            ],
          )),
        ],
      ),
    );
  }
}
