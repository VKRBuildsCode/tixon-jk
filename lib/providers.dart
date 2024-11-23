import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
class EventsProvider extends ChangeNotifier{

  List _events=[{'id': '30169000000092001', 'space': {'id': '30169000000002010'}, 'timezone': 'Asia/Calcutta', 'status': 1, 'status_string': 'published', 'category': 'OTHERS', 'language': 'en', 'name': 'kalyan', 'description': '', 'summary': '', 'created_by': {'id': '30169000000002001', 'email': 'rakalyanram@gmail.com', 'first_name': 'rakalyanram', 'company': 'None', 'designation': 'None'}, 'created_time': '2024-11-22T16:34:21Z', 'last_modified_by': {'id': '30169000000002001', 'email': 'rakalyanram@gmail.com', 'first_name': 'rakalyanram', 'company':'None', 'designation':' None'}, 'last_modified_time': '2024-11-22T16:37:26Z', 'event_type': 2, 'event_type_string': 'venue', 'start_time': '2024-12-22T02:30:00Z', 'end_time': '2024-12-26T11:30:00Z', 'website_url': 'https://mannnnnn.zohobackstage.in/kk', 'thumbnail_url': 'https://previewengine-accl.zohopublic.in/image/BACKSTAGE/30169000000102591?cli-msg=eyJpZCI6IjMwMTY5MDAwMDAwMTAyNTkxIiwibW9kdWxlIjoiRXZlbnRJbWFnZVJlc291cmNlIiwic3ViUmVzb3VyY2VJZCI6NjAwMzQ1Njk0ODMsInR5cGUiOiIwIiwicG9ydGFsSWQiOiI2MDAzNDU2OTQ4MyJ9'}, {'id': '30169000000016001', 'space': {'id': '30169000000002010'}, 'timezone': 'Asia/Calcutta', 'status': 1, 'status_string': 'published', 'category': 'OTHERS', 'language': 'en', 'name': 'kalykalyaa', 'description': '', 'summary': '', 'created_by': {'id': '30169000000002001', 'email': 'rakalyanram@gmail.com', 'first_name': 'rakalyanram', 'company': 'None', 'designation': 'None'}, 'created_time': '2024-11-21T12:59:07Z', 'last_modified_by': {'id': '30169000000002001', 'email': 'rakalyanram@gmail.com', 'first_name': 'rakalyanram', 'company': 'None', 'designation': 'None'}, 'last_modified_time': '2024-11-21T16:56:38Z', 'event_type': 2, 'event_type_string': 'venue', 'start_time': '2024-12-21T02:30:00Z', 'end_time': '2024-12-25T11:30:00Z', 'website_url': 'https://mannnnnn.zohobackstage.in/kalykalyaa', 'thumbnail_url': 'https://static.zohocdn.com/backstage/v1.0/images/themes/zephyr-bg-9125539871dcfedd51e8c6f39f6d240d.png'}, {'id': '30169000000002025', 'space': {'id': '30169000000002010'}, 'timezone': 'Asia/Calcutta', 'status': 1, 'status_string': 'published', 'category': 'OTHERS', 'language': 'en', 'name': 'kalyan ram', 'description': '', 'summary': '', 'created_by': {'id': '30169000000002001', 'email': 'rakalyanram@gmail.com', 'first_name': 'rakalyanram', 'company': 'None', 'designation': 'None'}, 'created_time': '2024-11-19T16:00:47Z', 'last_modified_by': {'id': '30169000000002001', 'email': 'rakalyanram@gmail.com', 'first_name': 'rakalyanram', 'company': 'None', 'designation': 'None'}, 'last_modified_time': '2024-11-21T15:14:56Z', 'event_type': 2, 'event_type_string': 'venue', 'start_time': '2024-12-19T02:30:00Z', 'end_time': '2024-12-23T11:30:00Z', 'website_url': 'https://mannnnnn.zohobackstage.in/kalyanram', 'thumbnail_url': 'https://static.zohocdn.com/backstage/v1.0/images/themes/coloratura-bg-b35dc245c4b25212d713947c28d117f9.jpg'}];
  List get Events => _events;
  Future<List> getEvents()async{
    final url = Uri.parse('https://zohoapis.in/backstage/v3/portals/60034569483/events');
    final response = await http.get(url,headers: {
      'Authorization': 'Zoho-oauthtoken '+'1000.f850790e27d23e14173907d51eaa3e4e.d6beaac8c75a9f60330f572629711b40',
    });
    List<dynamic> events=jsonDecode(response.body)['events'];
    return events;
  }
  List filterPopularEvents(){
    return [];
  }
  List filterUpcomingEvents(){
    return [];
  }

}