class UsersComplaintsModelForAdmin {
  List<Data>? data;
  int? status;
  String? message;

  UsersComplaintsModelForAdmin({this.data, this.status, this.message});

  UsersComplaintsModelForAdmin.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? message;
  String? type;
  int? userId;
  int? taskId;

  Data(
      {this.id, this.title, this.message, this.type, this.userId, this.taskId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    message = json['message'];
    type = json['type'];
    userId = json['user_id'];
    taskId = json['task_id'];
  }
}
