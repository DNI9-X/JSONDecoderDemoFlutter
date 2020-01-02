import 'package:flutter/material.dart';
import 'dart:convert' as JSON;

void main()=>runApp(MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.teal
  ),
  home: HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JSON Decode Demo"),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString("load_json/person.json"),
            builder: (context, snapshot){
              //decoding JSON
              var myData = JSON.jsonDecode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext, int index){
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text("Name: " + myData[index]['name']),
                        Text("Age: " + myData[index]['age']),
                        Text("Gender: " + myData[index]['gender']),
                        Text("Character: " + myData[index]['character']),
                      ],
                    ),
                  );
                },
                itemCount: myData == null ? 0 : myData.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
