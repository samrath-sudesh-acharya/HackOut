import 'package:flutter/material.dart';

import 'constants.dart';

class Titlewithmorebutton extends StatelessWidget {
  const Titlewithmorebutton({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: <Widget>[
          Titlewithunder(text: title),
          Spacer(),
          TextButton(
            onPressed: press(),
            child: Text(
              'More',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.green[600],
            ),
          )
        ],
      ),
    );
  }
}

class Titlewithunder extends StatelessWidget {
  const Titlewithunder({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: pad / 4),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(right: pad / 4),
              height: 7,
            ),
          )
        ],
      ),
    );
  }
}
