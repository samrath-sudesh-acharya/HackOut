import 'package:app/body.dart';
import 'package:app/constants.dart';
import 'package:app/payment.dart';
import 'package:flutter/material.dart';

import 'input_page.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildappbar(),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[600],
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => inputPage()));
        },
        child: Icon(
          Icons.airplanemode_active,
        ),
      ),
    );
  }
}

AppBar buildappbar() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.green[600],
  );
}
