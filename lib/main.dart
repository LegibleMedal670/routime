import 'package:flutter/material.dart';
import 'package:untitled/pages/main_pages/analytics.dart';
import 'package:untitled/pages/main_pages/chart.dart';
import 'package:untitled/pages/main_pages/ckeck.dart';
import 'package:untitled/pages/main_pages/community.dart';
import 'package:untitled/pages/main_pages/group.dart';
import 'package:untitled/pages/main_pages/time.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:untitled/service/block_data.dart';

void main() {
  initializeDateFormatting('ko_KR', null);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _widgetOptions = <Widget>[
    checkPage(),
    timePage(),
    chartPage(),
    analyticsPage(),
    groupPage(),
    communityPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => blockService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.lightGreenAccent
        ),
        home: GestureDetector(
          onTap: (){
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            drawer: Drawer(
              child: ListView(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          print('Settings');
                        },
                        icon: Icon(Icons.settings),
                      ),
                      IconButton(
                        onPressed: () {
                          print('Shopping');
                        },
                        icon: Icon(Icons.shopping_cart),
                      ),
                      IconButton(
                        onPressed: () {
                          print('Share');
                        },
                        icon: Icon(Icons.share),
                      ),
                      IconButton(
                        onPressed: () {
                          print('Edit');
                        },
                        icon: Icon(Icons.edit),
                      ),
                    ],
                  ),
                  ListTile(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    leading: Icon(Icons.account_circle),
                    title: Text('My Profile'),
                    trailing: Text('select'),
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              title: Text('Routime'),
              actions: [
                Row(
                  children: [
                    Icon(Icons.edit),
                    Text('84.7%'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.model_training),
                    Text('96.4%'),
                  ],
                ),
              ],
            ),
            body: SafeArea(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.check,
                      color: Colors.black,
                    ),
                    label: 'check'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.schedule,
                      color: Colors.black,
                    ),
                    label: 'schedule'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.pie_chart,
                      color: Colors.black,
                    ),
                    label: 'chart'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.insights,
                      color: Colors.black,
                    ),
                    label: 'insights'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.groups,
                      color: Colors.black,
                    ),
                    label: 'group'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.chat_bubble,
                      color: Colors.black,
                    ),
                    label: 'community'),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }
}
