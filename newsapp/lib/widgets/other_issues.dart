import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:newsapp/screens.dart/class_models/editions_model.dart';
import 'package:newsapp/utils/app_layout.dart';
import 'package:newsapp/utils/app_style.dart';
import 'package:newsapp/widgets/list_tile.dart';

import '../utils/app_constants.dart';

class OtherIssues extends StatelessWidget {
  final List<EdtDetails> otherIssues;

  OtherIssues({
    super.key,
    required this.otherIssues,
  });

  @override
  Widget build(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(15)),
      padding: EdgeInsets.symmetric(
          horizontal: AppLayout.getWidth(5), vertical: AppLayout.getHeight(10)),
      height: AppLayout.getHeight(140),
      child: ListView.builder(
        itemCount: otherIssues.length,
        itemBuilder: (context, index) {
          return IssuesList(
            issueItems: otherIssues[index],
          );
        },
      ),
    );
  }
}
