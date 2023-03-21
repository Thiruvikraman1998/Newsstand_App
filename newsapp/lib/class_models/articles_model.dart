import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Stories {
  int? nbHits;
  int? page;
  int? nbPages;
  int? hitsPerPage;
  int? timeTaken;
  List<Articles>? articles;

  Stories(
      {this.nbHits,
      this.page,
      this.nbPages,
      this.hitsPerPage,
      this.timeTaken,
      this.articles});

  Stories.fromJson(Map<String, dynamic> json) {
    nbHits = json['nbHits'];
    page = json['page'];
    nbPages = json['nbPages'];
    hitsPerPage = json['hitsPerPage'];
    timeTaken = json['time_taken'];
    if (json['Articles'] != null) {
      articles = <Articles>[];
      json['Articles'].forEach((v) {
        articles!.add(new Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nbHits'] = this.nbHits;
    data['page'] = this.page;
    data['nbPages'] = this.nbPages;
    data['hitsPerPage'] = this.hitsPerPage;
    data['time_taken'] = this.timeTaken;
    if (this.articles != null) {
      data['Articles'] = this.articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles {
  String? url;
  String? magid;
  String? issueid;
  String? issuename;
  String? artid;
  String? pgno;
  int? articletype;
  String? cat;
  String? pages;
  int? magcat;
  String? title;
  String? shortDesc;
  String? thumb;
  String? baseImg;
  String? format;
  int? date;
  String? magname;
  int? aType;
  int? agerate;
  String? language;
  String? langName;
  List<String>? section;
  String? timeRead;
  String? canonUrl;
  String? country;
  int? isrecommend;
  int? isInternational;
  int? totalPages;
  int? isLive;
  String? titlePage;
  String? imageHeight;
  String? imageWidth;
  String? shoppable;
  String? titleCoords;
  List<String>? entity1;

  Articles(
      {this.url,
      this.magid,
      this.issueid,
      this.issuename,
      this.artid,
      this.pgno,
      this.articletype,
      this.cat,
      this.pages,
      this.magcat,
      this.title,
      this.shortDesc,
      this.thumb,
      this.baseImg,
      this.format,
      this.date,
      this.magname,
      this.aType,
      this.agerate,
      this.language,
      this.langName,
      this.section,
      this.timeRead,
      this.canonUrl,
      this.country,
      this.isrecommend,
      this.isInternational,
      this.totalPages,
      this.isLive,
      this.titlePage,
      this.imageHeight,
      this.imageWidth,
      this.shoppable,
      this.titleCoords,
      this.entity1});

  Articles.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    magid = json['magid'];
    issueid = json['issueid'];
    issuename = json['issuename'];
    artid = json['artid'];
    pgno = json['pgno'];
    articletype = json['articletype'];
    cat = json['cat'];
    pages = json['pages'];
    magcat = json['magcat'];
    title = json['title'];
    shortDesc = json['short_desc'];
    thumb = json['thumb'];
    baseImg = json['base_img'];
    format = json['format'];
    date = json['date'];
    magname = json['magname'];
    aType = json['aType'];
    agerate = json['agerate'];
    language = json['language'];
    langName = json['langName'];
    section = json['section'].cast<String>();
    timeRead = json['time_read'];
    canonUrl = json['canon_url'];
    country = json['country'];
    isrecommend = json['isrecommend'];
    isInternational = json['isInternational'];
    totalPages = json['totalPages'];
    isLive = json['isLive'];
    titlePage = json['titlePage'];
    imageHeight = json['imageHeight'];
    imageWidth = json['imageWidth'];
    shoppable = json['shoppable'];
    titleCoords = json['titleCoords'];
    entity1 = json['entity1'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['magid'] = this.magid;
    data['issueid'] = this.issueid;
    data['issuename'] = this.issuename;
    data['artid'] = this.artid;
    data['pgno'] = this.pgno;
    data['articletype'] = this.articletype;
    data['cat'] = this.cat;
    data['pages'] = this.pages;
    data['magcat'] = this.magcat;
    data['title'] = this.title;
    data['short_desc'] = this.shortDesc;
    data['thumb'] = this.thumb;
    data['base_img'] = this.baseImg;
    data['format'] = this.format;
    data['date'] = this.date;
    data['magname'] = this.magname;
    data['aType'] = this.aType;
    data['agerate'] = this.agerate;
    data['language'] = this.language;
    data['langName'] = this.langName;
    data['section'] = this.section;
    data['time_read'] = this.timeRead;
    data['canon_url'] = this.canonUrl;
    data['country'] = this.country;
    data['isrecommend'] = this.isrecommend;
    data['isInternational'] = this.isInternational;
    data['totalPages'] = this.totalPages;
    data['isLive'] = this.isLive;
    data['titlePage'] = this.titlePage;
    data['imageHeight'] = this.imageHeight;
    data['imageWidth'] = this.imageWidth;
    data['shoppable'] = this.shoppable;
    data['titleCoords'] = this.titleCoords;
    data['entity1'] = this.entity1;
    return data;
  }
}

String storiesUrl =
    "https://sls.magzter.com/maglists/prod/v1/article-filter?storeID=1&magid=190&age_rating=9&lang_code=";

Future<Stories> parseStories() async {
  final response = await http.get(Uri.parse(storiesUrl));
  if (response.statusCode == 200) {
    debugPrint(response.statusCode.toString());
    debugPrint("333 ${Stories.fromJson(jsonDecode(response.body))}");
    return Stories.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Error");
  }
}
