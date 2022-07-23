class GetAllAdminsModel {
  List<Data>? data;
  int? status;
  String? message;

  GetAllAdminsModel({this.data, this.status, this.message});

  GetAllAdminsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? img;
  String? userType;

  Data({this.id, this.name, this.email, this.img, this.userType});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    img = json['img'];
    userType = json['user_type'];
  }
}
