import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/sign_in_screen.dart';
import 'package:flutter_app/utils/Authentication.dart';
import 'package:flutter_app/widgets/sidemenu.dart';


class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {

  late User _user;


  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: new NavDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(

        elevation: 0,
        backgroundColor: Colors.orangeAccent,
        title: Text('Home'),
        centerTitle: true,
        leading: IconButton (
          icon: Icon(Icons.settings),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 300.0,
          ),

          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 30.0,
                  child: Text(
                    "Welcome to Workplace Tracker!",
                     style: TextStyle(
                     color: Colors.black,
                     fontSize: 18,
                  ),
                 ),
                ),
             ),

              Row(),
              _user.photoURL != null
                  ? ClipOval(
                child: Material(
                  color: Colors.grey.withOpacity(0.3),
                  child: Image.network(
                    _user.photoURL!,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              )
                  : ClipOval(
                child: Material(
                  color: Colors.grey.withOpacity(0.3),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 8.0),
              Text(
                _user.displayName!,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '( ${_user.email!} )',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 20,
                  letterSpacing: 0.5,
                ),
              ),

              SizedBox(height: 100.0),
              Text(
                'Temperature = ',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  letterSpacing: 0.5,

                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Category = ',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  letterSpacing: 0.5,

                ),
              ),

            ],
          ),
        ),
      ),
    );

  }
}

