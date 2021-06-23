import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Some App'),
        ),
        body: Center(
          child: Builder(
            builder: (context) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  onPressed: () {
                    showToast();
                  },
                  child: Text("Click here"),
                ),
                //-----------------------------//
                MaterialButton(
                  onPressed: () {
                    showSnackBar();
                  },
                  child: Text("snackbar"),
                ),
                //------------------------//
                MaterialButton(
                  onPressed: () {
                    showAlert(context);
                  },
                  child: Text("test"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showToast() {
    setState(() {
      Fluttertoast.showToast(
        msg: 'Button Pressed',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    });
  }

  void showSnackBar() {
    setState(() {
      final snackbar = SnackBar(
        content: Text("Your data has changed"),
        duration: Duration(seconds: 3),
        action: SnackBarAction(label: "undo", onPressed: () {}),
      );
      // ignore: deprecated_member_use
      _scaffoldKey.currentState!.showSnackBar(snackbar);
    });
  }

  void showAlert(BuildContext context) {
    setState(() {
      Widget buttonOK = MaterialButton(
        child: Text("Yes"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );

      Widget buttonCancel = MaterialButton(
        child: Text("Absolutely yes"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );
      AlertDialog alert = AlertDialog(
        title: Text("Rate Our App"),
        content: Text("Please give our app five stars in play store"),
        actions: [
          buttonOK,
          buttonCancel,
        ],
      );
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    });
  }
}
