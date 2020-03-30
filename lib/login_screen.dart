import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new LoginScreenPage(),
        title: 'Generated App',
        theme: ThemeData.light(),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale("en", "US"),
          Locale('ar', 'AE'), // OR Locale('ar', 'AE') OR Other RTL locales
        ]);
  }
}

class LoginScreenPage extends StatefulWidget {
  LoginScreenPage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<LoginScreenPage>
    with TickerProviderStateMixin {
  // loading variable so the button ca nreturn to its init state
  bool loading = true;

  // this widget will be replaces by the loading icon
  Widget f = Padding(
      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Text("تسجيل الدخول",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Almarai',
                color: Colors.white,
                fontSize: 25,
              ))));

  final myController = TextEditingController();
  final myController2 = TextEditingController();
  bool _obscureText = true;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    // var _animationController = AnimationController(vsync: this, duration: Duration(seconds: 1));
  }

  final spinkit2 = SpinKitFadingCircle(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.yellow : Colors.yellowAccent,
        ),
      );
    },
  );
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  String _password;
  Widget customtext(
      var text, TextEditingController cController, IconData i, TextInputType kt,
      {IconData y}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: TextFormField(
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.end,
        keyboardType: kt,
        controller: cController,
        style: new TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
        validator: (val) => val.length < 4 ? 'Password too short.' : null,
        onSaved: (val) => _password = val,
        obscureText: _obscureText,
        decoration: InputDecoration(
            enabledBorder: new OutlineInputBorder(
                borderSide: new BorderSide(
              color: Colors.grey,
            )),
            filled: true,
            fillColor: const Color(0xFFE9E9E9),
            hintText: text,
            alignLabelWithHint: true,
            hintStyle: TextStyle(
              fontSize: 15,
              fontFamily: 'Almarai',
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 0),
            prefixIcon: IconButton(
              icon: Icon(y),
              color: Colors.black,
              onPressed: () {
                _toggle();
              },
            ),
            suffixIcon: Icon(i)),
      ),
    );
  }

  Widget customcard() {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
      child: Material(
        elevation: 0.0001,
        borderRadius: BorderRadius.circular(25.0),
        borderOnForeground: true,
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                    //login_screen.dartvertical: 10.0,
                    ),
                child: Material(
                  borderOnForeground: true,
                  borderRadius: BorderRadius.circular(25.0),
                  child: Container(
                      child: Column(
                    children: <Widget>[
                      customtext('رقم الجوال ', myController,
                          Icons.person_outline, TextInputType.phone),
                      customtext('كلمة المرور', myController2,
                          Icons.lock_outline, TextInputType.visiblePassword,
                          y: (_obscureText == true)
                              ? Icons.visibility
                              : Icons.visibility_off),
                    ],
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final spinkit1 = SpinKitSquareCircle(
      color: Colors.yellow,
      size: 50.0,
      controller: _controller,
    );
    return new Scaffold(
        body: GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: new ListView(children: <Widget>[
        Padding(
            padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
            child: new Image(
              image: new AssetImage('images/logo.png'),
              //  fit: BoxFit.fill,
              width: 100.0,
              height: 100.0,
            )),
        Center(
            child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: Text("خصومات",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 40,
                  )),
            ),
            Text("كل ما تحتاجه",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Almarai',
                  fontWeight: FontWeight.w300,
                  color: Colors.orange,
                  fontSize: 20,
                )),
          ],
        )),
        Padding(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Center(
                child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text("مرحبا   بك",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Almarai',
                        color: Colors.black,
                        fontSize: 35,
                      )),
                ),
                Text("الرجاء ادخال رقم الموبايل وكلمة المرور",
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontFamily: 'Almarai',
                      color: Colors.black,
                      fontSize: 15,
                    )),
              ],
            ))),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              customcard(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 5.0,
                ),
                child: Row(children: [
                  ButtonToUse(" نسيت كلمة المرور ؟",
                      fw: FontWeight.w500, fc: Colors.black),
                ]),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.orange)),
                    onPressed: () {
                      setState(() {
                        f = Padding(
                          padding: EdgeInsets.fromLTRB(0, 7, 0, 7),
                          child: spinkit1,
                        );

                        loading = !loading;
                      });
                    },
                    color: Colors.deepOrangeAccent,
                    textColor: Colors.white,
                    child: f),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 80, 00, 10),
                child: Container(
                  alignment: Alignment.center,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  child: Text(
                    "لا تمتلك حساب ؟",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Almarai",
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 00, 30),
                child: ButtonToUse("إنشاء حساب",
                    fw: FontWeight.bold, fc: Colors.black),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 00, 30),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonToUse(
                      " اضغط هنا",
                      fw: FontWeight.bold,
                      fc: Colors.green,
                    ),
                    Text(
                      "   تمتلك متجر وترغب بالانضمام",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: "Almarai",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    ));
  }
}

class MySeparator extends StatelessWidget {
  final double height;
  final Color color;

  const MySeparator({this.height = 1, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = 5.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}

class ButtonToUse extends StatelessWidget {
  ButtonToUse(this.buttonstring, {this.fw, this.fc, this.myfunc});
  var buttonstring;
  FontWeight fw;
  Color fc;
  Function myfunc;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.transparent,
      elevation: 0,
      disabledElevation: 0,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Text(
        buttonstring,
        style: TextStyle(
          color: fc,
          fontSize: 15,
          fontFamily: "Almarai",
          fontWeight: fw,
        ),
      ),
      onPressed: () {
        myfunc();
      },
    );
  }
}
