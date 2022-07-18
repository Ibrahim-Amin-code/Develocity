// class UserLoginModel {
//   Data? data;
//   int? status;
//   String? message;

//   UserLoginModel({this.data, this.status, this.message});

//   UserLoginModel.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//     status = json['status'];
//     message = json['message'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  <String, dynamic>{};
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['status'] = status;
//     data['message'] = message;
//     return data;
//   }
// }

// class Data {
//   User? user;
//   String? token;

//   Data({this.user, this.token});

//   Data.fromJson(Map<String, dynamic> json) {
//     user = json['user'] != null ? User.fromJson(json['user']) : null;
//     token = json['token'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (user != null) {
//       data['user'] = user!.toJson();
//     }
//     data['token'] = token;
//     return data;
//   }
// }

// class User {
//   int? id;
//   String? name;
//   String? email;
//   String? img;
//   String? jobTitle;
//   String? jobDesc;
//   String? kpis;
//   int? branchId;
//   int? sectionId;
//   String? userType;

//   User(
//       {this.id,
//         this.name,
//         this.email,
//         this.img,
//         this.jobTitle,
//         this.jobDesc,
//         this.kpis,
//         this.branchId,
//         this.sectionId,
//         this.userType});

//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     img = json['img'];
//     jobTitle = json['job_title'];
//     jobDesc = json['job_desc'];
//     kpis = json['kpis'];
//     branchId = json['branch_id'];
//     sectionId = json['section_id'];
//     userType = json['user_type'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['email'] = email;
//     data['img'] = img;
//     data['job_title'] = jobTitle;
//     data['job_desc'] = jobDesc;
//     data['kpis'] = kpis;
//     data['branch_id'] = branchId;
//     data['section_id'] = sectionId;
//     data['user_type'] = userType;
//     return data;
//   }
// }