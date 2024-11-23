
import 'dart:io';
import 'dart:js' as js;
import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glass/glass.dart';
import 'package:provider/provider.dart';
import 'package:tixon/components/LocationButton.dart';
import 'package:tixon/providers.dart';
import 'package:tixon/searchbar_for_phone/SearchBar.dart';
import 'package:tixon/stack_children/home_screen.dart';

class CartModel extends ChangeNotifier{

}
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EventsProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Android(),
      ),
    );
  }
}

class Desktop extends StatefulWidget {
  const Desktop({super.key});

  @override
  State<Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C325B)
    );
  }
}


class Android extends StatefulWidget {
  const Android({super.key});

  @override
  State<Android> createState() => _AndroidState();
}

class _AndroidState extends State<Android> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff257180),
      // backgroundColor: Color(0xffFFD3B6),//mine
      backgroundColor: Colors.white,
      // This is handled by the search bar itself.
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          HomeScreen(), // Your main content
          Container(
            decoration: BoxDecoration(
              // color: Colors.redAccent,
              // color: Color(0xff80C4E9),
              color:Colors.white,
              border: Border(
                bottom:BorderSide(
                  width: 2,
                   color: Colors.black
                ),
              )
            ),
            height: 82,
            width: double.infinity,
          ),
          buildFloatingSearchBar(context),
          SizedBox(
            height: 85,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 16,
                    bottom: 24,
                    right: 30
                  ),
                  child:
                  Center(
                    child: SvgPicture.asset("assets/logo.svg",
                      height: 85,
                      fit: BoxFit.scaleDown,
                      allowDrawingOutsideViewBox: false,
                    ),
                  ),
                width: 0.3*MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  width: 0.4*MediaQuery.of(context).size.width,
                ),
LocationButton()

              ],
            )
          )
                    // Ensure this function returns a widget
        ],
      ),
    );
  }
}


