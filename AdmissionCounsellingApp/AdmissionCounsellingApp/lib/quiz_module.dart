import 'dart:ui';
import 'package:admissioncounsellingapp/model/question/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'model/Global_variables.dart' as globals;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

FirebaseFirestore firebase = FirebaseFirestore.instance;

class QuizModule extends StatefulWidget {
  //const QuizModule({Key? key}) : super(key: key);
  List<int> randomNumberlist = <int>[40];
  QuizModule(this.randomNumberlist);
  @override
  _QuizModuleState createState() => _QuizModuleState(randomNumberlist);
}

class _QuizModuleState extends State<QuizModule> {
  List<int> randomNumberlist = <int>[40];
  _QuizModuleState(this.randomNumberlist);
  List<QuestionModel>? allQuestions = [];
  int countquestion = 40;
  double Math = globals.Math;
  double Business = globals.Business;
  double Enigineering = globals.Enigineering;
  double Arts = globals.Arts;
  double CS = globals.CS;
  double Teaching = globals.Teaching;
  double Law = globals.Law;
  double SS = globals.SS;
  double Medical = globals.Medical;
  double Science = globals.Science;
  List<double> Resultlist = <double>[10];
  /*static const FieldsName = [
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
  ];*/
  List<String> Question = List.generate(40, (index) => '');
  String Option1 = '';
  String Option2 = '';
  String Option3 = '';
  String Option4 = '';
  bool isLoading = false;
  getQuestions() async {
    setState(() {
      isLoading = true;
    });
    List<QuestionModel>? allQuestionsTemp = [];
    await firebase.collection("Questions").get().then((querySnapshot) => {
          print(querySnapshot),
          querySnapshot.docs.forEach((doc) {
            allQuestionsTemp.add(QuestionModel.fromdocument(doc));
          })
        });
    setState(() {
      allQuestions = allQuestionsTemp;
      isLoading = false;
    });
  }

