import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:newsapp/utils/app_layout.dart';
import 'package:newsapp/utils/app_style.dart';

class IssuesView extends StatefulWidget {
  const IssuesView({super.key});

  @override
  State<IssuesView> createState() => _IssuesViewState();
}

class _IssuesViewState extends State<IssuesView> {
  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getsize(context);
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
                    "Issue Date",
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
        Text("Newspaper name")
      ],
    );
  }
}
