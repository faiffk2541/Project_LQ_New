import 'package:flutter/material.dart';
import 'package:newlaundry/navigationbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:newlaundry/widgets/google_signin.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String email;
  String password;

  // checkAuthentification() async {
  //   // ignore: deprecated_member_use
  //   _auth.onAuthStateChanged.listen((user) {
  //     if (user != null) {
  //       Navigator.push(context,
  //           MaterialPageRoute(builder: (context) => NavigationBarPage()));
  //     }
  //   });
  // }

  Future<void> checkAuthen() async {
    await Firebase.initializeApp();
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((response) async {
      if (firebaseAuth.currentUser != null) {
        print(firebaseAuth.currentUser);
      }
      MaterialPageRoute materialPageRoute = MaterialPageRoute(
          builder: (BuildContext context) => NavigationBarPage());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    }).catchError((response) {
      String title = response.code;
      String message = response.message;
      myAlert(title, message);
    });
  }

  // bool validateAndSave() {
  //   final from = formKey.currentState;
  //   if (from.validate()) {
  //     from.save();
  //     return true;
  //   }
  //   return false;
  // }

  // void validateAndSubmit() async {
  //   // ignore: deprecated_member_use
  //   FirebaseUser user;
  //   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //   if (validateAndSave()) {
  //     try {
  //       await firebaseAuth.signInWithEmailAndPassword(
  //           email: emailString, password: passwordString);
  //       print('Signed in: ${user.uid}');
  //     } catch (e) {
  //       print('Error: $e');
  //     }
  //   }
  // }

  Widget showTitle(String title) {
    return ListTile(
      leading: Icon(Icons.add_alarm, size: 30, color: Colors.redAccent),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.red,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget okButton() {
    return FlatButton(
      child: Text('OK'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  void myAlert(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: showTitle(title),
          content: Text(message),
          actions: <Widget>[
            okButton(),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15, left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          Container(
            child: Center(
              child: Image.asset(
                'assets/pin.png',
                width: 40,
                height: 40,
              ),
            ),
          ),
          SizedBox(height: 50),
          Container(
            child: Center(
              child: Text(
                'LAUNDRY',
                style: TextStyle(
                    color: Colors.blue[900],
                    fontFamily: 'Prompt',
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(height: 50),
          Center(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 330,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        hintText: "อีเมล์",
                        icon: Icon(
                          Icons.email,
                          color: Colors.grey[100],
                        ),
                      ),
                      validator: (value) =>
                          value.isEmpty ? 'กรุณากรอกอีเมล์' : null,
                      onSaved: (String value) {
                        email = value.trim();
                      },
                      style: TextStyle(
                        fontFamily: 'Prompt',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    height: 50,
                    width: 330,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(25)),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      autocorrect: false,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        hintText: "รหัสผ่าน",
                        icon: Icon(
                          Icons.lock,
                          color: Colors.grey[100],
                        ),
                      ),
                      validator: (value) =>
                          value.isEmpty ? 'กรุณากรอกรหัสผ่าน' : null,
                      onSaved: (String value) {
                        password = value.trim();
                      },
                      style: TextStyle(
                        fontFamily: 'Prompt',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 70),
          Center(
            child: Container(
              width: 250,
              child: RaisedButton(
                onPressed: () {
                  formKey.currentState.save();
                  print('email = $email, password = $password');
                  checkAuthen();
                },
                padding: EdgeInsets.all(10),
                color: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  'เข้าสู่ระบบ',
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontFamily: 'Prompt',
                      fontSize: 18,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          Center(
            child: Text(
              '- หรือ -',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Prompt',
                  fontSize: 18,
                  fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: _signInButton(),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.white,
      onPressed: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return NavigationBarPage();
                },
              ),
            );
          }
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/logogoogle.png', height: 35),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
