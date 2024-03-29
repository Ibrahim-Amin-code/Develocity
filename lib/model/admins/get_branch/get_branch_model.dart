class GetBranchModel {
  List<Data>? data;
  int? status;
  String? message;

  GetBranchModel({this.data, this.status, this.message});

  GetBranchModel.fromJson(Map<String, dynamic> json) {
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
  String? lat;
  String? lng;
  String? location;
  String? img;

  Data({this.id, this.name, this.lat, this.lng, this.location, this.img});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lat = json['lat'];
    lng = json['lng'];
    location = json['location'];
    img = json['img'];
  }
}
