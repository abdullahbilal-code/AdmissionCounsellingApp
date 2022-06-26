import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class addOfferPrograms extends StatefulWidget {
  const addOfferPrograms({Key? key}) : super(key: key);

  @override
  State<addOfferPrograms> createState() => _addOfferProgramsState();
}

class _addOfferProgramsState extends State<addOfferPrograms> {
  final _formKey = GlobalKey<FormState>();
  final programnameEditingcontroller = new TextEditingController();
  final programdurationEditingcontroller = new TextEditingController();
  final teachingSystemEditingcontroller = new TextEditingController();
  final totalseatsEditingcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final programNameField = TextFormField(
      autofocus: false,
      controller: programnameEditingcontroller,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return (" Enter vision statement");
        }
        /*if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        return ("Please Enter Valid email");
      }*/
        return null;
      },
      onSaved: (value) {
        programnameEditingcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          labelText: "Name",
          //labelStyle: TextStyle(fontSize: 24),
          hintText: "Enter program name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
      obscureText: false,
      maxLines: 2,
    );
    final programdurtionField = TextFormField(
      autofocus: false,
      controller: programdurationEditingcontroller,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Enter program name");
        }
        /*if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        return ("Please Enter Valid email");
      }*/
        return null;
      },
      onSaved: (value) {
        programdurationEditingcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          labelText: "Duration",
          //labelStyle: TextStyle(fontSize: 24),
          hintText: "i.e 4 Years",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
      obscureText: false,
      maxLines: 2,
    );
    final teachingsystemField = TextFormField(
      autofocus: false,
      controller: teachingSystemEditingcontroller,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Enter Campus Name");
        }
        /*if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        return ("Please Enter Valid email");
      }*/
        return null;
      },
      onSaved: (value) {
        teachingSystemEditingcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          labelText: "Teaching System",
          //labelStyle: TextStyle(fontSize: 24),
          hintText: "Samester/Yearly",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
      obscureText: false,
      maxLines: 2,
    );
    final totalseatsField = TextFormField(
      autofocus: false,
      controller: totalseatsEditingcontroller,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Enter Campus Name");
        }
        /*if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        return ("Please Enter Valid email");
      }*/
        return null;
      },
      onSaved: (value) {
        totalseatsEditingcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          labelText: "Seats",
          //labelStyle: TextStyle(fontSize: 24),
          hintText: "Enter total seats",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
      obscureText: false,
      maxLines: 2,
    );

    final UploadButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            final _auth = FirebaseAuth.instance;
            User? adminuser = _auth.currentUser;
            print(adminuser.toString());
            FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
            Map<String, dynamic> data = {
              "programName": programnameEditingcontroller.text,
              "programDuration": programdurationEditingcontroller.text,
              "teachingSystem": teachingSystemEditingcontroller.text,
              "totalSeats": totalseatsEditingcontroller.text,
            };
            //String s = deptNameEditingcontroller.text.toString();
            firebaseFirestore
                .collection("university")
                .doc(adminuser!.uid)
                .collection("DepartmentsPrograms")
                .add(data);
          }
        },
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        child: Text(
          "Upload",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Offer program'),
        centerTitle: true,
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
                      height: 20,
                    ),
                    programNameField,
                    SizedBox(
                      height: 25,
                    ),
                    totalseatsField,
                    SizedBox(
                      height: 25,
                    ),
                    programdurtionField,
                    SizedBox(
                      height: 25,
                    ),
                    teachingsystemField,
                    SizedBox(
                      height: 25,
                    ),
                    UploadButton,
                    SizedBox(
                      height: 25,
                    ),
                    //signup
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
