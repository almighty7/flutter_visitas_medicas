import 'package:flutter/material.dart';
import 'package:flutter_visitas_medicas/PatientVista.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MENU"),
        ),
        body: Center(
            child: RaisedButton(
          child: Text("Pacientes"),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PatientVista()));
          },
        )));
  }
}
