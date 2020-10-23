import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:fluttercharts/screens/query.dart';

import 'package:flutter/services.dart';

/// Hello world !
//void main() => runApp(_DayNightSwitcherExample());
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]).then((_) {
    runApp(_DayNightSwitcherExample());
  });
}

/// The main widget.
class _DayNightSwitcherExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DayNightSwitcherExampleState();
}

/// The main widget state.
class _DayNightSwitcherExampleState extends State<_DayNightSwitcherExample> {
  /// Whether dark mode is enabled.
  bool isDarkModeEnabled = false;

  int _selectedPage = 0;
  final _pageOptions = [
    // NoteDetail(appBarTitle: "sadasd",), // Burada herhangi bir değer vermediğiniz için hata veriyor.
    // NoteList(),
    Query(),
    //ExportToExcel(),
    //MyHomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobimAsistan',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: const Color(0xFF253341)),
        scaffoldBackgroundColor: const Color(0xFF15202B),
      ),
      themeMode: isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text("MobimAsistan"),
            leading: Icon(Icons.menu),
            // backgroundColor: Colors.redAccent,
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 2),
                child: DayNightSwitcherIcon(
                  isDarkModeEnabled: isDarkModeEnabled,
                  onStateChanged: onStateChanged,
                ),
              ),
              //IconButton(icon: Icon(Icons.account_circle), onPressed: () => {})
            ]),
        //  appBar: AppBar(title: Text('Day / night switcher example')),
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          //backgroundColor: Colors.amber,
          //selectedItemColor: Colors.black,
          //unselectedItemColor: Colors.green[800],
          currentIndex: _selectedPage,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                // ignore: deprecated_member_use
                icon: Icon(Icons.home),
                title: Text('home')),
            /* BottomNavigationBarItem(icon: Icon(Icons.work),
              title: Text('work')
              ),*/
            BottomNavigationBarItem(
                // ignore: deprecated_member_use
                icon: Icon(Icons.search),
                title: Text('Arama')),
            BottomNavigationBarItem(
                // ignore: deprecated_member_use
                icon: Icon(Icons.cloud_download),
                title: Text('Excel')),
            BottomNavigationBarItem(
                // ignore: deprecated_member_use
                icon: Icon(Icons.cloud_download),
                title: Text('deneme')),
          ],
        ),
      ),
    );
  }

  /// Called when the state (day / night) has changed.
  void onStateChanged(bool isDarkModeEnabled) {
    setState(() {
      this.isDarkModeEnabled = isDarkModeEnabled;
    });
  }
}
