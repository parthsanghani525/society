import 'package:flutter/material.dart';
import 'package:society/screen/home/bottom_home_screen.dart';
import 'package:society/utils/color.dart';
import 'home/bottom_profile_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final screen = [
    HomeScreen(),
    ProfileScreeen(),
  ];
  final appbar = [Text("Home Page"), Text("Profile")];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appbar[_selectedIndex],
      ),
      drawer: drawer(context),
      bottomNavigationBar: bottomNavbar(),
      body: screen[_selectedIndex],
    );
  }

  Widget drawer(context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: ColorScreen.grey,
                      radius: 50,
                    ),
                    Text("User Name")
                  ],
                )),
                ListTile(
                  leading: Icon(Icons.person),
                  title: const Text('Item 1'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: const Text('Item 2'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ), ElevatedButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: Text("Log Out"),)
        ],
      ),
    );
  }

  Widget bottomNavbar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        )
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: ColorScreen.amber,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
