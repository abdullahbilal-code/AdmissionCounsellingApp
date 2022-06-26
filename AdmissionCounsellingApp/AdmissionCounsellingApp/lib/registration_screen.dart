import 'package:admissioncounsellingapp/home_screen.dart';
import 'package:admissioncounsellingapp/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final firstNameEditingcontroller = new TextEditingController();
  final lastNameEditingcontroller = new TextEditingController();
  final emailEditingcontroller = new TextEditingController();
  final passwardEditingcontroller = new TextEditingController();
  final confirmPasswardEditingcontroller = new TextEditingController();
  final phonenumberEditingcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //first Name Field
    final firstNameField = TextFormField(
      autofocus: false,
      controller: firstNameEditingcontroller,
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
      onSaved: (value) {
        firstNameEditingcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //Last Name Field
    final lastNameField = TextFormField(
      autofocus: false,
      controller: lastNameEditingcontroller,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Second Name cannot be empty");
        }
        return null;
      },
      onSaved: (value) {
        lastNameEditingcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Last Name",
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
          return ("Please Enter your email..!");
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
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final passwardField = TextFormField(
      autofocus: true,
      controller: passwardEditingcontroller,
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

    /*final phonenumberfield = TextFormField(
      autofocus: false,
      controller: phonenumberEditingcontroller,
      //obscureText: true,
      validator: (value) {
        RegExp _regExp =
            new RegExp(r'^((\\+92)?(0092)?(92)?(0)?)(3)([0-9]{9})$/gm');
        if (value!.isEmpty) {
          return ('Please Enter your phone number');
        }
        if (!_regExp.hasMatch(value)) {
          return 'please enter valid phone number';
        }
        return null;
      },
      onSaved: (value) {
        phonenumberEditingcontroller.text = value!;
      },
      textInputAction: TextInputAction.none,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.phone),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Phone number",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );*/

    final signup = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
        onPressed: () {
          signUp(emailEditingcontroller.text, passwardEditingcontroller.text);
        },
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                      child: Image.asset(
                        "assets/logo.jpg",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    firstNameField,
                    SizedBox(
                      height: 25,
                    ),
                    lastNameField,
                    SizedBox(
                      height: 25,
                    ),
                    emailField,
                    SizedBox(
                      height: 25,
                    ),
                    //phonenumberfield,
                    SizedBox(
                      height: 25,
                    ),
                    passwardField,
                    SizedBox(
                      height: 25,
                    ),
                    confirmPasswardField,
                    SizedBox(
                      height: 25,
                    ),
                    signup
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {sendDetailtoFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      }).catchError((onError) {
        Fluttertoast.showToast(msg: onError!.message);
      });
    }
  }

  sendDetailtoFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingcontroller.text;
    userModel.lastName = lastNameEditingcontroller.text;
    //userModel.phonenum = phonenumberEditingcontroller.text;
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: 'Account is Successfully Created');
    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => homeScreen()),
        (route) => false);
  }
}
