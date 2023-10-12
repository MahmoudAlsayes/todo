import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/tasks/task_item.dart';
import 'package:todo/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.appTitle),
        ),
        body: Column(
        children: [

          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) => print(date),
            leftMargin: 20,
            // shrink: true,
            monthColor: primaryColor,
            dayColor: primaryColor.withOpacity(.70),
            activeDayColor: Colors.white,
            activeBackgroundDayColor:primaryColor,
            dotsColor: Colors.white,
            selectableDayPredicate: (date) =>true ,
            // date.day != 28
            locale: 'en_ISO',
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return TaskItem();
            }, itemCount: 20,),
          )

        ],
    ),
      );
  }
}
