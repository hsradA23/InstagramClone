import 'package:flutter/cupertino.dart';
import 'package:instagram/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(
          brightness: Brightness.light, primaryColor: CupertinoColors.black),
      home: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
            ),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.search)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.add_circled)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_solid)),
          ]),
          tabBuilder: (BuildContext context, int index) {
            return CupertinoTabView(
              builder: (BuildContext context) {
                return Center(
                  child: index == 0
                      ? const HomePage()
                      : Text('Content of tab $index'),
                );
              },
            );
          }),
    );
  }
}
