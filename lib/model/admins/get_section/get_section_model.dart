// ignore_for_file: unnecessary_new

class GetSectionModel {
  List<Data>? data;
  int? status;
  String? message;

  GetSectionModel({this.data, this.status, this.message});

  GetSectionModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }
}

class Data {
  int? id;
  String? name;
  int? branchId;
  Branch? branch;

  Data({this.id, this.name, this.branchId, this.branch});

  Data.fromJson(Map<String, dynamic> json) {
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
