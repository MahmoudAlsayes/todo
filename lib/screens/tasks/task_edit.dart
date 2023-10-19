import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/screens/tasks/task_item.dart';
import 'package:todo/shared/firebase/firebase_function.dart';

class TaskEdit extends StatefulWidget {
  static const String routeName = "edit";

  @override
  State<TaskEdit> createState() => _TaskEditState();
}

class _TaskEditState extends State<TaskEdit> {
  var titleController = TextEditingController();

  var descriptionController = TextEditingController();
  var selectedDate = DateTime.now();

  var formKy = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var user = ModalRoute.of(context)?.settings.arguments as TaskModel;
    final dt1 = DateTime.fromMillisecondsSinceEpoch(user.date);

    titleController.text = user.title;
    descriptionController.text = user.Description;

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: titleController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please enter task title";
                }
                return null;
              },
              decoration: InputDecoration(
                label: Text("Task title"),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            SizedBox(
              height: 11,
            ),
            TextFormField(
              controller: descriptionController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please enter task description";
                }
                return null;
              },
              decoration: InputDecoration(
                label: Text("Text Description"),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "edit date",
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () async {
                DateTime? choosenDate = await showDatePicker(
                  context: context,
                  initialDate: dt1,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(
                    Duration(days: 365),
                  ),
                );
                if (choosenDate == null) {
                  return;
                } else {
                  selectedDate = choosenDate;
                  setState(() {});
                }
              },
              child: Text(
                dt1.toString().substring(0, 10),
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.blue),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                user.title = titleController.text;
                user.Description = descriptionController.text;
                user.isDone = false;
                user.date = selectedDate.millisecondsSinceEpoch;

                FirebaseFunction.updateTask(user);
                Navigator.pop(context);
                print(user.title);
              },
              child: Text("Edit"),
            )
          ],
        ),
      ),
    );
  }

// selectDate(BuildContext context) async {
//   DateTime? choosenDate = await showDatePicker(
//       context: context,
//       // builder: (context, child) {
//       //   return Theme(data: Theme.of(context).copyWith(
//       //     colorScheme: ColorScheme.light(
//       //       primary: Colors.red
//       //     )
//       //
//       //   ), child: child!);
//       // },
//       initialDate:selectedDate,
//       firstDate: DateTime.now(),
//       lastDate: DateTime.now().add(Duration(days: 365)));
//   if (choosenDate == null) {
//     return;
//   } else {
//     selectedDate = choosenDate;
//     setState(() {});
//   }
// }
}
