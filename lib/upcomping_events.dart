import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixon/components/event_container.dart';
import 'package:tixon/providers.dart';
import 'package:http/http.dart' as http;

class UpcompingEvents extends StatefulWidget {
  @override
  _UpcompingEventsState createState() => _UpcompingEventsState();
}

class _UpcompingEventsState extends State<UpcompingEvents> {
  Future<List<dynamic>> getEvents() async {
    final url = 'http://0.0.0.0:5800';
    final response = await http.get(Uri.parse(url));
    //     //headers: {
    //   // "Authorization": "Zoho-oauthtoken 1000.5c332e7880e5cfb3887c88d451e43980.5f4e3c97c7790b99fbf0a7f38530c354",
    //   // "content-type": "application/json",
    // });
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(0.01 * width),
      color: Colors.red,
      width: width * 0.7,
      height: width * 0.47,
      child: FutureBuilder<List<dynamic>>(
        future: getEvents(),
        builder: (context, snapshot) {
          // Check connection state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No events found.'));
          } else {
            // If data is available, build the grid view
            final events = snapshot.data!;
            return GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of columns
                crossAxisSpacing: 0.02 * width, // Space between columns
                mainAxisSpacing: 0.02 * width, // Space between rows
              ),
              itemCount: events.length, // Use the actual number of events
              itemBuilder: (context, index) {
                final event = events[index]; // Get the current event
                return EventContainer(
                  website_url: event['website_url'] ?? '', // Use null-aware operator for safety
                  thumbnail_url: event['thumbnail_url'] ?? '', // Use null-aware operator for safety
                );
              },
            );
          }
        },
      ),
    );
  }
}