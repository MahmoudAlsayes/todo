import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/models/user_model.dart';

class FirebaseFunction {
  static CollectionReference<TaskModel> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        //if didn't find Task -> create Task
        .withConverter<TaskModel>(
      //->> elmafrood enha .add() bss bt7tag map && i can't remember all keys so i create model
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);

        //bb3at el data -> frmoJson trg3o TaskModel
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
  }

  static CollectionReference<UserMode> getUserCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserMode>(
      fromFirestore: (snapshot, _) {
        return UserMode.fromjson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.tojson();
      },
    );
  }

  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime dateTime) {
    return getTaskCollection()
        .where("data",
            isEqualTo: DateUtils.dateOnly(dateTime).millisecondsSinceEpoch)
        .snapshots();

    ///.orderBy("date",descending: true)

    ///<- gebt el tasks
  }

  static void deleteTask(String id) {
    getTaskCollection().doc(id).delete();
  }

  static void updateTask(TaskModel task) {
    getTaskCollection().doc(task.id).update(task.toJson());
  }

  static Future<void> addTask(TaskModel taskModel) {
    var collection = getTaskCollection();
    var docRef = collection.doc();
    taskModel.id = docRef.id;
    return docRef.set(taskModel);
  }
   static Future<void> addUserToFireStore(UserMode userMode) {
    var collection = getUserCollection();
    var doxRef=collection.doc(userMode.id);
    return doxRef.set(userMode);
  }

  static Future<void> creatUser(String name , int age, String email, String password,
      Function onSuccess, Function onError) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user?.uid != null) {
        UserMode user=UserMode(name: name, id: credential.user!.uid, email: email, age: age);
        addUserToFireStore(user).then((value) {
          onSuccess();
        },);
        onSuccess();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError(e.message);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        onError(e.message);

        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }



  static Future<void> login(String email, String password, Function onSuccess,
      Function onError) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user?.uid != null) {
        var user = await readUserFromFireStore(credential.user!.uid);
        onSuccess(user);
      }
    } on FirebaseAuthException catch (e) {
      onError("Wrong mail or Password");
      // if (e.code == 'user-not-found') {
      //   onError(e.message);
      //   print('No user found for that email.');
      // } else if (e.code == 'wrong-password') {
      //   onError(e.message);
      //   print('Wrong password provided for that user.');
      // }
    }
  }
 static Future<UserMode?> readUserFromFireStore(String id)async{
    DocumentSnapshot<UserMode> doc = await
    getUserCollection().doc(id).get();
    return doc.data();
  }
}

