import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:newsapp/utils/app_layout.dart';
import 'package:newsapp/utils/app_style.dart';
import 'package:newsapp/widgets/dropdown.dart';
import 'package:newsapp/widgets/latest_issue.dart';
import 'package:newsapp/widgets/other_issues.dart';

import '../class_models/editions_model.dart';
import '../utils/app_constants.dart';
import '../widgets/list_tile.dart';
//import '../utils/app_constants.dart';

class IssuesView extends StatefulWidget {
  const IssuesView({super.key});

  @override
  State<IssuesView> createState() => _IssuesViewState();
}

class _IssuesViewState extends State<IssuesView> {
  Future<Editions>? getEditions;
  //final List<Widget> others = <Widget>[];
  @override
  void initState() {
    super.initState();
    getEditions = parseEditions();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FutureBuilder<Editions>(
            future: getEditions,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                debugPrint("Latest issue Loaded");
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
          Container(child: isNewsPaper ? DropDown() : null),
          Flexible(
            child: FutureBuilder<Editions>(
              future: getEditions,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  debugPrint("List loaded");
                  return OtherIssues(
                    otherIssues: snapshot.data!.edtDetails!,
                  );
                } else if (snapshot.hasError) {
                  return const Text("Couldn't load data");
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}


// FutureBuilder<Editions>(
//           future: getEditions,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               debugPrint("Latest issue Loaded");
//               return LatestEdition(
//                 issueDate: snapshot.data!.edtDetails!.first.editionName!,
//                 issueImg: snapshot.data!.edtDetails!.first.editionImage!,
//                 issueId: snapshot.data!.edtDetails!.first.editionName!,
//                 issuePrice: snapshot.data!.edtDetails!.first.editionPrice!,
//               );
//             } else if (snapshot.hasError) {
//               return const Text("Couldn't load data");
//             }
//             return const CircularProgressIndicator();
//           },
//         ),
//         //LatestEdition(),
//         Gap(AppLayout.getHeight(30)),
//         Gap(AppLayout.getHeight(30)),
//         // FutureBuilder<Editions>(
//         //   future: getEditions,
//         //   builder: (context, snapshot) {
//         //     if (snapshot.hasData) {
//         //       debugPrint("List loaded");
//         //       snapshot.data!.edtDetails!.map((e) {
//         //         return IssuesList(
//         //           issueItems: e,
//         //         );
//         //       });
//         //     } else if (snapshot.hasError) {
//         //       return const Text("Couldn't load data");
//         //     }
//         //     return const CircularProgressIndicator();
//         //   },
//         // ),
//         // Gap(AppLayout.getHeight(30)),
//         FutureBuilder<Editions>(
//           future: getEditions,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               debugPrint("List loaded");
//               return OtherIssues(
//                 otherIssues: snapshot.data!.edtDetails!,
//               );
//             } else if (snapshot.hasError) {
//               return const Text("Couldn't load data");
//             }
//             return const CircularProgressIndicator();
//           },
//         ),