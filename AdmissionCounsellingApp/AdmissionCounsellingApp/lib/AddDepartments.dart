import 'package:admissioncounsellingapp/EditorUpdateDeptInfo.dart';
import 'package:admissioncounsellingapp/MenuItem.dart';
import 'package:admissioncounsellingapp/Menu_Items.dart';
import 'package:admissioncounsellingapp/addofferprogram.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddDepartments extends StatefulWidget {
  const AddDepartments({Key? key}) : super(key: key);
  @override
  State<AddDepartments> createState() => _AddDepartmentsState();
}

class _AddDepartmentsState extends State<AddDepartments> {
  final _formKey = GlobalKey<FormState>();
  final deptvisionEditingcontroller = new TextEditingController();
  final deptmissionEditingcontroller = new TextEditingController();
  final deptNameEditingcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deptvisionField = TextFormField(
      autofocus: false,
      controller: deptvisionEditingcontroller,
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
        deptvisionEditingcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          labelText: "Vision statement",
          //labelStyle: TextStyle(fontSize: 24),
          hintText: "Enter vision statement",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
      obscureText: false,
      maxLines: 3,
    );
    final deptmissionField = TextFormField(
      autofocus: false,
      controller: deptmissionEditingcontroller,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Enter mission statement");
        }
        /*if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        return ("Please Enter Valid email");
      }*/
        return null;
      },
      onSaved: (value) {
        deptmissionEditingcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          labelText: "mission statement",
          //labelStyle: TextStyle(fontSize: 24),
          hintText: "Enter mission statement",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
      obscureText: false,
      maxLines: 3,
    );
    final DeptNameField = TextFormField(
      autofocus: false,
      controller: deptNameEditingcontroller,
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
        deptNameEditingcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          labelText: "Campus Name",
          //labelStyle: TextStyle(fontSize: 24),
          hintText: "Enter Campus Name",
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
              "deptVision": deptvisionEditingcontroller.text,
              "deptMission": deptmissionEditingcontroller.text,
              "deptName": deptNameEditingcontroller.text,
            };
            String s = deptNameEditingcontroller.text.toString();
            firebaseFirestore
                .collection("university")
                .doc(adminuser!.uid)
                .collection("campusDepartments")
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
        title: Text('Department Information'),
        centerTitle: true,
        actions: [
          PopupMenuButton<Menuitem>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) =>
                  [...MenuItems.itemlist3.map((buildItem)).toList()]),
        ],
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
                    DeptNameField,
                    SizedBox(
                      height: 25,
                    ),
                    deptvisionField,
                    SizedBox(
                      height: 25,
                    ),
                    deptmissionField,
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

  PopupMenuItem<Menuitem> buildItem(Menuitem item) => PopupMenuItem(
      value: item,
      child: Row(
        children: [
          Icon(
            item.icon,
            color: Colors.black,
            size: 20,
          ),
          Text(item.text),
        ],
      ));
  void onSelected(BuildContext context, Menuitem item) {
    switch (item) {
      case MenuItems.addprogram:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => addOfferPrograms()));
        break;
      case MenuItems.editorupdate:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EditorUpdateDeptInformation()));
        break;
    }
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );
}
