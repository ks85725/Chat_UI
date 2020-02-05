import 'package:Chat_UI/Screens/ChatScreen2.dart';
import 'package:Chat_UI/Widget/Recent_Chat.dart';
import 'package:Chat_UI/models/message_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
          color: Theme.of(context).accentColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Favorite Contacts",
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        letterSpacing: 1.0,
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.more_horiz),
                        iconSize: 30.0,
                        onPressed: () {})
                  ],
                ),
              ),
              Container(
                height: 120.0,
                child: ListView.builder(
                    //padding: EdgeInsets.only(left: 20.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: favorites.length,
                    itemBuilder: (context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ChatScreen2(user:favorites[index])));
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 30.0,
                                backgroundImage:
                                    AssetImage(favorites[index].imageUrl),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                favorites[index].name,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              RecentChat()
            ],
          ),
        ),
      ),
    );
  }
}
