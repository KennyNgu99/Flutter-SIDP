import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/screens/home_screen.dart';
import'package:flutter/material.dart';
import 'package:flutter_app/screens/sign_in_screen.dart';
import 'package:flutter_app/widgets/splash_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SignInScreen(),
        '/profile': (context) => HomeScreen(user: user)
      },
      //home: SignInScreen(),
    );
  }
}

//**********************************************

/*
void main() {
  runApp(new MaterialApp(home: new MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Open Popup"),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Positioned(
                          right: -40.0,
                          top: -40.0,
                          child: InkResponse(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: CircleAvatar(
                              child: Icon(Icons.close),
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RaisedButton(
                                  child: Text("Submitß"),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });
          }, //on pressed

        ),
      ),
    );
  }
}
*/

//*****************************************


/*
Future _ackAlert(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Not in stock'),
        content: const Text('This item is no longer available'),
        actions: [
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
enum ConfirmAction { CANCEL, ACCEPT }
Future _asyncConfirmDialog(BuildContext context) async {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Reset settings?'),
        content: const Text(
            'This will reset your device to its default factory settings.'),
        actions: [
          FlatButton(
            child: const Text('CANCEL'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.CANCEL);
            },
          ),
          FlatButton(
            child: const Text('ACCEPT'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.ACCEPT);
            },
          )
        ],
      );
    },
  );
}

Future _asyncInputDialog(BuildContext context) async {
  String teamName = '';
  return showDialog(
    context: context,
    barrierDismissible: false, // dialog is dismissible with a tap on the barrier
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Enter current team'),
        content: new Row(
          children: [
            new Expanded(
                child: new TextField(
                  autofocus: true,
                  decoration: new InputDecoration(
                      labelText: 'Team Name', hintText: 'eg. Juventus F.C.'),
                  onChanged: (value) {
                    teamName = value;
                  },
                ))
          ],
        ),
        actions: [
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop(teamName);
            },
          ),
        ],
      );
    },
  );
}

enum Departments { Production, Research, Purchasing, Marketing, Accounting }

Future _asyncSimpleDialog(BuildContext context) async {
  return await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select Departments '),
          children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Departments.Production);
              },
              child: const Text('Production'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Departments.Research);
              },
              child: const Text('Research'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Departments.Purchasing);
              },
              child: const Text('Purchasing'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Departments.Marketing);
              },
              child: const Text('Marketing'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Departments.Accounting);
              },
              child: const Text('Accounting'),
            )
          ],
        );
      });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("Dialog"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new RaisedButton(
              onPressed: () {
                _ackAlert(context);
              },
              child: const Text("Ack Dialog"),
            ),
            new RaisedButton(
              onPressed: () async {
                final ConfirmAction action = await _asyncConfirmDialog(context);
                print("Confirm Action $action" );
              },
              child: const Text("Confirm Dialog"),
            ),
            new RaisedButton(
              onPressed: () async {
                final Departments deptName = await _asyncSimpleDialog(context);
                print("Selected Departement is $deptName");
              },
              child: const Text("Simple dialog"),
            ),
            new RaisedButton(
              onPressed: () async {
                final String currentTeam = await _asyncInputDialog(context);
                print("Current team name is $currentTeam");
              },
              child: const Text("Input Dialog"),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(new MaterialApp(home: new MyApp()));
}
*/

//************************************



