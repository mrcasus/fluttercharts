import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttercharts/screens/bakimList.dart';
import 'package:fluttercharts/screens/demirbasList.dart';
import 'package:fluttercharts/screens/homeScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //Page Screen arası rout config
      getPages: [
        GetPage(name: '/home', page: () => MyHomePage()),
      ],

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int currentIndex = 0;
  List<Widget> _listPages = [
    HomeTabScreen(),
    DemirbasListScreen(),
    BakimListScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'deneme',
          style: TextStyle(
              fontFamily: 'Montserrat', fontSize: 25.0, color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.black,
          // iconSize: 17.0,
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Get.toNamed("/home");
            },
            icon: Icon(
              FontAwesomeIcons.bell,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: _listPages[currentIndex],
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        showElevation: true,
        itemCornerRadius: 8,
        curve: Curves.easeInBack,
        onItemSelected: (index) => setState(() {
          currentIndex = index;
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Anasayfa'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.people),
            title: Text('Demirbaş Liste'),
            activeColor: Colors.purpleAccent,
            textAlign: TextAlign.left,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.message),
            title: Text(
              'Bakım Listesi',
            ),
            activeColor: Colors.pink,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
