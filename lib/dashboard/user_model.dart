import 'dart:convert';

class UserModel {
  String? id;

  String? uname;
  String? flatNo;
  String? email;
  String? contactNo;
  String ? avatar;
  int ? vechileCount;

  UserModel({
    this.id,
    this.uname,
    this.flatNo,
    this.email,
    this.contactNo,
    this.avatar,
    this.vechileCount
  });

  factory UserModel.fromjson(Map<String, dynamic> data) {
    return UserModel(
      uname: data['uname'],
      flatNo: data['flat_no'],
      email: data['email'],
      contactNo: data['contact'],
      id: data['user_id'],
      avatar: data['avatar'],
      vechileCount: data['vechile_count']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uname'] = this.uname;
    data['flat_no'] = this.flatNo;
    data['email'] = this.email;

    data['id'] = this.id;
    data['avatar'] = this.avatar;
    data['vechile_count'] = this.vechileCount;


    return data;
  }
}
