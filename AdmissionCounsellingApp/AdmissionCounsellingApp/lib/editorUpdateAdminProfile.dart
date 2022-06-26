import 'package:flutter/material.dart';

class EditorUpdateAdmin extends StatefulWidget {
  const EditorUpdateAdmin({Key? key}) : super(key: key);

  @override
  State<EditorUpdateAdmin> createState() => _EditorUpdateAdminState();
}

class _EditorUpdateAdminState extends State<EditorUpdateAdmin> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final firstNameField = TextFormField(
      autofocus: false,
      //controller: firstNameEditingcontroller,
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
        //firstNameEditingcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Admin Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //Last Name Field
    final UniversityNameField = TextFormField(
      autofocus: false,
      //controller: lastNameEditingcontroller,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Second Name cannot be empty");
        }
        return null;
      },
      onSaved: (value) {
        //lastNameEditingcontroller.text = value!;
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
    final phoneNumberField = TextFormField(
      autofocus: false,
      //controller: firstNameEditingcontroller,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        /*if (value!.isEmpty) {
          return ("Please Enter your name");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter valid name(Minimum 3 characters)");
        }*/
        return null;
      },
      onSaved: (value) {
        //firstNameEditingcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.phone),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "03001234567",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //Last Name Field
    final GenderField = TextFormField(
      autofocus: false,
      //controller: lastNameEditingcontroller,
      keyboardType: TextInputType.name,
      validator: (value) {
        /*if (value!.isEmpty) {
          return ("Second Name cannot be empty");
        }*/
        return null;
      },
      onSaved: (value) {
        //lastNameEditingcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person_sharp),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Gender",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final AgeField = TextFormField(
      autofocus: false,
      //controller: lastNameEditingcontroller,
      keyboardType: TextInputType.name,
      validator: (value) {
        /*if (value!.isEmpty) {
          return ("Second Name cannot be empty");
        }*/
        return null;
      },
      onSaved: (value) {
        //lastNameEditingcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.date_range),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Age",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final UpdateButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
        onPressed: () {
          //DeleteUserAccount(emailcontroller.text, passwordcontroller.text);
        },
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        child: Text(
          "Update",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile'),
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
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            //color: Colors.white,
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
                    firstNameField,
                    SizedBox(
                      height: 25,
                    ),
                    UniversityNameField,
                    SizedBox(
                      height: 25,
                    ),
                    phoneNumberField,
                    SizedBox(
                      height: 25,
                    ),
                    GenderField,
                    SizedBox(
                      height: 25,
                    ),
                    AgeField,
                    SizedBox(
                      height: 25,
                    ),
                    UpdateButton,
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
