import 'package:admissioncounsellingapp/UniversityLoginScreen.dart';
import 'package:admissioncounsellingapp/model/admin_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UniversitySignup extends StatefulWidget {
  const UniversitySignup({Key? key}) : super(key: key);

  @override
  _UniversitySignupState createState() => _UniversitySignupState();
}

class _UniversitySignupState extends State<UniversitySignup> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final adminNameEditingcontroller = new TextEditingController();
  final uniNameEditingcontroller = new TextEditingController();
  final emailEditingcontroller = new TextEditingController();
  final passwardEditingcontroller = new TextEditingController();
  final confirmPasswardEditingcontroller = new TextEditingController();
  final String role = "admin";
  @override
  Widget build(BuildContext context) {
    final NameField = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Please Enter your name");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter valid name(Minimum 3 characters)");
        }
        return null;
      },
      controller: adminNameEditingcontroller,
      onSaved: (value) {
        adminNameEditingcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "User Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //Last Name Field
    final UniversityNameField = TextFormField(
      autofocus: false,
      controller: uniNameEditingcontroller,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("University Name Cannot be empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter valid name(Minimum 3 characters)");
        }
        return null;
      },
      onSaved: (value) {
        uniNameEditingcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "University Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingcontroller,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter university email..!");
        }
        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return ("Please Enter Valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailEditingcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "University Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final passwardField = TextFormField(
      autofocus: true,
      controller: passwardEditingcontroller,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Please Enter the password");
        }
        if (!regex.hasMatch(value)) {
          return ("Please enter valid Password(Minimum 6 characters)");
        }
      },
      onSaved: (value) {
        passwardEditingcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Passward",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final confirmPasswardField = TextFormField(
      autofocus: false,
      controller: confirmPasswardEditingcontroller,
      obscureText: true,
      validator: (value) {
        if (confirmPasswardEditingcontroller.text !=
            passwardEditingcontroller.text) {
          return ('Password do not match');
        }
      },
      onSaved: (value) {
        confirmPasswardEditingcontroller.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Passward",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final signup = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
        onPressed: () {
          signUp(emailEditingcontroller.text, passwardEditingcontroller.text);
        },
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        child: Text(
          "Signup",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.lightBlueAccent,
                Colors.blue,
              ],
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 36.0, horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Create Account",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Already have Account? ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const UniversityLogin()));
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Form(
                      key: _formKey,
                      child: Column(children: <Widget>[
                        SizedBox(
                          height: 0,
                        ),
                        NameField,
                        SizedBox(
                          height: 12,
                        ),
                        UniversityNameField,
                        SizedBox(
                          height: 12,
                        ),
                        emailField,
                        SizedBox(
                          height: 12,
                        ),
                        passwardField,
                        SizedBox(
                          height: 12,
                        ),
                        confirmPasswardField,
                        SizedBox(
                          height: 12,
                        ),
                        signup,
                      ]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailtoFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailtoFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? adminuser = _auth.currentUser;
    AdminModel adminModel = AdminModel();
    adminModel.email = adminuser!.email;
    adminModel.uid = adminuser.uid;
    adminModel.adminName = adminNameEditingcontroller.text;
    adminModel.uniName = uniNameEditingcontroller.text;
    adminModel.role = role;
    await firebaseFirestore
        .collection("university")
        .doc(adminuser.uid)
        .set(adminModel.toMap());
    //.set(adminModel.toMap());
    Fluttertoast.showToast(msg: "Account Created Sucessfully");
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => UniversityLogin()),
        (route) => false);
  }
}
