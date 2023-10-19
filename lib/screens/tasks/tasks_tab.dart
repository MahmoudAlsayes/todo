import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/models/user_model.dart';
import 'package:todo/screens/tasks/task_item.dart';
import 'package:todo/shared/firebase/firebase_function.dart';
import 'package:todo/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var user=ModalRoute.of(context)?.settings.arguments as UserMode;

    return Scaffold(
      appBar: AppBar(
        title: Text("Todo ${user.name}"),
      ),
      body: Column(
        children: [
          CalendarTimeline(
            initialDate: selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              setState(() {
                selectedDate=date;
              });
            },
            leftMargin: 20,
            // shrink: true,
            monthColor: primaryColor,
            dayColor: primaryColor.withOpacity(.70),
            activeDayColor: Colors.white,
            activeBackgroundDayColor: primaryColor,
            dotsColor: Colors.white,
            selectableDayPredicate: (date) => true,
            // date.day != 28
            locale: 'en_ISO',
          ),
          StreamBuilder(
            stream: FirebaseFunction.getTasks(selectedDate),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text("something wnt wrong"));
              }
              List<TaskModel> tasks =
                  snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
              return Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                  return TaskItem(task: tasks[index]);
                },
                itemCount: tasks.length,),
              );
            },
          )
        ],
      ),
    );
  }
}
