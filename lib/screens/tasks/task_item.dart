import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/my_provider.dart';
import 'package:todo/shared/styles/colors.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 8),
      child: Card(
        color: provider.modeApp==ThemeMode.light ?Colors.white:Color(0xff141922),
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14)
        ),
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
                  Text("Task Tittle",style: TextStyle(color: primaryColor),),
                  Text("Task discription",style: TextStyle(color:provider.modeApp==ThemeMode.light ?Colors.black:Colors.white,),),
                ],
              ),
              Spacer(),
              IconButton(onPressed: (){}, icon: Icon(Icons.done,color: primaryColor)),
            ],
          ),
        ),
      ),
    );
  }
}
