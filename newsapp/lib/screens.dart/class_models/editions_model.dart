import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Editions {
  List<EdtDetails>? edtDetails;

  Editions({this.edtDetails});

  Editions.fromJson(Map<String, dynamic> json) {
    if (json['edt_details'] != null) {
      edtDetails = <EdtDetails>[];
      json['edt_details'].forEach((v) {
        edtDetails!.add(EdtDetails.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.edtDetails != null) {
      data['edt_details'] = this.edtDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EdtDetails extends Editions {
  String? editionId;
  String? newImgPath;
  String? editionName;
  int? isSharing;
  String? editionDescription;
  String? editionImage;
  String? editionPrice;
  int? editionPublished;
  String? formatType;
  int? numberPages;

  EdtDetails({
    this.editionId,
    this.newImgPath,
    this.editionName,
    this.isSharing,
    this.editionDescription,
    this.editionImage,
    this.editionPrice,
    this.editionPublished,
    this.formatType,
    this.numberPages,
  });

  EdtDetails.fromJson(Map<String, dynamic> json) {
    editionId = json['editionId'];
    newImgPath = json['new_imgPath'];
    editionName = json['editionName'];
    isSharing = json['is_sharing'];
    editionDescription = json['editionDescription'];
    editionImage = json['editionImage'];
    editionPrice = json['editionPrice'];
    editionPublished = json['editionPublished'];
    formatType = json['format_type'];
    numberPages = json['number_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> editions = new Map<String, dynamic>();
    editions['editionId'] = this.editionId;
    editions['new_imgPath'] = this.newImgPath;
    editions['editionName'] = this.editionName;
    editions['is_sharing'] = this.isSharing;
    editions['editionDescription'] = this.editionDescription;
    editions['editionPriceIdentifierMynewsstand'] =
        editions['editionPrice'] = this.editionPrice;
    editions['editionPublished'] = this.editionPublished;
    editions['editionPriceIdentifierNewsstand'] =
        editions['number_pages'] = this.numberPages;
    return editions;
  }
}

String editionUrl =
    "https://sls.magzter.com/magservices/prod/getIssuesByMag?mid=21607";

Future<Editions> parseEditions() async {
  final response = await http.get(Uri.parse(editionUrl));
  if (response.statusCode == 200) {
    return Editions.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Editions couldn't load");
  }
}
