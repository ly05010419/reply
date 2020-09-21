import 'package:flutter/material.dart';

import 'LoginWidget.dart';
import 'ScanView.dart';
import 'SettingView.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Smart Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> devices = [
    "Licht Wohnzimmer",
    "Licht Schlafzimmer",
    "Sensor Fenster 1",
    "Sensor Fenster 2",
    "Steckdose 1",
    "Steckdose 2"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LoginWidget(),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            color: Colors.blue,
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ScanView()));
            },
          )
        ],
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            color: Colors.blue,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Text(widget.title),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
            children: devices
                .map((e) => Card(
                      elevation: 5,
                      child: ListTile(
                        title: Text(e),
                        trailing: Switch(
                          value: true,
                          onChanged: (value) {},
                        ),
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) => SettingView()));
                        },
                      ),
                    ))
                .toList()),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
