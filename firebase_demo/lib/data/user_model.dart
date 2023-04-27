import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String name;
  final int age;
  final DateTime birthday;

  UserModel({
    this.id = '',
    required this.name,
    required this.age,
    required this.birthday,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
        'birthday': birthday,
      };

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        age: json['age'],
        birthday: (json['birthday'] as Timestamp).toDate(),
      );

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document ) {
    final data=document.data()!;
    print("data is : ${data}");
    print("data of name ${data["name"]}");
    return UserModel(
      id: document.id,
      name: data["name"],
      age:data["age"],
      birthday:DateTime(2023,03,01,1,30,00),
    );


  }


}
