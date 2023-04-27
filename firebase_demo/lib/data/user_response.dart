//Create User Function
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/data/user_model.dart';

class UserResponse {
 static final _db=FirebaseFirestore.instance;

 static Future createUser(UserModel object) async {
    /// Reference to document
    final docUser = FirebaseFirestore.instance.collection('users').doc();

    final user = UserModel(
      id: docUser.id,
      name: object.name,
      age: object.age,
      birthday: object.birthday,
    );

    final json = user.toJson();

    ///Create document and write data to Firebase
    await docUser.set(json);
  }

// Fetch All uer Or User Details
static  Future<UserModel> getUserDetails(String name) async{
    final snapshot=await _db.collection('users').where('name',isEqualTo: name).get();
    final userData=snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

 static Future<List<UserModel>> getAllUser() async{
    final snapshot=await _db.collection('users').get();
    final userData=snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }


}


