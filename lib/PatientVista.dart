import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_visitas_medicas/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class PatientVista extends StatelessWidget {
  late String patientName, patientAdress;
  late double patientHeight, patientBirthday;

  getPatientName(name) {
    this.patientName = name;
  }

  getPatientAdress(adress) {
    this.patientAdress = adress;
  }

  getPatientHeight(height) {
    this.patientHeight = double.parse(height);
  }

  getPatientBirthday(birthday) {
    this.patientBirthday = double.parse(birthday);
  }

  createData() {
    print("Creado");

    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("Patient").doc("name");

    Map<String, dynamic> patients = {
      "name": patientName,
      "adress": patientAdress,
      "height": patientHeight,
      "birth_day": patientBirthday
    };

    documentReference.set(patients).whenComplete(() {
      print("$patientName created");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AGREGAR PACIENTE"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Nombre",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0))),
              onChanged: (String name) {
                getPatientName(name);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Altura",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0))),
              onChanged: (String height) {
                getPatientHeight(height);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Dirección",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0))),
              onChanged: (String adress) {
                getPatientAdress(adress);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Fecha de nacimiento",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0))),
              onChanged: (String birth_day) {
                getPatientBirthday(birth_day);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Text("Guardar paciente"),
                textColor: Colors.white,
                onPressed: () {
                  createData();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
