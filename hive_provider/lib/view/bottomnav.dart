import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hive_provider/controller/mainprovider.dart';
import 'package:hive_provider/view/list.dart';
import 'package:hive_provider/view/todo.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    List screens = [TodoListScreen(),  ListNotes()];
    final mainprovider = Provider.of<MainProvider>(context);
    return Scaffold(
      body: screens[mainprovider.selectedIndex.index],  
      bottomNavigationBar: Container(
        height: 70,  
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: GNav(
              backgroundColor: Colors.black,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              duration: const Duration(microseconds: 400),
              color: Colors.grey,
              onTabChange: (index) {
                mainprovider.changeselectedIndex(index);
              },
              tabs: const [
                GButton(icon: CupertinoIcons.calendar, text: "todo"),
                GButton(icon: CupertinoIcons.list_dash, text: "list"),
              ]),
        ),
      ),
    );
  }
}
