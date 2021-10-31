import 'package:app/main.dart';
import 'package:app/payment_prize.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class Hospitals extends StatelessWidget {
  const Hospitals({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Recomendation(
            size: size,
            image: 'lib/assets/N4.jpg',
            title: 'Narayana Hrudalaya',
            spec: 'Heart surgeries',
            pprize: '\$1345.69',
            place: 'All India.',
          ),
          Recomendation(
            size: size,
            image: 'lib/assets/apollo.png',
            title: 'Apollo cancer center',
            spec: 'Cancer treatment',
            place: 'Chennai,TN.(popular)',
            pprize: '\$1404.61',
          ),
          Recomendation(
            size: size,
            image: 'lib/assets/max.jpg',
            title: 'Max superspeciality',
            spec: 'Pulmonology',
            place: 'Saket,Delhi, India.',
            pprize: '\$1254.61',
          ),
          Recomendation(
            size: size,
            image: 'lib/assets/fortis.jpg',
            title: 'Fortis memorial',
            spec: 'Nephrology',
            place: 'Gurgaon,India(popular)',
            pprize: '\$1404.61',
          ),
        ],
      ),
    );
  }
}

class Recomendation extends StatelessWidget {
  const Recomendation({
    Key? key,
    required this.size,
    required this.image,
    required this.title,
    required this.spec,
    required this.pprize,
    required this.place,
  }) : super(key: key);

  final Size size;
  final String image, title, spec, place, pprize;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: pad,
        top: pad / 2,
        bottom: pad * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(image),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => payment_prize(prize: '$pprize')));
            },
            child: Container(
              padding: EdgeInsets.all(pad / 2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 100,
                    )
                  ]),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '$title\n',
                          style: Theme.of(context).textTheme.button,
                        ),
                        TextSpan(
                            text: '$spec\n',
                            style: TextStyle(
                              color: Colors.green[800],
                            )),
                        TextSpan(
                            text: '$place',
                            style: TextStyle(
                              color: Colors.grey[700],
                            ))
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
