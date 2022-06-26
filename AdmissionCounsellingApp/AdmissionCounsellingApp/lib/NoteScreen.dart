import 'dart:math';
import 'package:admissioncounsellingapp/quiz_module.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'model/Global_variables.dart' as globals;

FirebaseFirestore firebase = FirebaseFirestore.instance;

class quizNote extends StatefulWidget {
  const quizNote({Key? key}) : super(key: key);

  @override
  _quizNoteState createState() => _quizNoteState();
}

class _quizNoteState extends State<quizNote> {
  int number = 0;
  int minimum = 1;
  int maximum = 20;
  int inc = 20;
  int numbercount = 0;

  String Question = '';
  @override
  void initState() {
    firebase.collection("Question").get().then((querySnapshot) => {
          querySnapshot.docs.forEach((docoment) {
            setState(() {
              Question = docoment['name'];
            });
          })
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<int> randomNumberlist = <int>[40];
    List<int> index = <int>[10];
    randomNumberlist = nextNumbers(40, min: minimum, max: maximum);
    //print("List=" + randomNumberlist.toString());
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Instructions",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
                'There will be 40 Questions displayed one by one. Read your instructions carefully. Attempt all the questions then You will able to see recommended Universities.'),
          ),
          SizedBox(
            height: 40,
          ),
          MaterialButton(
            onPressed: () {
              /*if (globals.testComplete == true) {
                globals.numbercount = 0;
                minimum = 1;
                maximum = 20;
                randomNumberlist = nextNumbers(40, min: minimum, max: maximum);
                globals.count = 1;
                print('global: $minimum+3');
              }*/
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QuizModule(randomNumberlist)));
            },
            color: Colors.blue,
            height: 80,
            minWidth: 300,
            child: Text(
              "Start Quiz",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ],
      )),
    );
  }

  List<int> nextNumbers(int length, {required int min, required int max}) {
    final numbers = Set<int>();
    while (numbers.length != length) {
      number = min + Random().nextInt(max - min + 1);
      if (!numbers.contains(number)) {
        numbers.add(number);
        numbercount++;
      }
      if (numbercount == 4) {
        min = min + inc;
        max = max + inc;
        numbercount = 0;
      }
    }
    numbercount = 0;
    print("List=" + numbers.toString());
    return List.of(numbers);
  }
}
