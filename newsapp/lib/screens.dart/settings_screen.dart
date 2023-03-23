import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:newsapp/screens.dart/Login_screen.dart';
import 'package:newsapp/screens.dart/account_screen.dart';
import 'package:newsapp/screens.dart/articles_screen.dart';
import 'package:newsapp/screens.dart/magazine_details.dart';
import 'package:newsapp/screens.dart/sign_up.dart';
import 'package:newsapp/utils/app_layout.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getsize(context);
    final bool isLoggedIn = true;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.black54),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.black54,
              size: 30,
            ),
          ),
        ],
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Container(
            height: AppLayout.getHeight(200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    debugPrint("Account tapped");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AccountScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.person_rounded,
                        color: Colors.grey,
                      ),
                      Gap(AppLayout.getWidth(10)),
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        width: size.width * 0.85,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: AppLayout.getWidth(0.5),
                                color: Colors.grey),
                          ),
                        ),
                        child: const Text(
                          "Account",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint("Help tapped");
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.help_outline_sharp,
                        color: Colors.grey,
                      ),
                      Gap(AppLayout.getWidth(10)),
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        width: size.width * 0.85,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: AppLayout.getWidth(0.5),
                                color: Colors.grey),
                          ),
                        ),
                        child: Text(
                          "Help",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[850]),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint("About tapped");
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline_rounded,
                          color: Colors.grey),
                      Gap(AppLayout.getWidth(10)),
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        width: size.width * 0.85,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: AppLayout.getWidth(0.5),
                                color: Colors.grey),
                          ),
                        ),
                        child: Text(
                          "About",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[850]),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint("Rate us tapped");
                  },
                  child: Row(
                    children: [
                      Icon(Icons.star_border_rounded, color: Colors.grey),
                      Gap(AppLayout.getWidth(10)),
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        width: size.width * 0.85,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: AppLayout.getWidth(0.5),
                                color: Colors.grey),
                          ),
                        ),
                        child: Text(
                          "Rate us",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[850]),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
