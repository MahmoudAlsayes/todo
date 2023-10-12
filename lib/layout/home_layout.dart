import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/my_provider.dart';
import 'package:todo/screens/tasks/add_task_bottom_sheet.dart';
import 'package:todo/screens/tasks/tasks_tab.dart';

import '../screens/settings/settings_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "hmoe";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int index = 0;
  List<Widget> tabs = [TasksTab(), SettingsTab()];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
      extendBody: true,

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSheet();
        },
        child: Icon(Icons.add),
        shape: CircleBorder(side: BorderSide(color:provider.modeApp==ThemeMode.light? Colors.white:Color(0xff141922), width: 3)),
      ),
      bottomNavigationBar: BottomAppBar(
        color: provider.modeApp==ThemeMode.light? Colors.white: Color(0xff141922),
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 30,
                ),
                label: ""),
          ],
        ),
      ),
      body: tabs[index],
    );
  }

  void showSheet() {
    showModalBottomSheet(
      context: context,

      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AddTaskBottomSheet(),
        );
      },
    );
  }
}
