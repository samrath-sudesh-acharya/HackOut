import 'dart:convert';
import 'package:app/payment.dart';
import 'package:substring_highlight/substring_highlight.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'model/appointment.dart';

// ignore: camel_case_types
class inputPage extends StatefulWidget {
  const inputPage({Key? key}) : super(key: key);

  @override
  _inputPageState createState() => _inputPageState();
}

Future<PatientInfo?> collectInfo(String country, String hospital_name,
    int patientId, String treatment, String date) async {
  final String apiUrl = 'http://10.0.2.2:8000/appointment';
  final msg = jsonEncode({
    "country": country,
    "hospital_name": hospital_name,
    "patient_id": patientId,
    "treatment": treatment,
    "date": date,
  });
  final response = await http
      .post(Uri.parse(apiUrl),
          headers: {
            'accept': 'application/json',
            'Content-Type': 'application/json-patch+json',
          },
          body: msg)
      .then((response) => print(response.body))
      .catchError((error) => print(error));
}

// ignore: camel_case_types
class _inputPageState extends State<inputPage> {
  late List<String> autoCompleteData;
  Future fetchAutoCompleteData() async {
    final String stringData =
        await rootBundle.loadString("assets/symptoms.json");
    final List<dynamic> json = jsonDecode(stringData);
    final List<String> jsonStringdata = json.cast<String>();
    setState(() {
      autoCompleteData = jsonStringdata;
    });
  }

  late PatientInfo _info;
  final country = TextEditingController();
  final treatment = TextEditingController();
  final hospital_name = TextEditingController();
  final date = TextEditingController();
  String ptext = '';
  String ttext = '';

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    ttext = 'Submit';
    super.initState();
    fetchAutoCompleteData();
  }

  void method1() {
    setState(() {
      ttext = 'Submiting';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Statefull Widget',
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.green[600],
            title: Text('MedGo'),
          ),
          body: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Positioned(
                  top: 65,
                  left: 45,
                  width: 110,
                  height: 80,
                  child: Text(
                    'Information',
                    style: TextStyle(fontSize: 20),
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
                child: Autocomplete(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text.isEmpty) {
                      return const Iterable<String>.empty();
                    } else {
                      return autoCompleteData.where((word) => word
                          .toLowerCase()
                          .contains(textEditingValue.text.toLowerCase()));
                    }
                  },
                  optionsViewBuilder:
                      (context, Function(String) onSeletected, options) {
                    return Material(
                      elevation: 4,
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          final option = options.elementAt(index);
                          return ListTile(
                            title: SubstringHighlight(
                              text: option.toString(),
                              term: country.text,
                              textStyleHighlight:
                                  TextStyle(fontWeight: FontWeight.w700),
                            ),
                            onTap: onSeletected(option.toString()),
                          );
                        },
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: options.length,
                      ),
                    );
                  },
                  fieldViewBuilder: (BuildContext context,
                      TextEditingController fieldTextEditingController,
                      FocusNode fieldFocusNode,
                      VoidCallback onFieldSubmitted) {
                    return TextField(
                      autocorrect: true,
                      controller: country,
                      decoration: InputDecoration(
                        labelText: 'Country',
                        labelStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white70,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide:
                              BorderSide(color: Color(0xFFB006400), width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Color(0xFFB006400)),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 170),
                child: Container(
                    child: TextField(
                  autocorrect: true,
                  controller: treatment,
                  decoration: InputDecoration(
                    labelText: 'Treatment',
                    labelStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide:
                          BorderSide(color: Color(0xFFB006400), width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Color(0xFFB006400)),
                    ),
                  ),
                )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 240),
                child: Container(
                    child: TextField(
                  autocorrect: true,
                  controller: hospital_name,
                  decoration: InputDecoration(
                    labelText: 'Hospital name',
                    labelStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide:
                          BorderSide(color: Color(0xFFB006400), width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Color(0xFFB006400)),
                    ),
                  ),
                )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 310),
                child: Container(
                    child: TextField(
                  autocorrect: true,
                  controller: date,
                  decoration: InputDecoration(
                    labelText: 'Which date do you opt for ?',
                    labelStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide:
                          BorderSide(color: Color(0xFFB006400), width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Color(0xFFB006400)),
                    ),
                  ),
                )),
              ),
              Positioned(
                  top: 400,
                  width: 200,
                  left: 95,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFB006400), // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () async {
                        method1();
                        final PatientInfo? patient = await collectInfo(
                            country.text,
                            hospital_name.text,
                            1,
                            treatment.text,
                            date.text);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => payment()));
                      },
                      child: Text(ttext))),
            ],
          )),
    );
  }
}
