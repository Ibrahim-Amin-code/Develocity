class UsersRequirementsModelForAdmin {
  List<Data>? data;
  int? status;
  String? message;

  UsersRequirementsModelForAdmin({this.data, this.status, this.message});

  UsersRequirementsModelForAdmin.fromJson(Map<String, dynamic> json) {
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
  String? price;
  String? status;
  int? userId;
  User? user;
  int? taskId;
  Task? task;

  Data(
      {this.id,
      this.title,
      this.price,
      this.status,
      this.userId,
      this.user,
      this.taskId,
      this.task});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    status = json['status'];
    userId = json['user_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    taskId = json['task_id'];
    task = json['task'] != null ? Task.fromJson(json['task']) : null;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? img;
  String? jobTitle;
  String? jobDesc;
  String? kpis;
  int? branchId;
  Branch? branch;
  int? sectionId;
  dynamic section;
  String? userType;

  User(
      {this.id,
      this.name,
      this.email,
      this.img,
      this.jobTitle,
      this.jobDesc,
      this.kpis,
      this.branchId,
      this.branch,
      this.sectionId,
      this.section,
      this.userType});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    img = json['img'];
    jobTitle = json['job_title'];
    jobDesc = json['job_desc'];
    kpis = json['kpis'];
    branchId = json['branch_id'];
    branch = json['branch'] != null ? Branch.fromJson(json['branch']) : null;
    sectionId = json['section_id'];
    section = json['section'];
    userType = json['user_type'];
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

class Task {
  int? id;
  String? title;

  Task({this.id, this.title});

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }
}
