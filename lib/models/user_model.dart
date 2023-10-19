class UserMode {
  String name;

  String id;

  String email;

  int age;

  UserMode(
      {required this.name,
      required this.id,
      required this.email,
      required this.age});

  UserMode.fromjson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          name: json['name'],
          email: json['email'],
          age: json['age'],
        );
  Map<String,dynamic>tojson(){
    return{
      "id":  id,
      "name": name,
      "email": email,
      "age": age,
    };
  }
}
