class TaskModel {
  String id;

  String title;

  String Description;

  int date;

  bool isDone;

  TaskModel(
      {this.id = "",
      required this.title,
      required this.Description,
      required this.date,
      this.isDone = false});

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          title: json['tittle'],
          date: json['data'],
          Description: json['description'],
          id: json['id'],
          isDone: json['isDone'],
        );
  Map<String,dynamic>toJson()
  {
    return{
      "title": title,
      "date":date,
      "Description": Description,
      "id":id,
      "isDone": isDone,
    };
  }

// TaskModel fromJson(Map<String, dynamic> json) {
//   return TaskModel(
//       title: json['tittle'],
//       Description: json['description'],
//       date: json['data'],
//       isDone: json['isDone'],
//       id: json['id']);
// }
}
