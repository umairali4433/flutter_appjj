import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

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
  Map data;
  List useradatalist;
  Future getdata() async {
    http.Response response = await http.get("https://bringo.biz/api/get/verified?mob=");
    data = json.decode(response.body);
    setState(() {
      useradatalist = data["data"];
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("HEY"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Enter your name"
            ),

          ),
        ),
      )
    );

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
}