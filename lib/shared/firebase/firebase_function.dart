import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/models/task_model.dart';

class FirebaseFunction {

 static CollectionReference<TaskModel> getTaskCollection()
  {
  return  FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },);
  }
  static void addTask(TaskModel taskModel) {

    var collection =getTaskCollection();
    var docRef=collection.doc();
    taskModel.id=docRef.id;
    docRef.set(taskModel);
  }
}