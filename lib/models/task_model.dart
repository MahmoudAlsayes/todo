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

  ///mn el firebase map t7wlo l model
  TaskModel.fromJson(Map<String, dynamic> json)
      /// ->> bta5od el map w t7wlha l model
      : this(
          title: json['tittle'],
          date: json['data'],
          Description: json['description'],
          id: json['id'],
          isDone: json['isDone'],
        );

  Map<String, dynamic> toJson() {
    /// ta5od el model t7wlo g map
    return {
      "tittle": title,
      "data": date,
      "description": Description,
      "id": id,
      "isDone": isDone,
    };
  }
}
// TaskModel fromJson(Map<String, dynamic> json) {
//   return TaskModel(
//       title: json['tittle'],
//       Description: json['description'],
//       date: json['data'],
//       isDone: json['isDone'],
//       id: json['id']);
// }
