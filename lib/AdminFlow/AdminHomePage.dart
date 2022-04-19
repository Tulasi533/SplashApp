import 'package:flutter/material.dart';
import 'package:splash_app/AdminFlow/AdminMenuPage.dart';
import 'package:splash_app/Event/Events.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({ Key? key }) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF09488D),
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context)=> AdminMenuPage()
              )
            );
          } 
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Events(url: "/event/getUpcomingEvents", heading: "Upcoming Events"),
            Events(url: "/event/getOngoingEvents", heading: "Ongoing Events"),
            Events(url: "/event/getPastEvents", heading: "Past Events")
          ]
        ),
      )
    );
  }
}