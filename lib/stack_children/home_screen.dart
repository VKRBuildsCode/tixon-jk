import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:loop_page_view/loop_page_view.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tixon/ads.dart';
import 'package:tixon/categories.dart';
import 'package:tixon/popular_events.dart';
import 'package:tixon/upcomping_events.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var controller=LoopPageController(
    viewportFraction: 0.8,
  );
  PageController pageController=PageController();
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    controller.addListener((){
      setState(() {
      });
    });
    return
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
        children: [
          Container(
            height: 90,
          ),
          Ads(),
          Container(
            height: 0.01*MediaQuery.of(context).size.width,
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 0.04*MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
              left: 0.014*MediaQuery.of(context).size.width
            ),
            width: 0.7*MediaQuery.of(context).size.width,
            child: Text("Categories",style:GoogleFonts.archivoBlack(
                fontSize: 0.015*MediaQuery.of(context).size.width,
              fontWeight: FontWeight.bold,
            ),),
          ),
          Categories(),
          Container(
            height: 0.01*MediaQuery.of(context).size.width,
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 0.04*MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
              top: 0.01*MediaQuery.of(context).size.width,
                left: 0.014*MediaQuery.of(context).size.width,
              right: 0.014*MediaQuery.of(context).size.width,
            ),
            width: 0.7*MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Upcoming Events",style: GoogleFonts.archivoBlack(
                    fontSize: 0.015*MediaQuery.of(context).size.width,
                    fontWeight: FontWeight.bold,
                ),),
                InkWell(
                  onTap: (){

                  },
                  child: Text("View all",style: GoogleFonts.archivoBlack(
                      fontSize: 0.010*MediaQuery.of(context).size.width,
                      fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 0.008*MediaQuery.of(context).size.width,
          ),
          UpcompingEvents(),
          Container(
            height: 0.01*MediaQuery.of(context).size.width,
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 0.04*MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
              top: 0.01*MediaQuery.of(context).size.width,
              left: 0.014*MediaQuery.of(context).size.width,
              right: 0.014*MediaQuery.of(context).size.width,
            ),
            width: 0.7*MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Popular Events",style: TextStyle(
                    fontSize: 0.015*MediaQuery.of(context).size.width,
                    fontWeight: FontWeight.bold,
                    fontFamily: "spotify"
                ),),
                InkWell(
                  onTap: (){

                  },
                  child: Text("View all",style: TextStyle(
                    fontSize: 0.010*MediaQuery.of(context).size.width,
                    fontWeight: FontWeight.bold,
                    fontFamily: "spotify",
                  ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 0.008*MediaQuery.of(context).size.width,
          ),
          PopularEvents(),
          Container(
            height: 0.008*MediaQuery.of(context).size.width,
          ),
          Container(
             color: Colors.black,
            height: 0.1*MediaQuery.of(context).size.width,
          )
        ],
      ),
    );
  }
}
