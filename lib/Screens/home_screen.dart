import 'package:Chat_UI/Widget/CategorySelector.dart';
import 'package:Chat_UI/Widget/ChatScreen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu,),
        iconSize: 30.0,
        color: Colors.white,
        onPressed: (){}),

        title: Text("Chats",
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.settings,),
        iconSize: 30.0,
        color: Colors.white,
        onPressed: (){}),
        ],
      ),
      body: Column(
        children: <Widget>[
          CategorySelector(),
          ChatScreen(),
          
        ],
      ),
    );
  }
}