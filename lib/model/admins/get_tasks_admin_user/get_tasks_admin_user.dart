class TasksAdminUserModel {
  Data? data;
  int? status;
  String? message;

  TasksAdminUserModel({this.data, this.status, this.message});

  TasksAdminUserModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];
  }
}

class Data {
  int? id;
  String? title;
  String? branchId;
  Branch? branch;
  int? adminId;
  Admin? admin;
  List<Sections>? sections;
  List<Users>? users;
  String? desc;
  String? img;
  dynamic status;
  String? startDate;
  String? endDate;

  Data(
      {this.id,
      this.title,
      this.branchId,
      this.branch,
      this.adminId,
      this.admin,
      this.sections,
      this.users,
      this.desc,
      this.img,
      this.status,
      this.startDate,
      this.endDate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    branchId = json['branch_id'];
    branch =
        json['branch'] != null ? new Branch.fromJson(json['branch']) : null;
    adminId = json['admin_id'];
    admin = json['admin'] != null ? new Admin.fromJson(json['admin']) : null;
    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections!.add(new Sections.fromJson(v));
      });
    }
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(new Users.fromJson(v));
      });
    }
    desc = json['desc'];
    img = json['img'];
    status = json['status'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }
}

class Branch {
  int? id;
  String? name;
  String? lat;
  String? lng;
  String? location;
  String? img;

  Branch({this.id, this.name, this.lat, this.lng, this.location, this.img});

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lat = json['lat'];
    lng = json['lng'];
    location = json['location'];
    img = json['img'];
  }
}

class Admin {
  int? id;
  String? name;
  String? email;
  String? img;
  String? userType;

  Admin({this.id, this.name, this.email, this.img, this.userType});

  Admin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    img = json['img'];
    userType = json['user_type'];
  }
}

class Sections {
  int? id;
  String? name;
  int? branchId;
  BranchData? branchData;

  Sections({this.id, this.name, this.branchId, this.branchData});

  Sections.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    branchId = json['branch_id'];
    branchData =
        json['branch'] != null ? new BranchData.fromJson(json['branch']) : null;
  }
}

class BranchData {
  int? id;
  String? name;

  BranchData({this.id, this.name});

  BranchData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class Users {
  int? id;
  String? name;
  String? email;
  String? img;
  String? jobTitle;
  String? jobDesc;
  String? kpis;
  int? branchId;
  int? sectionId;
  String? userType;

  Users(
      {this.id,
      this.name,
      this.email,
      this.img,
      this.jobTitle,
      this.jobDesc,
      this.kpis,
      this.branchId,
      this.sectionId,
      this.userType});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    img = json['img'];
    jobTitle = json['job_title'];
    jobDesc = json['job_desc'];
    kpis = json['kpis'];
    branchId = json['branch_id'];
    sectionId = json['section_id'];
    userType = json['user_type'];
  }
}
