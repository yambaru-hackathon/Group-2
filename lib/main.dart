import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:mic_factory/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '沖縄高専(非)公式アプリ',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '沖縄高専(非)公式アプリ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final _pageWidgets = <Widget>[
    const HomePage(),
    const Text('Timeline'),
    const Text('Account'),
    const Text('Map'),
    const Text('Timetable'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageWidgets.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.timeline), label: 'Timeline'),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/account_icon.png',
                width: 64, height: 64), // unselected状態の画像
            activeIcon: Image.asset('assets/images/account_icon_selected.png',
                width: 64, height: 64), // selected状態の画像
            label: '',
          ), // ラベル
          const BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: 'Timetable'),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        fixedColor: const Color(0xFF66BD44),
        backgroundColor: const Color(0xFFEEEEEE),
        unselectedItemColor: const Color(0xFFA1AEBE),
        showUnselectedLabels: true, // 選択されていないラベルを非表示
        showSelectedLabels: true, //
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
