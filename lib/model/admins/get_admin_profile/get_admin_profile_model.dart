class GetAdminProfileModel {
  Data? data;
  int? status;
  String? message;

  GetAdminProfileModel({this.data, this.status, this.message});

  GetAdminProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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
