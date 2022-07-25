class TasksAdminUserModel {
  List<Data>? data;
  int? status;
  String? message;

  TasksAdminUserModel({this.data, this.status, this.message});

  TasksAdminUserModel.fromJson(Map<String, dynamic> json) {
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
  int? branchId;
  Branch? branch;
  int? adminId;
  Admin? admin;
  List<Sections>? sections;
  List<Users>? users;
  String? desc;
  String? img;
  String? status;
  String? startDate;
  String? endDate;
  String? createdAt;

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
      this.endDate,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    branchId = json['branch_id'];
    branch = json['branch'] != null ? Branch.fromJson(json['branch']) : null;
    adminId = json['admin_id'];
    admin = json['admin'] != null ? Admin.fromJson(json['admin']) : null;
    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections!.add(Sections.fromJson(v));
      });
    }
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(Users.fromJson(v));
      });
    }
    desc = json['desc'];
    img = json['img'];
    status = json['status'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    createdAt = json['created_at'];
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
  Branch? branch;

  Sections({this.id, this.name, this.branchId, this.branch});

  Sections.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    branchId = json['branch_id'];
    branch = json['branch'] != null ? Branch.fromJson(json['branch']) : null;
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
  Branch? branch;
  int? sectionId;
  dynamic section;
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
      this.branch,
      this.sectionId,
      this.section,
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
    branch = json['branch'] != null ? Branch.fromJson(json['branch']) : null;
    sectionId = json['section_id'];
    section = json['section'];
    userType = json['user_type'];
  }
}
