import 'package:Chat_UI/models/message_model.dart';
import 'package:Chat_UI/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen2 extends StatefulWidget {
  final User user;

  ChatScreen2({this.user});

  @override
  _ChatScreen2State createState() => _ChatScreen2State();
}

class _ChatScreen2State extends State<ChatScreen2> {
  Widget _BuildMessages(Message message, bool isMe) {
    final Container msg = Container(
      width: MediaQuery.of(context).size.width * 0.68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: isMe ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
      ),
      margin: isMe
          ? EdgeInsets.only(top: 10.0, bottom: 10.0, left: 80.0)
          : EdgeInsets.only(top: 10.0, bottom: 10.0, right: 80.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.time,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12.0,
              color: Colors.blueGrey,
            ),
          ),
          SizedBox(
            height: 7.0,
          ),
          Text(
            message.text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12.0,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );

    if (isMe) {
      return msg;
    }

    return Padding(
      padding: EdgeInsets.only(left: 2.0, right: 2.0),
      child: Row(
        children: <Widget>[
          msg,
          IconButton(
              icon: Icon(
                message.isLiked ? Icons.favorite_border : Icons.favorite,
                color: message.isLiked
                    ? Colors.blueGrey
                    : Theme.of(context).primaryColor,
              ),
              iconSize: 30.0,
              onPressed: () {}),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.user.name,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.more_horiz,
              ),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {}),
        ],
      ),
      body: GestureDetector(
        onTap: ()=>FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                  child: ListView.builder(
                      reverse: true,
                      padding: EdgeInsets.only(top: 15.0),
                      itemCount: messages.length,
                      itemBuilder: (context, int index) {
                        final Message message = messages[index];
                        bool isMe = message.sender.id == currentUser.id;
                        return _BuildMessages(message, isMe);
                      }),
                ),
              ),
            ),
            _BuildMessagesFelid(),
          ],
        ),
      ),
    );
  }

  Widget _BuildMessagesFelid() {
    return Container(
      height: 70.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.insert_emoticon,
                color: Colors.blueGrey,
                size: 25.0,
              ),
              onPressed: () {}),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value){},
              decoration: InputDecoration.collapsed(
                hintText: "Send Messages...",
              ),
            ),
          ),
          IconButton(
              icon: Icon(
                Icons.send,
                color: Colors.blueGrey,
                size: 25.0,
              ),
              onPressed: () {}),
        ],
      ),
    );
  }
}
