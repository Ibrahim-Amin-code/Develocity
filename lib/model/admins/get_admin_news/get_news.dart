// ignore_for_file: unnecessary_new, prefer_collection_literals

class GetAdminNewsModel {
  List<Data>? data;
  int? status;
  String? message;

  GetAdminNewsModel({this.data, this.status, this.message});

  GetAdminNewsModel.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? desc;
  String? img;
  int? typeId;
  dynamic type;
  int? branchId;
  Branch? branch;

  Data(
      {this.id,
      this.title,
      this.desc,
      this.img,
      this.typeId,
      this.type,
      this.branchId,
      this.branch});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    desc = json['desc'];
    img = json['img'];
    typeId = json['type_id'];
    type = json['type'];
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
