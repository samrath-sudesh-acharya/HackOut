import 'dart:ui';
import 'package:app/constants.dart';
import 'package:app/title_with.dart';
import 'package:flutter/material.dart';

import 'headerwith.dart';
import 'hospital.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Headerwithsearchbox(size: size),
          Titlewithmorebutton(
            title: 'Recomended',
            press: () {},
          ),
          Hospitals(size: size),
          Titlewithmorebutton(title: "Ayurvedic destinations", press: () {}),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Ayurvedas(
                  size: size,
                  Image: 'lib/assets/ayur3.jpeg',
                  press: () {},
                ),
                Ayurvedas(
                  size: size,
                  Image: 'lib/assets/ayur1.png',
                  press: () {},
                ),
                Ayurvedas(
                  size: size,
                  Image: 'lib/assets/ayur2.png',
                  press: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Ayurvedas extends StatelessWidget {
  const Ayurvedas({
    Key? key,
    required this.size,
    required this.Image,
    required this.press,
  }) : super(key: key);

  final Size size;
  final String Image;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press(),
      child: Container(
        margin: EdgeInsets.only(left: pad, top: pad / 2, bottom: pad / 2),
        width: size.width * 0.8,
        height: 185,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image:
                DecorationImage(fit: BoxFit.cover, image: AssetImage(Image))),
      ),  
    );
  }
}
