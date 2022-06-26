import 'package:flutter/material.dart';

class admissionInformation extends StatefulWidget {
  const admissionInformation({Key? key}) : super(key: key);

  @override
  State<admissionInformation> createState() => _admissionInformationState();
}

class _admissionInformationState extends State<admissionInformation> {
  @override
  Widget build(BuildContext context) {
    final OpeningDate;
    final ClosingDate;
    final TextEditingController OpeningDateEditinfController =
        new TextEditingController();

    final AdmissionInstructionField = TextFormField(
      autofocus: false,
      //controller: emailEditingcontroller,
      keyboardType: TextInputType.text,

      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Instructions");
        }
        /*if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        return ("Please Enter Valid email");
      }*/
        return null;
      },
      onSaved: (value) {
        //emailEditingcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          labelText: "Admission Instructions",
          //labelStyle: TextStyle(fontSize: 24),
          hintText: "Enter Instructions",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
      obscureText: false,
      maxLines: 3,
    );
    final URLField = TextFormField(
      autofocus: false,
      //controller: emailEditingcontroller,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Instructions");
        }
        /*if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        return ("Please Enter Valid email");
      }*/
        return null;
      },
      onSaved: (value) {
        //emailEditingcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          labelText: "link for admission",
          //labelStyle: TextStyle(fontSize: 24),
          hintText: "paste link here",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
    );

    final SelectOpenDateField = TextFormField(
      autofocus: false,
      controller: OpeningDateEditinfController,
      keyboardType: TextInputType.datetime,
      //textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.date_range_sharp),
          contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          hintText: "Select Date",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
      readOnly: true,
      onTap: () async {
        final OpeningDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2050),
        );
        setState(() {
          if (OpeningDate != null) {
            OpeningDateEditinfController.text =
                "${OpeningDate.day}-${OpeningDate.month}-${OpeningDate.year}";
          }
        });
      },
    );
    final UploadButton = Material(
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
          "Upload",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    var _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Admission Information'),
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
                    AdmissionInstructionField,
                    SizedBox(
                      height: 25,
                    ),
                    SelectOpenDateField,
                    //CampusNameField,
                    SizedBox(
                      height: 25,
                    ),
                    URLField,
                    //CampusContactNumber,
                    SizedBox(
                      height: 25,
                    ),
                    //CampusAddressField,
                    SizedBox(
                      height: 25,
                    ),
                    //CampusMajorCourseField,
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
