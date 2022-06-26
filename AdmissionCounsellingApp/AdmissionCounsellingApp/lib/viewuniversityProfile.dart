import 'package:flutter/material.dart';

class ViewUniProfile extends StatefulWidget {
  const ViewUniProfile({Key? key}) : super(key: key);

  @override
  State<ViewUniProfile> createState() => _ViewUniProfileState();
}

class _ViewUniProfileState extends State<ViewUniProfile> {
  final AboutUniversityField = TextFormField(
    autofocus: false,
    //controller: aboutUniveristyEditingcontroller,
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
      //aboutUniveristyEditingcontroller.text = value!;
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
  @override
  Widget build(BuildContext context) {
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
                //key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    //AboutUniversityField,
                    SizedBox(
                      height: 25,
                    ),
                    //UniversityHistoryField,
                    SizedBox(
                      height: 25,
                    ),
                    //UniversityVisionField,
                    SizedBox(
                      height: 25,
                    ),
                    //UniversityMissionField,
                    SizedBox(
                      height: 25,
                    ),
                    //UniversityGoalField,
                    SizedBox(
                      height: 25,
                    ),
                    //UploadButton,
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
