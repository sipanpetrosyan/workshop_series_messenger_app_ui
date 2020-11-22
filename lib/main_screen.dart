import 'package:flutter/material.dart';
import 'package:messenger_app/pages/conversations/conversations_page.dart';
import 'package:messenger_app/pages/discover_page.dart';
import 'package:messenger_app/pages/people_page.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    print("------State is updated------");
    return Scaffold(
      body: _body(),
      bottomNavigationBar: _bottomBar(),
    );
  }

  Widget _body() {
    switch (currentIndex) {
      case 0:
        return ConversationsPage();
      case 1:
        return PeoplePage();
      case 2:
        return DiscoverPage();
      default:
        return ConversationsPage();
    }
  }

  Widget _bottomBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      backgroundColor: Colors.white,
      elevation: 10,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });

        print(currentIndex);
      },
      items: [
        BottomNavigationBarItem(
          label: "",
          icon: Icon(
            Icons.message,
            color: Colors.grey,
          ),
          activeIcon: Icon(
            Icons.message,
            color: Colors.black,
          ),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(
            Icons.group,
            color: Colors.grey,
          ),
          activeIcon: Icon(
            Icons.group,
            color: Colors.black,
          ),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(
            Icons.alarm,
            color: Colors.grey,
          ),
          activeIcon: Icon(
            Icons.alarm,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
