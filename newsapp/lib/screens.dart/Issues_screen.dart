import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:newsapp/utils/app_layout.dart';
import 'package:newsapp/utils/app_style.dart';
import 'package:newsapp/widgets/dropdown.dart';

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
        Text("Newspaper name"),
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
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://cdn.magzter.com/1587650944/1679115618/images/thumb/390_thumb_1.jpg"),
                    ),
                  ),
                ),
                Gap(AppLayout.getHeight(8)),
                const Text(
                  "Read",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
        ),
        Gap(AppLayout.getHeight(30)),
        DropDown(),
      ],
    );
  }
}
