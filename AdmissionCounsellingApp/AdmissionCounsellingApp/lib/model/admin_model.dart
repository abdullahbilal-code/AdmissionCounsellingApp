class AdminModel {
  String? uid;
  String? email;
  String? adminName;
  String? uniName;
  String? role;
  AdminModel({this.uid, this.email, this.adminName, this.uniName, this.role});

  //Data from server
  factory AdminModel.fromMap(map) {
    return AdminModel(
        uid: map['uid'],
        email: map['email'],
        adminName: map['adminName'],
        uniName: map['uniName']);
  }

  // sending data
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'adminName': adminName,
      'uniName': uniName,
      'role': role,
    };
  }
}
