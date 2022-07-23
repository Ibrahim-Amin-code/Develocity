// ignore_for_file: unnecessary_new

class GetSectionModel {
  List<SectionData>? data;
  int? status;
  String? message;

  GetSectionModel({this.data, this.status, this.message});

  GetSectionModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SectionData>[];
      json['data'].forEach((v) {
        data!.add(SectionData.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }
}

class SectionData {
  int? id;
  String? name;
  int? branchId;
  Branch? branch;

  SectionData({this.id, this.name, this.branchId, this.branch});

  SectionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    branchId = json['branch_id'];
    branch =
        json['branch'] != null ? new Branch.fromJson(json['branch']) : null;
  }
}

class Branch {
  int? id;
  String? name;

  Branch({this.id, this.name});

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
