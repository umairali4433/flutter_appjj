import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String done = "0";
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;
  var txt = TextEditingController();

  buttonPressed(String buttonText){
    setState(() {
      if(buttonText == "C"){
        equation = "0";
        result = "0";
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      }

      else if(buttonText == "⌫"){
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        equation = equation.substring(0, equation.length - 1);
        if(equation == ""){
          equation = "0";
        }
      }
      else if(buttonText == "="){
        equationFontSize = 38.0;
        resultFontSize = 48.0;

        expression = equation;
        expression = expression.replaceAll('X', '*');
        expression = expression.replaceAll('÷', '/');

        try{
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          txt.text = result;
        }catch(e){
          result = "Error";
        }

      }

      else{
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        if(equation == "0"){
          equation = buttonText;
        }else {
          equation = equation + buttonText;
        }
      }
    });
  }

//  Future getdata() async {
//    http.Response response =
//    await http.get("https://bringo.biz/api/get/verified?mob=");
//    data = json.decode(response.body);
//    setState(() {
//      useradatalist = data["data"];
//    });
//  }

  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor){
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: BorderSide(
                  color: Colors.white,
                  width: 1,
                  style: BorderStyle.solid
              )
          ),
          padding: EdgeInsets.all(16.0),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.normal,
                color: Colors.white
            ),
          )
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("New one"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: txt,
            decoration: InputDecoration(
                hintText: "0"
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(equation, style: TextStyle(fontSize: equationFontSize),),
          ),


          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(result, style: TextStyle(fontSize: resultFontSize),),
          ),


          Expanded(
            child: Divider(),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * .75,
                child: Table(
                  children: [
                    TableRow(
                        children: [
                          buildButton("C", 1, Colors.red),
                          buildButton("C", 1, Colors.blue),
                          buildButton("C", 1, Colors.blue),

                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("7", 1, Colors.black38),
                          buildButton("8", 1, Colors.black38),
                          buildButton("9", 1, Colors.black38)

                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("4", 1, Colors.black38),
                          buildButton("5", 1, Colors.black38),
                          buildButton("6", 1, Colors.black38)

                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("1", 1, Colors.black38),
                          buildButton("2", 1, Colors.black38),
                          buildButton("3", 1, Colors.black38)

                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton(".", 1, Colors.black38),
                          buildButton("0", 1, Colors.black38),
                          buildButton("00", 1, Colors.black38)

                        ]
                    ),
                  ],
                ),
              ), Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * .25,
                child: Table(
                  children: [
                    TableRow(
                        children: [
                          buildButton("X", 1, Colors.blue),
                        ]
                    ), TableRow(
                        children: [
                          buildButton("-", 1, Colors.blue),
                        ]
                    ),TableRow(
                        children: [
                          buildButton("+", 1, Colors.blue),
                        ]
                    ),TableRow(
                        children: [
                          buildButton("=", 2, Colors.deepOrange),
                        ]
                    ),
                  ],
                ),
              )
            ],

          ),





        ],
      ),

    );
  }

//    Widget buildButton(String buttonText,double buttonHeight,Color buttonColor){
//      return Container(
//        height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
//        color: buttonColor,
//        child: FlatButton(
//            shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.circular(0.0),
//                side: BorderSide(
//                    color: Colors.white,
//                    width: 1,
//                    style: BorderStyle.solid
//                )
//            ),
//            padding: EdgeInsets.all(16.0),
//            onPressed: () => buttonPressed(buttonText),
//            child: Text(
//              buttonText,
//              style: TextStyle(
//                  fontSize: 30.0,
//                  fontWeight: FontWeight.normal,
//                  color: Colors.white
//              ),
//            )
//        ),
//      );
//    }

///////////////////////////////////////////////////////////////
//    return Scaffold(
//
//        appBar:AppBar(
//          title: Text("Lets do it"),
//          backgroundColor: Colors.amber,
//        ),
//      body: ListView.builder(itemCount:useradatalist == null?0: useradatalist.length,
//      itemBuilder: (BuildContext context,int index){
//        return Card(
//          child: Padding(
//            padding: const EdgeInsets.all(15.0),
//            child: Row(
//
//              children: <Widget>[
//                CircleAvatar(
//                  backgroundImage: NetworkImage(useradatalist[index]["avatar"]),
//                ),
//                Padding(
//                  padding: const EdgeInsets.all(15),
//                  child: Text(
//                    useradatalist[index]["first_name"]+" "+useradatalist[index]["last_name"],
//                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
//                  ),
//                ),
//              ],
//            ),
//          ),
//        );
//      }
//      ),
//    );
//////////////////////////////////////////////////////////////////////////////////////////////////
}
//  Map data;
//  List userData;
//
//  Future getData() async {
//    http.Response response = await http.get("https://reqres.in/api/users?page=2");
//    data = json.decode(response.body);
//    setState(() {
//      userData = data["data"];
//    });
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    getData();
//  }
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Fake Friends"),
//        backgroundColor: Colors.green,
//      ),
//      body: ListView.builder(
//        itemCount: userData == null ? 0 : userData.length,
//        itemBuilder: (BuildContext context, int index) {
//          return Card(
//            child: Padding(
//              padding: const EdgeInsets.all(10.0),
//              child: Row(
//                children: <Widget>[
//                  CircleAvatar(
//                    backgroundImage: NetworkImage(userData[index]["avatar"]),
//                  ),
//                  Padding(
//                    padding: const EdgeInsets.all(10.0),
//                    child: Text("${userData[index]["first_name"]} ${userData[index]["last_name"]}",
//                      style: TextStyle(
//                        fontSize: 20.0,
//                        fontWeight: FontWeight.w700,
//                      ),),
//                  )
//                ],
//              ),
//            ),
//          );
//        },
//      ),
//    );
//  }

