import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataAboutUniversity extends StatefulWidget {
  const DataAboutUniversity({Key? key}) : super(key: key);

  @override
  State<DataAboutUniversity> createState() => _DataAboutUniversityState();
}

class _DataAboutUniversityState extends State<DataAboutUniversity> {
  final _formKey = GlobalKey<FormState>();
  final aboutUniveristyEditingcontroller = new TextEditingController();
  final universityHistoryEditingcontroller = new TextEditingController();
  final universityVisionEditingcontroller = new TextEditingController();
  final universityMissionEditingcontroller = new TextEditingController();
  final univeristyGoalEditingcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AboutUniversityField = TextFormField(
      autofocus: false,
      controller: aboutUniveristyEditingcontroller,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter About University");
        }
        /*if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        return ("Please Enter Valid email");
      }*/
        return null;
      },
      onSaved: (value) {
        aboutUniveristyEditingcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          labelText: "About University",
          //labelStyle: TextStyle(fontSize: 24),
          hintText: "Enter About University",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
      obscureText: false,
      maxLines: 3,
    );

    final UniversityHistoryField = TextFormField(
      autofocus: false,
      controller: universityHistoryEditingcontroller,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Enter University History");
        }
        /*if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        return ("Please Enter Valid email");
      }*/
        return null;
      },
      onSaved: (value) {
        universityHistoryEditingcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          labelText: "History",
          //labelStyle: TextStyle(fontSize: 24),
          hintText: "Enter History",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
      obscureText: false,
      maxLines: 3,
    );
    final UniversityVisionField = TextFormField(
      autofocus: false,
      controller: universityVisionEditingcontroller,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter University vision");
        }
        /*if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        return ("Please Enter Valid email");
      }*/
        return null;
      },
      onSaved: (value) {
        universityVisionEditingcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          labelText: "Vision",
          //labelStyle: TextStyle(fontSize: 24),
          hintText: "Enter university Vision",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
      obscureText: false,
      maxLines: 3,
    );
    final UniversityMissionField = TextFormField(
      autofocus: false,
      controller: universityMissionEditingcontroller,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter About University");
        }
        /*if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        return ("Please Enter Valid email");
      }*/
        return null;
      },
      onSaved: (value) {
        universityMissionEditingcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          labelText: "Mission",
          //labelStyle: TextStyle(fontSize: 24),
          hintText: "Enter University mission",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
      obscureText: false,
      maxLines: 3,
    );
    final UniversityGoalField = TextFormField(
      autofocus: false,
      controller: univeristyGoalEditingcontroller,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Enter University Goal");
        }
        /*if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        return ("Please Enter Valid email");
      }*/
        return null;
      },
      onSaved: (value) {
        univeristyGoalEditingcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          labelText: "Goal",
          //labelStyle: TextStyle(fontSize: 24),
          hintText: "Enter University Goal",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
      obscureText: false,
      maxLines: 3,
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
              "aboutUniversity": aboutUniveristyEditingcontroller.text,
              "UniversityHistory": universityHistoryEditingcontroller.text,
              "Universityvision": universityVisionEditingcontroller.text,
              "UniversityMission": universityMissionEditingcontroller.text,
              "Universitygoal": univeristyGoalEditingcontroller.text,
            };
            String s = univeristyGoalEditingcontroller.text.toString();
            firebaseFirestore
                .collection("university")
                .doc(adminuser!.uid)
                .collection("uniInfo")
                .add(data);
          }
        },
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        child: Text(
          "Upload Data",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('University Information'),
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
                    AboutUniversityField,
                    SizedBox(
                      height: 25,
                    ),
                    UniversityHistoryField,
                    SizedBox(
                      height: 25,
                    ),
                    UniversityVisionField,
                    SizedBox(
                      height: 25,
                    ),
                    UniversityMissionField,
                    SizedBox(
                      height: 25,
                    ),
                    UniversityGoalField,
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
