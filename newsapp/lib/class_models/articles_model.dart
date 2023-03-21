import 'dart:convert';
import 'package:http/http.dart' as http;

class Stories {
  List<Articles>? articles;

  Stories({this.articles});

  Stories.fromJson(Map<String, dynamic> json) {
    if (json['stories'] != null) {
      articles = <Articles>[];
      json['stories'].forEach((v) {
        articles!.add(Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.articles != null) {
      data['stories'] = this.articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles extends Stories {
  String? url;
  String? magid;
  String? issueid;
  String? issuename;
  String? pgno;
  int? articletype;
  String? cat;
  String? pages;
  String? title;
  String? shortDesc;
  String? thumb;
  String? baseImg;
  String? magname;
  String? timeRead;
  int? totalPages;

  Articles({
    this.url,
    this.magid,
    this.issueid,
    this.issuename,
    this.pgno,
    this.articletype,
    this.cat,
    this.pages,
    this.title,
    this.shortDesc,
    this.thumb,
    this.baseImg,
    this.magname,
    this.totalPages,
    this.timeRead,
  });

  Articles.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    magid = json['magid'];
    issueid = json['issueid'];
    issuename = json['issuename'];
    pgno = json['pgno'];
    articletype = json['articletype'];
    cat = json['cat'];
    pages = json['pages'];
    title = json['title'];
    shortDesc = json['shortDesc'];
    thumb = json['thumb'];
    baseImg = json['baseImg'];
    magname = json['magname'];
    totalPages = json['totalPages'];
    timeRead = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['url'] = this.url;
    data['magid'] = this.magid;
    data['issueid'] = this.issueid;
    data['issuename'] = this.issuename;
    data['pgno'] = this.pgno;
    data['articletype'] = this.articletype;
    data['cat'] = this.cat;
    data['pages'] = this.pages;
    data['title'] = this.title;
    data['short_desc'] = this.shortDesc;
    data['thumb'] = this.thumb;
    data['base_img'] = this.baseImg;
    data['magname'] = this.magname;
    data['time_read'] = this.timeRead;
    data['totalPages'] = this.totalPages;

    return data;
  }
}

String storiesUrl =
    "https://sls.magzter.com/maglists/prod/v1/article-filter?storeID=1&magid=190&age_rating=9&lang_code=";

Future<Stories> parseStories() async {
  final response = await http.get(Uri.parse(storiesUrl));
  if (response.statusCode == 200) {
    return Stories.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Couldn't load stories");
  }
}
