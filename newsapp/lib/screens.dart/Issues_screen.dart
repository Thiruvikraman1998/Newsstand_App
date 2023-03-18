import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:newsapp/utils/app_layout.dart';
import 'package:newsapp/utils/app_style.dart';
import 'package:newsapp/widgets/dropdown.dart';
import 'package:newsapp/widgets/latest_issue.dart';
import 'package:newsapp/widgets/other__issues.dart';

import 'class_models/editions_model.dart';

class IssuesView extends StatefulWidget {
  const IssuesView({super.key});

  @override
  State<IssuesView> createState() => _IssuesViewState();
}

class _IssuesViewState extends State<IssuesView> {
  Future<Editions>? getEditions;
  @override
  void initState() {
    super.initState();
    getEditions = parseEditions();
  }

  Widget build(BuildContext context) {
    final size = AppLayout.getsize(context);
    return Column(
      children: [
        FutureBuilder<Editions>(
          future: getEditions,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              debugPrint("Loaded");
              return LatestEdition(
                issueDate: snapshot.data!.edtDetails!.first.editionName!,
                issueImg: snapshot.data!.edtDetails!.first.editionImage!,
                issueId: snapshot.data!.edtDetails!.first.editionName!,
                issuePrice: snapshot.data!.edtDetails!.first.editionPrice!,
              );
            } else if (snapshot.hasError) {
              return const Text("Couldn't load data");
            }
            return const CircularProgressIndicator();
          },
        ),
        //LatestEdition(),
        Gap(AppLayout.getHeight(30)),
        DropDown(),
        Gap(AppLayout.getHeight(30)),
        OtherIssues(
          issueDate: '',
          issueId: '',
          issueImg: '',
          issuePrice: "Free",
        ),
      ],
    );
  }
}
