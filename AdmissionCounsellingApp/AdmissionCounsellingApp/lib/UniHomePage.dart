import 'package:admissioncounsellingapp/AboutUniversity.dart';
import 'package:admissioncounsellingapp/AddAboutCampus.dart';
import 'package:admissioncounsellingapp/AdmissionInformation.dart';
import 'package:admissioncounsellingapp/adminProfile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class uniHomeScreen extends StatefulWidget {
  const uniHomeScreen({Key? key}) : super(key: key);

  @override
  State<uniHomeScreen> createState() => _uniHomeScreenState();
}

class _uniHomeScreenState extends State<uniHomeScreen> {
  String? adminName;
  String? uniName;
  String phno = "No record";
  String gender = "No record";
  String age = "No record";

  String? aboutUni;
  String? uniHistory;
  String? uniVision;
  String? uniMission;
  String? uniGoal;

  Future<void> getadmindata() async {
    User? user = await FirebaseAuth.instance.currentUser;
    var var1 = FirebaseFirestore.instance
        .collection("university")
        .doc(user!.uid)
        .get();
    setState(() {
      //adminName=var1['adminName']
    });
  }

  Future<void> getUnidata() async {
    User? user = await FirebaseAuth.instance.currentUser;
    final Future<DocumentSnapshot<Map<String, dynamic>>> uniDoc =
        FirebaseFirestore.instance
            .collection("university")
            .doc(user!.uid)
            .collection("uniInfo")
            .doc()
            .get();
    //aboutUni=uniDoc.
  }

  void initState() {
    getadmindata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 36.0, horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Hello Admin!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Please upload all the information related to the university."
                        "So students will get to knnow about your university.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Center(
                          child: Wrap(
                            spacing: 20.0,
                            runSpacing: 20.0,
                            children: [
                              SizedBox(
                                width: 140.0,
                                height: 140.0,
                                child: MaterialButton(
                                  onPressed: () {
                                    final _auth = FirebaseAuth.instance;
                                    User? adminuser = _auth.currentUser;
                                    DocumentReference document =
                                        FirebaseFirestore.instance
                                            .collection("university")
                                            .doc(adminuser!.uid);
                                    document.get();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AdminProfile()));
                                  },
                                  color: Colors.lightBlueAccent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        children: [
                                          Image.asset("assets/profile.png"),
                                          SizedBox(height: 10.0),
                                          Text(
                                            "Admin Profile",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 140.0,
                                height: 140.0,
                                child: MaterialButton(
                                  onPressed: () {},
                                  color: Colors.lightBlueAccent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        children: [
                                          Image.asset("assets/university.png"),
                                          //SizedBox(height: 10.0),
                                          Text(
                                            "University",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                          Text(
                                            "Profile",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 140.0,
                                height: 141.0,
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DataAboutUniversity()));
                                  },
                                  color: Colors.lightBlueAccent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        children: [
                                          Image.asset("assets/forms.png"),
                                          SizedBox(height: 1.0),
                                          Text(
                                            "About",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                          Text(
                                            "University",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 140.0,
                                height: 140.0,
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddCampusData()));
                                  },
                                  color: Colors.lightBlueAccent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                              "assets/universitycampus.png"),
                                          SizedBox(height: 10.0),
                                          Text(
                                            "Campuses",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 140.0,
                                height: 140.0,
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const admissionInformation()));
                                  },
                                  color: Colors.lightBlueAccent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                              "assets/newadmission.png"),
                                          //SizedBox(height: 10.0),
                                          Text(
                                            "New Year",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                          Text(
                                            "Admissions",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 140.0,
                                height: 140.0,
                                child: MaterialButton(
                                  onPressed: () {
                                    //logout(context);
                                  },
                                  color: Colors.lightBlueAccent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Image.asset("assets/logout.png"),
                                          SizedBox(height: 10.0),
                                          Text(
                                            "logout",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
