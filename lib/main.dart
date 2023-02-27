import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Calculator',
      theme: ThemeData(
          //backgroundColor: Colors.black54,
          ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }


}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  late String answer;
  late String answerTemp;
  late String operat;

  @override

  void initState() {
    answer = "0";
     operat = "";
     answerTemp = "";

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.orangeAccent),
          ),
          backgroundColor: Colors.black),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[monitor(), btnRow()],
        ),
      ),
    );
  }

  Widget monitor() {
    return Expanded(
        child: Container(
            color: Colors.black,
            child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(answerTemp + operat,
                          style: TextStyle(fontSize: 45, color: Colors.white)),
                      Text(answer,
                          style: TextStyle(fontSize: 65, color: Colors.orange))

                    ]))));
  }

  Widget btnRow() {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: <Widget>[
              checkType('ac', numberButton: false,onTap: () {clear();}),
              checkType("c", numberButton: false,onTap: () {delete();}),
              checkType("%", numberButton: false,onTap: () {percen();}),
              checkType("/", numberButton: false,onTap: () {addoperater('/');})
            ],
          ),
          Row(
            children: <Widget>[
              checkType( "7",onTap: () {addnum(7);}),
              checkType("8",onTap: () {addnum(8);}),
              checkType("9",onTap: () {addnum(9);}),
              checkType("x", numberButton: false,onTap: () {addoperater('x');})
            ],
          ),
          Row(
            children: <Widget>[
              checkType("4", onTap: () {addnum(4);}),
              checkType("5", onTap: () {addnum(5);}),
              checkType("6", onTap: () {addnum(6);}),
              checkType("-", numberButton: false ,onTap: () {addoperater('-');})
            ],
          ),
          Row(
            children: <Widget>[
              checkType("1", onTap: () {addnum(1);}),
              checkType("2", onTap: () {addnum(2);}),
              checkType("3", onTap: () {addnum(3);}),
              checkType("+", numberButton: false,onTap: () {addoperater('+');})
            ],
          ),
          Row(
            children: <Widget>[

              checkType("0", onTap: () {addnum(0);}),
              checkType( ".", numberButton: false,onTap: () {adddot('.');}),
              checkType("=", numberButton: false,onTap: () {calculetor ();})
            ],
          )
        ],
      ),
    );
  }

  void addnum (int number){
setState(() {
  if (number==0 && answer=="0"){

  }else if (number != 0 && answer=="0"){
   answer=number.toString();
  }else {
    answer= answer+number.toString();
  }
});
  }
  void addoperater(String operated){
    setState(() {
      if(answer =='0'){
    }else{
        answerTemp = answer ;
        operat = operated;
        answer = "0";
      }
    });
  }
  void adddot(String dot){
    setState(() {
      if(answer.contains(".")){
      } else {
        answer=answer + dot;
      }
    });

  }
  void clear(){setState(() {
      answer = "0";
      operat = "";
      answerTemp = "";
    });}
  void delete(){
    setState(() {
      answer = answer.substring(0, answer.length - 1);
      if(answer.length<1){
        answer = answerTemp;
        answerTemp ="";
        operat ="";
      }
    });
  }
  void calculetor (){
     double input ;
    if(answerTemp==""&&operat==""){ }
    else if(operat!=""){
      setState(() {
        switch(operat){
          case '+': {input = double.parse(answerTemp)+double.parse(answer);
          answer =input.toString();}
          break;
          case '-': {input = double.parse(answerTemp)-double.parse(answer);
          answer =input.toString();}
          break;
          case 'x': {input = double.parse(answerTemp)*double.parse(answer);
          answer =input.toString();}
          break;
          case '/': {input = double.parse(answerTemp)/double.parse(answer);
          answer =input.toString();}
          break;

        }
      });
    }
  }
  void percen(){
    double input;
    setState(() {
      input =double.parse(answer)/100;
          answerTemp=input.toString();
          answer ="0";
    });
}
checkType(String srt, {required Function() onTap, bool numberButton = true}) {
    Widget widget;
    if (numberButton) {
      widget = Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Material(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
          child: Container(
            margin: EdgeInsets.all(30),
            child: InkWell(
              onTap: onTap, splashColor: Colors.orangeAccent,
              child: Center(
                child: Text(
                  srt,
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      widget = Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Material(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white38,
          child: Container(
            margin: EdgeInsets.all(30),
            child: InkWell(
              onTap: onTap, splashColor: Colors.orangeAccent,
              child: Center(
                child: Text(
                  srt,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return Expanded(child: widget);
  }


}

