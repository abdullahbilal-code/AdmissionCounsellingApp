import 'package:admissioncounsellingapp/AddDepartments.dart';
import 'package:admissioncounsellingapp/EditorUpdateCampusInfo.dart';
import 'package:admissioncounsellingapp/MenuItem.dart';
import 'package:admissioncounsellingapp/Menu_Items.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddCampusData extends StatefulWidget {
  const AddCampusData({Key? key}) : super(key: key);

  @override
  State<AddCampusData> createState() => _AddCampusDataState();
}

class _AddCampusDataState extends State<AddCampusData> {
  String? value;
  final FieldsNames = [
    "Math",
    "Business",
    "Engineering",
    "Arts",
    "Computer Science",
    "Teaching",
    "Law",
    "Social Science",
    "Medical",
    "Science"
  ];

  final _formKey = GlobalKey<FormState>();
  final aboutCampusEditingcontroller = new TextEditingController();
  final campusnameEditingcontroller = new TextEditingController();
  final campusaddressEditingcontroller = new TextEditingController();
  final campuscontactEditingcontroller = new TextEditingController();
  final campusmajorEditingcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AboutCampusField = TextFormField(
      autofocus: false,
      controller: aboutCampusEditingcontroller,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Enter About Campus");
        }
        /*if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        return ("Please Enter Valid email");
      }*/
        return null;
      },
      onSaved: (value) {
        aboutCampusEditingcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          labelText: "About Campus",
          //labelStyle: TextStyle(fontSize: 24),
          hintText: "Enter About Campus",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
      obscureText: false,
      maxLines: 3,
    );
    final CampusNameField = TextFormField(
      autofocus: false,
      controller: campusnameEditingcontroller,
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
        campusnameEditingcontroller.text = value!;
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
    final CampusAddressField = TextFormField(
      autofocus: false,
      controller: campusaddressEditingcontroller,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Enter Campus Address");
        }
        /*if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        return ("Please Enter Valid email");
      }*/
        return null;
      },
      onSaved: (value) {
        campusaddressEditingcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          labelText: "Address",
          //labelStyle: TextStyle(fontSize: 24),
          hintText: "Campus Address",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
      obscureText: false,
      maxLines: 3,
    );
    final CampusContactNumber = TextFormField(
      autofocus: false,
      controller: campuscontactEditingcontroller,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Enter phone number");
        }
        /*if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        return ("Please Enter Valid email");
      }*/
        return null;
      },
      onSaved: (value) {
        campuscontactEditingcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          labelText: "Contact number",
          //labelStyle: TextStyle(fontSize: 24),
          hintText: "Enter Contact Number",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
    );
    final CampusMajorCourseField = Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blueAccent, width: 3)),
        child: DropdownButtonHideUnderline(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
                items: FieldsNames.map(buildMenuItem).toList(),
                value: value,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                ),
                iconSize: 36,
                isExpanded: true,
                hint: Text('Major Course'),
                onChanged: (value) => setState(
                      () {
                        this.value = value;
                        campusmajorEditingcontroller.text = value!;
                      },
                    )),
          ),
        ));
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
              "aboutCampus": aboutCampusEditingcontroller.text,
              "campusName": campusnameEditingcontroller.text,
              "campusaAddress": campusaddressEditingcontroller.text,
              "campusContact": campuscontactEditingcontroller.text,
              "campusMajor": campusmajorEditingcontroller.text,
            };
            firebaseFirestore
                .collection("university")
                .doc(adminuser!.uid)
                .collection("Campuses")
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
        title: Text('Campus Information'),
        centerTitle: true,
        actions: [
          PopupMenuButton<Menuitem>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) =>
                  [...MenuItems.itemlist2.map((buildItem)).toList()]),
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
                    AboutCampusField,
                    SizedBox(
                      height: 25,
                    ),
                    CampusNameField,
                    SizedBox(
                      height: 25,
                    ),
                    CampusContactNumber,
                    SizedBox(
                      height: 25,
                    ),
                    CampusAddressField,
                    SizedBox(
                      height: 25,
                    ),
                    CampusMajorCourseField,
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
      case MenuItems.addDepartment:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AddDepartments()));
        break;
      case MenuItems.editorupdate:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => EditOrUpdateCampusInfo()));
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
