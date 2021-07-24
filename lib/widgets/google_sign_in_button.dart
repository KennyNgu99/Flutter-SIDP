import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_app/screens/user_info_screen.dart';
import 'package:flutter_app/utils/Authentication.dart';
import 'package:firebase_database/firebase_database.dart';

class GoogleSignInButton extends StatefulWidget {
  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {

  final databaseReference = FirebaseDatabase.instance.reference();
  late DatabaseReference userinfo = databaseReference.child('User Info');
  late DatabaseReference email = databaseReference.child('Email');
  late DatabaseReference name = databaseReference.child('Name');
  late DatabaseReference temp = databaseReference.child('Temp');


  void writedatabase( String? username, String? email  ){
    userinfo.push().set({'name' : username, 'email' : email });
  }

  void Store_Name (String? username){
    name.set({ 'name': username });

  }

  void Store_Email (String? emailinfo){
    email.set({'email' : emailinfo});
  }

  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      )
          : OutlinedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
          onPressed: () async {

            setState(() {
              _isSigningIn = true;
            });

            User? user =
            await Authentication.signInWithGoogle(context: context);

            setState(() {
              _isSigningIn = false;
            });

            if (user != null) {


              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) =>
                      HomeScreen(user : user)

                  //UserInfoScreen(user: user),
                ),
              );
              // STORE DATA TO DB HERE
              writedatabase(user.displayName, user.email);
              Store_Name(user.displayName);
              Store_Email(user.email);
            }

          },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage("assets/images/google_logo.png"),
                height: 35.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Sign in with Google',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}