import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Nunito'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          child: loginpage(),
        ),
      ),
    );
  }
}

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  int _pagestate = 0;
  var _backgroundcolor = Colors.white;
  var _headingstate1 = Color(0xFF43A047);
  var _headingstate2 = Color(0xFF43A047);
  double _loginwidth = 0;
  double _loginheight = 0;
  double _loginyoffset = 0;
  double _loginXofset = 0;
  double _loginopacity = 1;
  double _registerYoffset = 0;
  double windowwidth = 0;
  double windowheight = 0;
  double _registerheight = 0;
  double _headanime = 100;
  @override
  Widget build(BuildContext context) {
    windowheight = MediaQuery.of(context).size.height;
    windowwidth = MediaQuery.of(context).size.height;
    _loginheight = windowheight - 250;
    _registerheight = windowheight - 248;
    switch (_pagestate) {
      case 0:
        _backgroundcolor = Colors.white;
        _headingstate1 = Color(0xFF43A047);
        _headingstate2 = Color(0xFF43A047);
        _loginwidth = windowwidth;
        _loginyoffset = windowheight;
        _loginXofset = 0;
        _loginopacity = 1;
        _registerYoffset = windowheight;
        _headanime = 100;
        break;
      case 1:
        _backgroundcolor = Color(0xFFBBDEFB);
        _headingstate1 = Colors.white;
        _headingstate2 = Color(0xFF43A047);
        _loginwidth = windowwidth;
        _loginyoffset = 250;
        _loginXofset = 0;
        _loginopacity = 1;
        _registerYoffset = windowheight;
        _headanime = 85;
        break;
      case 2:
        _backgroundcolor = Color(0xFFBBDEFB);
        _headingstate1 = Colors.white;
        _headingstate2 = Color(0xFF43A047);
        _loginwidth = windowwidth - 450;
        _loginyoffset = 220;
        _loginXofset = 20;
        _loginopacity = 0.7;
        _registerYoffset = 250;
        _headanime = 75;
        break;
    }

    return Stack(
      children: <Widget>[
        AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1250),
          color: _backgroundcolor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    _pagestate = 0;
                  });
                },
                child: Column(
                  children: <Widget>[
                    AnimatedContainer(
                      curve: Curves.fastLinearToSlowEaseIn,
                      duration: Duration(milliseconds: 1000),
                      child: Container(
                        margin: EdgeInsets.only(top: _headanime),
                        child: Text(
                          'MEDGO',
                          style: TextStyle(
                            fontSize: 50,
                            color: Colors.green[600],
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Value for money',
                      style: TextStyle(
                        color: Colors.green[600],
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              )),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 92),
                  child: Center(
                    child: Image.asset(
                      'lib/images/NEW.png',
                      scale: 9.5,
                    ),
                  ),
                ),
              ),
              Container(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    switch (_pagestate) {
                      case 1:
                        _pagestate = 0;
                        break;
                      case 0:
                        _pagestate = 1;
                        break;
                    }
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(50),
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.green[600],
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                      child: Text(
                    'Get started',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                ),
              )),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      margin: const EdgeInsets.only(bottom: 1),
                      child: Text(
                        '® copyright reserve Tork ltd.',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        AnimatedContainer(
            padding: EdgeInsets.all(30),
            width: _loginwidth,
            height: _loginheight,
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(
              milliseconds: 1000,
            ),
            transform:
                Matrix4.translationValues(_loginXofset, _loginyoffset, 1),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(_loginopacity),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.green[600]
                        ),
                      ),
                    ),
                    _inputwith(
                      icon: Icons.email,
                      hint: 'Enter your email',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _inputwith(
                      icon: Icons.password,
                      hint: 'Enter your password',
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    primarybutton(
                      btnText: 'Login',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _pagestate = 2;
                          });
                        },
                        child: outlines(btnText: 'Create new account')),
                  ],
                ),
              ],
            )),
        AnimatedContainer(
          height: _registerheight,
          padding: EdgeInsets.all(30),
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(
            milliseconds: 800,
          ),
          transform: Matrix4.translationValues(0, _registerYoffset, 1),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Create a new account',
                      style: TextStyle(
                        fontSize: 25,
                         color: Colors.green[600]
                      ),
                    ),
                  ),
                  _inputwith(
                    icon: Icons.email,
                    hint: 'Enter your email',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _inputwith(
                    icon: Icons.password,
                    hint: 'Create a new password',
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  primarybutton(btnText: 'Create Account'),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _pagestate = 1;
                        });
                      },
                      child: outlines(btnText: 'Back to login')),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _inputwith extends StatefulWidget {
  final IconData icon;
  String hint;
  _inputwith({required this.icon, required this.hint});
  @override
  __inputwithState createState() => __inputwithState();
}

class __inputwithState extends State<_inputwith> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFF43A047),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 70,
            child: Icon(
              widget.icon,
              size: 20,
              color: Color(0xFF43A047),
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                hintText: widget.hint,
                border: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class primarybutton extends StatefulWidget {
  final String btnText;
  primarybutton({required this.btnText});

  @override
  _primarybuttonState createState() => _primarybuttonState();
}

class _primarybuttonState extends State<primarybutton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xFF43A047),
          borderRadius: BorderRadius.circular(50),
        ),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(left: 40, right: 40),
        child: Center(
            child: Text(
          widget.btnText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        )));
  }
}

class outlines extends StatefulWidget {
  final String btnText;
  outlines({required this.btnText});

  @override
  _outlinesState createState() => _outlinesState();
}

class _outlinesState extends State<outlines> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFF43A047),
            width: 2.5,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(left: 40, right: 40),
        child: Center(
            child: Text(
          widget.btnText,
          style: TextStyle(
            color: Color(0xFF43A047),
            fontSize: 20,
          ),
        )));
  }
}
