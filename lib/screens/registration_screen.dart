import 'package:app_challenge_flutter/services/userModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:app_challenge_flutter/components/rounded_button.dart';
import 'package:app_challenge_flutter/utilities/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showSpinner = false;
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/img_register.png'),
                  ),
                ),
              ),
              const SizedBox(height: 48.0),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.left,
                onChanged: (value) {
                  email = value;
                },
                decoration:
                kTextFieldDecoration.copyWith(hintText: 'Email'),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.left,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Password'),
              ),
              const SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Register',
                colour: Colors.lightBlueAccent,
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });

                  if (kDebugMode) {
                    print("email: $email");
                    print("pw: $password");
                  }
                  try {
                    final data = await UserModel().register(email, password);
                    setState(() {
                      showSpinner = false;
                    });

                    if (data != null) {
                      print("Success register");
                    } else {
                      print("Try again");
                    }
                  } catch (e) {
                    print("Error: $e");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}