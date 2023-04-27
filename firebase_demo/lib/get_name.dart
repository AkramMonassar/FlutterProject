import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data/user_model.dart';

class GetUserName extends StatelessWidget {

  final CollectionReference collectionReference =
  FirebaseFirestore.instance.collection('users');



  @override
  Widget build(BuildContext context) {
    collectionReference.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc.id);
      });
    });
    return FutureBuilder<DocumentSnapshot>(
      //Fetching data from the documentId specified of the student
      future: collectionReference.doc(collectionReference.id).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {


        //Error Handling conditions
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist ${collectionReference.id.characters}");
        }

        //Data is output to the user
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data[index].name),
                subtitle: Text(data[index].age.toString()),
              );
            },
          );


            // Text("name: ${data['name']} ${data['age']}");
        }

        return Text("loading");
      },
    );
  }
}