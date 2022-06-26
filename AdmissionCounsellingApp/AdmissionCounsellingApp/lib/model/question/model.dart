class QuestionModel
{
  String? question;
  String ?op1;
  String ?op2;
  String ?op3;
  String ?op4;
  QuestionModel({this.question,this.op1,this.op2,this.op3,this.op4});
factory QuestionModel.fromdocument(doc){
  return QuestionModel(question: doc.data()['Q'],
    op1: doc.data()['op1'],
    op2: doc.data()['op2'],
    op3: doc.data()['op3'],
    op4: doc.data()['op4'],
  );}
}
