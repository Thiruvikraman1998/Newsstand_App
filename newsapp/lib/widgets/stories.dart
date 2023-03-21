import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:newsapp/utils/app_layout.dart';

class StoriesView extends StatelessWidget {
  final String? thumb;
  final String? magname;
  final String? issuename;
  final String? title;
  final String? timeRead;
  const StoriesView({
    super.key,
    required this.thumb,
    required this.magname,
    required this.issuename,
    required this.title,
    required this.timeRead,
  });

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getsize(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.amber,
        height: 200,
        width: size.width,
        child: Stack(
          children: [articleThumbnail(), buildGradient(), buildTitle()],
        ),
      ),
    );
  }
}

Widget articleThumbnail() {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
          image: NetworkImage(
            "https://reseuro.magzter.com/300x155/articles/190/1249476/SsP0c0o8c1679039238451/crp_RENAISSANCE-MAN.jpg",
          ),
          fit: BoxFit.cover),
    ),
  );
}

Widget buildGradient() {
  return Positioned.fill(
    child: DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.3, 0.85],
        ),
      ),
    ),
  );
}

Widget buildTitle() {
  return Positioned(
    left: 20,
    bottom: 20,
    child: Container(
      height: 42,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Filmfare",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.orange[800]),
              ),
              Gap(AppLayout.getWidth(5)),
              Text(
                "|",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: Colors.orange[800]),
              ),
              Gap(AppLayout.getWidth(5)),
              Text(
                "March 2023",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.orange[800]),
              )
            ],
          ),
          // Gap(AppLayout.getHeight(5)),
          // const Text(
          //   "Renaissance Man",
          //   style: TextStyle(color: Colors.white, fontSize: 18),
          // ),
          Gap(AppLayout.getHeight(5)),
          Row(
            children: [
              Icon(
                Icons.access_time_rounded,
                size: 15,
                color: Colors.white60,
              ),
              Gap(AppLayout.getWidth(8)),
              Text(
                "Time read",
                style: TextStyle(color: Colors.white60),
              )
            ],
          )
        ],
      ),
    ),
  );
}
