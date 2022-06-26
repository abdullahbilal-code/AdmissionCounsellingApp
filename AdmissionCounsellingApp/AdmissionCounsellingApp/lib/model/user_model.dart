class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? lastName;
  //String? phonenum;
  UserModel({
    this.uid,
    this.email,
    this.firstName,
    this.lastName,
    /*this.phonenum*/
  });

  //Data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstname'],
      lastName: map['lastname'],
      //phonenum: map['phonenumber']
    );
  }

  //Data send server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstname': firstName,
      'lastname': lastName,
      //'phonenum': phonenum,
    };
  }
}
