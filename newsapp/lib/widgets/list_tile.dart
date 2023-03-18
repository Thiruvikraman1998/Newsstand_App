import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:newsapp/screens.dart/class_models/editions_model.dart';

import '../utils/app_constants.dart';
import '../utils/app_layout.dart';
import '../utils/app_style.dart';

class IssuesList extends StatelessWidget {
  const IssuesList({super.key, required this.issueItems});
  final EdtDetails issueItems;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                    image: NetworkImage("$imgPrefix${issueItems.editionImage}"),
                  ),
                ),
              ),
              Gap(AppLayout.getWidth(15)),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dainik Bhaskar ${issueItems.editionId}",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text("Issue Date${issueItems.editionName}"),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Style.buttonColor)),
                    child: Text(
                        issueItems.editionPrice == 'Free' ? "Read" : "Buy"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
