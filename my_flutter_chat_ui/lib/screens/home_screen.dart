import 'package:flutter/material.dart';
import 'package:my_flutter_chat_ui/Widgets/category_selector.dart';
import 'package:my_flutter_chat_ui/Widgets/favorite_contact.dart';
import 'package:my_flutter_chat_ui/Widgets/recent_chats.dart';
import 'package:my_flutter_chat_ui/menu/menu_main.dart';
import 'package:my_flutter_chat_ui/models/message_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>MenuMain())),
        ),
        title: const Center(
            child: Text(
          'Chats',
          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
        )),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          CategorySelector(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
              child: Column(
                children: const [
                  FavoriteContact(),
                  RecentChats(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
