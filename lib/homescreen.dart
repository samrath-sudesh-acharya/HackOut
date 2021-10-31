import 'package:app/body.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildappbar(),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[600],
        onPressed: () {},
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
