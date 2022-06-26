import 'package:admissioncounsellingapp/DeleteAccount.dart';
import 'package:admissioncounsellingapp/Menu_Items.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:admissioncounsellingapp/MenuItem.dart';
import 'package:admissioncounsellingapp/editorUpdateStudentProfile.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class studentProfile extends StatefulWidget {
  const studentProfile({Key? key}) : super(key: key);

  @override
  State<studentProfile> createState() => _studentProfileState();
}

File image = AssetImage("assets/profile.png") as File;

class _studentProfileState extends State<studentProfile> {
  final formkey = GlobalKey<FormState>();
  TextEditingController img = TextEditingController();
  final myDecoration = BoxDecoration(
    color: Colors.transparent,
    border: Border(bottom: BorderSide(color: Colors.blueGrey, width: 3.0)),
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          AppBar(
            //elevation: 0,
            title: Text("Profile"),
            actions: [
              PopupMenuButton<Menuitem>(
                  onSelected: (item) => onSelected(context, item),
                  itemBuilder: (context) =>
                      [...MenuItems.itemlist.map((buildItem)).toList()]),
            ],
            centerTitle: true,
            backgroundColor: Colors.lightBlueAccent,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 50),
                      SizedBox(
                        height: 50,
                        child: Container(
                          decoration: myDecoration,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: 'Name: ',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey)),
                                  TextSpan(
                                      text: 'Hammad Ahmad',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black87)),
                                ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        height: 50,
                        child: Container(
                          decoration: myDecoration,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: 'Email: ',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey)),
                                  TextSpan(
                                      text: 'en.hammadahmad@gmail.com',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black87)),
                                ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        height: 50,
                        child: Container(
                          decoration: myDecoration,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: 'Phone no: ',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey)),
                                  TextSpan(
                                      text: '0344-9090695',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black87)),
                                ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        height: 50,
                        child: Container(
                          decoration: myDecoration,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: 'Gender: ',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey)),
                                  TextSpan(
                                      text: 'Male',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black87)),
                                ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        height: 50,
                        child: Container(
                          decoration: myDecoration,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: 'Age: ',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey)),
                                  TextSpan(
                                      text: '20',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black87)),
                                ]),
                              ),
                            ],
                          ),
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
      case MenuItems.editorupdate:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => editorUpdateStudentProfile()));
        break;
      case MenuItems.deleteaccount:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => DeleteAccount()));
        break;
    }
  }
}
