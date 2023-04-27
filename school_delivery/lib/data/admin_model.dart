
import 'package:cloud_firestore/cloud_firestore.dart';

class Administrator {
  String?  id;
  String? fullName;
  int? phone;
  String? userName;
  String? password;
  String? rePassword;
  static final _db=FirebaseFirestore.instance;

  Administrator({this.id, this.fullName, this.phone, this.userName,this.password,this.rePassword});

  Map<String,dynamic> toJson()=>{
    'id':id,
    'fullName':fullName,
    'phone':phone,
    'userName':userName,
    'password':password,
    'rePassword':rePassword,
  };
  factory Administrator.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document ) {
    final data = document.data()!;
    print("data is : ${data}");
    print("data of name ${data["name"]}");
    return Administrator(
        id: document.id,
        fullName: data["name"],
        phone: data["age"],
        userName: data["userName"],
        password: data["password"],
        rePassword: data["rePassword"]
    );
  }

  static Future createAdministrator(Administrator object) async{
    /// Reference to document
    final docAdministrator=FirebaseFirestore.instance.collection('administrators').doc();

    final admin=Administrator(
      id:docAdministrator.id,
      fullName:object.fullName,
      phone:object.phone,
      userName:object.userName,
      password: object.password,
      rePassword:object.rePassword,
    );
    final json=admin.toJson();
    ///Create document and write data to Firebase
    await docAdministrator.set(json);
  }
// Fetch All uer Or User Details
  static  Future<Administrator> getUserDetails(String name) async{
    final snapshot=await _db.collection('users').where('name',isEqualTo: name).get();
    final userData=snapshot.docs.map((e) => Administrator.fromSnapshot(e)).single;
    return userData;
  }

  static Future<List<Administrator>> getAllUser() async{
    final snapshot=await _db.collection('users').get();
    final userData=snapshot.docs.map((e) => Administrator.fromSnapshot(e)).toList();
    return userData;
  }
}


