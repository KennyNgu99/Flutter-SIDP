
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/sign_in_screen.dart';
import 'package:flutter_app/widgets/custom_dialog_box.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Align(
          alignment: Alignment.topCenter,
              child: Text(
                'Side Menu',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
      ),
            decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/flutterbird.png'))),
          ),

          ListTile(
            leading: Icon(Icons.info_rounded),
            title: Text('About'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => CustomDialogBox()));

            },
          ),

          ListTile(
            leading: Icon(Icons.data_usage),
            title: Text('Complete your Information'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              //Navigator.of(context).pop()
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LogOut()));
            },
          ),
        ],
      ),
    );
  }
}


