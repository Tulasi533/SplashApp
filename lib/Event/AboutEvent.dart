import 'package:flutter/material.dart';
import 'package:splash_app/Model/eventModel.dart';
import 'package:splash_app/NetworkHandler.dart';

class AboutEvent extends StatefulWidget {
  final EventModel item;
  final String type;
  const AboutEvent({ Key? key, required this.item, required this.type}) : super(key: key);

  @override
  State<AboutEvent> createState() => _AboutEventState();
}

class _AboutEventState extends State<AboutEvent> {
  NetworkHandler networkHandler = NetworkHandler();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF09488D),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.clear, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 85,
                backgroundImage: networkHandler.getImage(widget.item.id.toString()),
              ),
              Text(
                widget.item.name.toString().toUpperCase(),
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: "QuickSand",
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
              otherDetails("Organizer", widget.item.organizer.toString()),
              otherDetails("Scope", widget.item.scope.toString()),
              otherDetails("Eligibilty", widget.item.eligibility.toString()),
              otherDetails("Registation Start Date", widget.item.regstartdate.toString()),
              otherDetails("Registration End Date", widget.item.regenddate.toString()),
              otherDetails("Venue", widget.item.venue.toString()),
              otherDetails("Event Start Date", widget.item.eventstartdate.toString()),
              otherDetails("Event End Date", widget.item.eventenddate.toString()),
              if(widget.item.discription.toString() != "") otherDetails("About Event", widget.item.discription.toString()),
              if(widget.item.winnercriteria.toString() != "") otherDetails("Winner Criteria", widget.item.winnercriteria.toString()),
            ]
          ),
        ) 
      ),
    );
  }

  Widget otherDetails(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child:Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label :",
            style: TextStyle(
              letterSpacing: 1,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD1F7FF),
              fontFamily: "QuickSand"
            ),
          ),
          SizedBox(width: 5),
          Expanded(child: Text(
            value,
            style: TextStyle(
              fontSize: 17,
              color: Color(0xFFFFE0E6),
              fontFamily: "QuickSand",
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.visible
            ),
          )
          )
        ],
      )
    );
  }
}