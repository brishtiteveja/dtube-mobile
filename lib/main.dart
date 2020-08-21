import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_info/package_info.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'screens/home.dart';

import 'screens/login.dart';

var videoData;

// analytics
FirebaseAnalytics analytics = new FirebaseAnalytics();
var pubIndex = 0;

void main() {
  runApp(DtubeApp());
}

class DtubeApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /*
    var _temp = {"user": await retrieveData("user")};
    user = _temp["user"];

    // set theme
    var _tempTheme = await retrieveData("theme");
    if (_tempTheme != null && _tempTheme != "value") {
      print(_tempTheme);
      selectedTheme = _tempTheme;
    } else {
      selectedTheme = "normal";
    }

    */

    var internet = true;

    /*
    // first start
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    int buildNumber = int.parse(packageInfo.buildNumber);
    var _tempBuildNumber = await retrieveData("buildNumber");

    */

    // first start
    /*
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    int buildNumber = int.parse(packageInfo.buildNumber);
    var _tempBuildNumber = await retrieveData("buildNumber");
    */

    //if (_tempBuildNumber == null || int.parse(_tempBuildNumber) < buildNumber && user == null)
    if (false) {
      //saveData("gateway", "https://video.dtube.top/ipfs/");
      //saveData("buildNumber", buildNumber.toString());
      print("Hello");
      return MaterialApp(
        theme: //ThemeData(primaryColor: theme(selectedTheme)["background"], textSelectionColor: theme(selectedTheme)["accent"]),,
        ThemeData(primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        debugShowCheckedModeBanner: false,
        home: internet ? LoginScreen() : new Center(child: new Text("An error occured. Please check your internet connection.")),
        navigatorObservers: [
          new FirebaseAnalyticsObserver(analytics: analytics),
        ],
      );
    } else {
      return MaterialApp(
        //theme: ThemeData(primaryColor: theme(selectedTheme)["background"], textSelectionColor: theme(selectedTheme)["accent"]),
        theme: //ThemeData(primaryColor: theme(selectedTheme)["background"], textSelectionColor: theme(selectedTheme)["accent"]),,
        ThemeData(primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        debugShowCheckedModeBanner: false,
        home: internet ? TabNav() : new Center(child: new Text("An error occured. Please check your internet connection.")),
        navigatorObservers: [
          //new FirebaseAnalyticsObserver(analytics: analytics),
        ],
      );
    }
    /*
      return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );

     */
  }
}

class TabNav extends StatefulWidget {
  @override
  createState() => new TabNavState();
}

class TabNavState extends State<TabNav> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 5,
        child: new Scaffold(
          backgroundColor:  Colors.green, //theme(selectedTheme)["background"],
          body: new Stack(
            children: <Widget>[
              new Offstage(
                  offstage: pubIndex != 0,
                  child: new TickerMode(
                      enabled: true,
                      child: new HomeScreen(),
                  ),
              ),
            ],
          ),
        ),
    );
  }
}



