class GetAdminUsersModel {
  List<AdminUserData>? data;
  int? status;
  String? message;

  GetAdminUsersModel({this.data, this.status, this.message});

  GetAdminUsersModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AdminUserData>[];
      json['data'].forEach((v) {
        data!.add(new AdminUserData.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }
}

class AdminUserData {
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

  AdminUserData(
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

  AdminUserData.fromJson(Map<String, dynamic> json) {
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
