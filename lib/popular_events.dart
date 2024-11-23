
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixon/providers.dart';
import 'components/event_container.dart';

class PopularEvents extends StatefulWidget {
  const PopularEvents({super.key});
  @override
  State<PopularEvents> createState() => _PopularEventsState();
}

class _PopularEventsState extends State<PopularEvents> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Container(
        padding: EdgeInsets.all(0.01*width),
        color: Colors.white,
        width: MediaQuery.of(context).size.width*0.7,
        height: 0.7*width,
        child: Consumer<EventsProvider>(
          builder: (BuildContext context, value, Widget? child) =>
          GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of columns
                crossAxisSpacing: 0.02*width, // Space between columns
                mainAxisSpacing: 0.02*width, // Space between rows
              ),
              itemCount: value.Events.length, // Total number of items
              itemBuilder: (context, index) {
                return EventContainer(
                  website_url: value.Events[index]['website_url'],
                  thumbnail_url: value.Events[index]['thumbnail_url'],
                );}
          ),
        )
    );
  }
}
