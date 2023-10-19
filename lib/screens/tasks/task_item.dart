
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/provider/my_provider.dart';
import 'package:todo/screens/tasks/task_edit.dart';
import 'package:todo/shared/firebase/firebase_function.dart';
import 'package:todo/shared/styles/colors.dart';

class TaskItem extends StatelessWidget {
  TaskModel task;

  TaskItem({required this.task, super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Card(
        color: provider.modeApp == ThemeMode.light
            ? Colors.white
            : Color(0xff141922),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Slidable(
          startActionPane: ActionPane(
            motion: BehindMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  FirebaseFunction.deleteTask(task.id);
                },
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    bottomLeft: Radius.circular(14)),
                label: "Delete",
                icon: Icons.delete,
                backgroundColor: Colors.red,
              ),
            ],
          ),
          endActionPane: ActionPane(motion: DrawerMotion(), children: [
            SlidableAction(
              onPressed: (context) {
                Navigator.pushNamed(context, TaskEdit.routeName,arguments:
                task
                );

              },
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(14),
                  bottomRight: Radius.circular(14)),
              label: "Edit",
              icon: Icons.edit,
              backgroundColor: Colors.blue,
            ),
          ]),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 3,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${task.title}",
                      style: TextStyle(color: primaryColor),
                    ),
                    Text(
                      "${task.Description}",
                      style: TextStyle(
                        color: provider.modeApp == ThemeMode.light
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ],
                ),
                Spacer(),
               task.isDone?  Container(
                   padding:
                   EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(8),
                     color: Colors.green,
                   ),
                   child: Text("Done",style: TextStyle(color: Colors.white),)):
               InkWell(
                  onTap: () {
                    task.isDone = true;
                    FirebaseFunction.updateTask(task);
                  },
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blue,
                      ),
                      child: Icon(
                        Icons.done,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