  @override
  void initState() {
    getQuestions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Resultlist = globals.FieldResults.cast<double>();
    Math = globals.Math = Resultlist[0];
    Business = globals.Business = Resultlist[1];
    Enigineering = globals.Enigineering = Resultlist[2];
    Arts = globals.Arts = Resultlist[3];
    CS = globals.CS = Resultlist[4];
    Teaching = globals.Teaching = Resultlist[5];
    Law = globals.Law = Resultlist[6];
    SS = globals.SS = Resultlist[7];
    Medical = globals.Medical = Resultlist[8];
    Science = globals.Science = Resultlist[9];
    if (globals.numbercount == 40) {
      globals.testComplete = true;
      print(globals.testComplete);
    }
    return SafeArea(
        child: Scaffold(
      body: isLoading
          ? Container(
              child: Center(
                child: Text("Loading..."),
              ),
            )
          : Stack(
              children: [
                SafeArea(
                    child: Column(
                  children: [
                    if (globals.count > countquestion)
                      Container(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(height: 20),
                              Text(
                                "Result",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.lightBlueAccent,
                                ),
                              ),
                              SizedBox(height: 20),
                              SizedBox(
                                width: 300,
                                child: Text(
                                  'Thank You for attempting the test. Fields Matches to your interest are shown below.',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Fields Name',
                                style: TextStyle(fontSize: 20),
                              ),
                              if (Math >= 30)
                                Column(
                                  children: [
                                    SizedBox(height: 20),
                                    Text('Mathematics',
                                        style: TextStyle(fontSize: 15))
                                  ],
                                ),
                              if (Business >= 30)
                                Column(
                                  children: [
                                    SizedBox(height: 20),
                                    Text('Business       ',
                                        style: TextStyle(fontSize: 15)),
                                  ],
                                ),
                              if (Enigineering >= 30)
                                Column(
                                  children: [
                                    SizedBox(height: 20),
                                    Text('Engineering  ',
                                        style: TextStyle(fontSize: 15)),
                                  ],
                                ),
                              if (Arts >= 30)
                                Column(
                                  children: [
                                    SizedBox(height: 20),
                                    Text('Arts                ',
                                        style: TextStyle(fontSize: 15)),
                                  ],
                                ),
                              if (CS >= 30)
                                Column(
                                  children: [
                                    SizedBox(height: 20),
                                    Text('         Computer Science',
                                        style: TextStyle(fontSize: 15)),
                                  ],
                                ),
                              if (Teaching >= 30)
                                Column(
                                  children: [
                                    SizedBox(height: 20),
                                    Text('Teaching       ',
                                        style: TextStyle(fontSize: 15)),
                                  ],
                                ),
                              if (Law >= 30)
                                Column(
                                  children: [
                                    SizedBox(height: 20),
                                    Text('Law                ',
                                        style: TextStyle(fontSize: 15)),
                                  ],
                                ),
                              if (SS >= 30)
                                Column(
                                  children: [
                                    SizedBox(height: 20),
                                    Text('   Social Sciences',
                                        style: TextStyle(fontSize: 15)),
                                  ],
                                ),
                              if (Medical >= 30)
                                Column(
                                  children: [
                                    SizedBox(height: 20),
                                    Text('Medical          ',
                                        style: TextStyle(fontSize: 15)),
                                  ],
                                ),
                              if (Science >= 30)
                                Column(
                                  children: [
                                    SizedBox(height: 20),
                                    Text('Science           ',
                                        style: TextStyle(fontSize: 15)),
                                  ],
                                ),
                              if (Math < 30 &&
                                  Business < 30 &&
                                  Enigineering < 30 &&
                                  Arts < 30 &&
                                  Teaching < 30 &&
                                  Law < 30 &&
                                  SS < 30 &&
                                  CS < 30 &&
                                  Medical < 30 &&
                                  Science < 30)
                                SizedBox(
                                    width: 300,
                                    child: Text(
                                        'Response show that you are fall behind '
                                        'on a very little margin please work on your Skills ')),
                              SizedBox(height: 30),
                              SizedBox(
                                height: 50,
                                width: 300,
                                child: MaterialButton(
                                  onPressed: () {},
                                  child: Text("View Recommendations"),
                                  color: Colors.lightBlueAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    else
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text.rich(
                                TextSpan(
                                    text: "Question ${globals.count}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(color: Colors.black),
                                    children: [
                                      TextSpan(
                                          text: "/40",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(color: Colors.black))
                                    ]),
                              ),
                              Divider(
                                thickness: 2.5,
                              ),
                              SizedBox(height: 5),
                              SizedBox(
                                height: 100,
                                width: 320,
                                child: Container(
                                  margin: const EdgeInsets.only(top: 0.0),
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        allQuestions![randomNumberlist[
                                                globals.numbercount]]
                                            .question!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(color: Colors.black),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              SizedBox(
                                height: 50,
                                width: 320,
                                child: MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      globals.result = globals.result + 10;
                                      if (globals.checkfour == 4) {
                                        globals.FieldResults[globals
                                            .resultcount] = globals.result;
                                        globals.resultcount =
                                            globals.resultcount + 1;
                                        globals.result = 0;
                                        globals.checkfour = 0;
                                      }
                                      globals.checkfour++;
                                      globals.numbercount++;
                                      globals.count++;
                                    });
                                  },
                                  color: Colors.blue,
                                  height: 60,
                                  child: Text(
                                    allQuestions![randomNumberlist[
                                            globals.numbercount]]
                                        .op1!,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              SizedBox(
                                height: 50,
                                width: 320,
                                child: MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      globals.result = globals.result + 7.5;
                                      if (globals.checkfour == 4) {
                                        globals.FieldResults[globals
                                            .resultcount] = globals.result;
                                        globals.checkfour = 0;
                                        globals.resultcount++;
                                        globals.result = 0;
                                      }
                                      globals.numbercount++;
                                      globals.checkfour++;
                                      globals.count++;
                                    });
                                  },
                                  color: Colors.blue,
                                  child: Text(
                                    allQuestions![randomNumberlist[
                                            globals.numbercount]]
                                        .op2!,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              SizedBox(
                                height: 50,
                                width: 320,
                                child: MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      globals.result = globals.result + 3.33;
                                      if (globals.checkfour == 4) {
                                        globals.FieldResults[globals
                                            .resultcount] = globals.result;
                                        globals.resultcount++;
                                        globals.checkfour = 0;
                                        globals.result = 0;
                                      }
                                      globals.numbercount++;
                                      globals.checkfour++;
                                      globals.count++;
                                    });
                                  },
                                  color: Colors.blue,
                                  height: 60,
                                  child: Text(
                                    allQuestions![randomNumberlist[
                                            globals.numbercount]]
                                        .op3!,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              SizedBox(
                                height: 50,
                                width: 320,
                                child: MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      globals.result = globals.result + 0;
                                      if (globals.checkfour == 4) {
                                        globals.FieldResults[globals
                                            .resultcount] = globals.result;
                                        globals.resultcount++;
                                        globals.checkfour = 0;
                                        globals.result = 0;
                                      }
                                      globals.numbercount++;
                                      globals.checkfour++;
                                      globals.count++;
                                    });
                                  },
                                  color: Colors.blue,
                                  height: 60,
                                  child: Text(
                                    allQuestions![randomNumberlist[
                                            globals.numbercount]]
                                        .op4!,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ))
              ],
            ),
    ));
  }
}
