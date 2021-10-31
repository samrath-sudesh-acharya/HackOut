import 'package:app/payment.dart';
import 'package:flutter/material.dart';

class payment_prize extends StatefulWidget {
  late String prize;
  payment_prize({required this.prize});
  @override
  _payment_prizeState createState() => _payment_prizeState(this.prize);
}

class _payment_prizeState extends State<payment_prize> {
  _payment_prizeState(String prize);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            child: Column(children: <Widget>[
      SizedBox(
        height: 100,
      ),
      Text(
        "Prize",
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 40,
      ),
      Container(
          height: 100,
          width: 400,
          decoration: new BoxDecoration(
            color: Colors.green.shade600,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  child: Text(
                    widget.prize,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          )),
      SizedBox(
        height: 80,
      ),
      ButtonTheme(
        minWidth: 200.0,
        height: 100.0,
        // ignore: deprecated_member_use
        child: RaisedButton(
          color: Colors.green.shade500,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => payment()));
          },
          child: Text(
            "Payment",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ])));
  }
}
