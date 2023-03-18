import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Cities {
  List<OtherEditions>? otherEditions;

  Cities({this.otherEditions});

  Cities.fromJson(Map<String, dynamic> json) {
    if (json["otherEditions"] != null) {
      otherEditions = <OtherEditions>[];
      json["otherEditions"].foreach((value) {
        otherEditions!.add(OtherEditions.fromJson(value));
      });
    }
  }
  Map<String, dynamic>? toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.otherEditions != null) {
      data["otherEditions"] =
          this.otherEditions!.map((e) => e.toJson()).toList();
    }
  }
}

class OtherEditions {
  int? mid;
  String? edtName;
  int? currentEdt;
  String? edtSlug;

  OtherEditions({this.mid, this.edtName, this.currentEdt, this.edtSlug});

  OtherEditions.fromJson(Map<String, dynamic> json) {
    mid = json["mid"];
    edtName = json["edtName"];
    currentEdt = json["currentEdt"];
    edtSlug = json["edtSlug"];
  }
  Map<String, dynamic>? toJson() {
    final Map<String, dynamic> cities = Map<String, dynamic>();
    cities["mid"] = this.mid;
    cities["edtName"] = this.edtName;
    cities["currentEdt"] = this.currentEdt;
    cities["edtSlug"] = this.edtSlug;
  }
}
