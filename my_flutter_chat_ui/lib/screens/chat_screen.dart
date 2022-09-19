import 'package:flutter/material.dart';
import 'package:my_flutter_chat_ui/models/message_model.dart';
import 'package:my_flutter_chat_ui/models/user_model.dart';

class ChatScreen extends StatefulWidget {
  final User? user;
  ChatScreen({this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  Widget _buildMessage(Message message, bool isMe) {
    final Flexible msg = Flexible(
      flex: 2,
      child: Container(
        margin: isMe
            ? const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0)
            : const EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
              ),
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
        width: MediaQuery.of(context).size.width * 75,
        decoration: BoxDecoration(
          color: isMe ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
          borderRadius: isMe
              ? const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0))
              : const BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.time,
              style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(message.text,
                style: const TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
    if(isMe){
      return msg;
    }
    return Row(
      children: [
        msg,
        Flexible(
          flex: 0,
          child: IconButton(
            icon: message.isLiked
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border),
            iconSize: 30.0,
            color: message.isLiked
                ? Theme.of(context).primaryColor
                : Colors.blueGrey,
            onPressed: () {},
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Center(
          child: Text(widget.user!.name,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold)),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          )
        ],
      ),
      body: GestureDetector(
        onTap: ()=>Focus.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0))),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0)),
                  child: ListView.builder(
                      reverse: true,
                      padding: const EdgeInsets.only(top: 15.0),
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Message message = messages[index];
                        final bool isMe = message.sender.id == currentUser.id;
                        return _buildMessage(message, isMe);
                      }),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }

  _buildMessageComposer() {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: [
          IconButton(onPressed: (){},
              icon: const Icon(Icons.attachment),iconSize: 25.0,
          color: Theme.of(context).primaryColor,),
           Expanded(
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                onChanged: (value){
                },
            decoration: const InputDecoration.collapsed(
              hintText:'Send a Message ........',
            ),
          )),
          IconButton(
            onPressed: (){

            },
            icon: const Icon(Icons.send),iconSize: 25.0,
            color: Theme.of(context).primaryColor,)
        ],
      ),
    );
  }
}
