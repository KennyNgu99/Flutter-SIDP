import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter_app/screens/get_location.dart';
import 'package:flutter_app/screens/qr_scanning.dart';
import 'package:flutter_app/screens/user_info_screen.dart';
import 'package:flutter_app/widgets/google_sign_in_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/widgets/sidemenu.dart';

class HomeScreen extends StatefulWidget {


  //Constructor
  const HomeScreen({Key? key, required User user})
      : _user = user,
        super(key: key);
  final User _user;

@override
_HomeScreenState createState() => _HomeScreenState();
}

 class _HomeScreenState extends State<HomeScreen>{



  late User _user;
  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  int currentPage = 0;
  late final _pageOptions= [UserInfoScreen(user: _user), QRscreen(), MyLocation() ];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();




  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      drawer: new NavDrawer(),




      body: _pageOptions[currentPage],
      bottomNavigationBar: FancyBottomNavigation(
        circleColor: Colors.green,
        tabs: [
          //TabData(iconData: Icons.home, title: "Scan"),
          TabData(iconData: Icons.info_rounded, title: "Home Profile"),
          TabData(iconData: Icons.qr_code, title: "Scan"),
          TabData(iconData: Icons.location_city, title: "Location")



        ],
        onTabChangedListener: (int position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
    );
  }

}


