class GetAdminNewsTypeModel {
  List<DataNewsType>? data;
  int? status;
  String? message;

  GetAdminNewsTypeModel({this.data, this.status, this.message});

  GetAdminNewsTypeModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataNewsType>[];
      json['data'].forEach((v) {
        data!.add(DataNewsType.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }
}

class DataNewsType {
  int? id;
  String? title;

  DataNewsType({this.id, this.title});

  DataNewsType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }
}
