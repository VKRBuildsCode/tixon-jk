import 'dart:io';
import 'dart:js' as js;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_countdown/slide_countdown.dart';

class EventContainer extends StatefulWidget {
  String website_url;
  String thumbnail_url;
  EventContainer({required this.website_url,required this.thumbnail_url});
  @override
  State<EventContainer> createState() => _EventContainerState();
}

class _EventContainerState extends State<EventContainer> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return  Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5), // Shadow color
              offset: Offset(5, 5), // Shadow position (right and down)
              blurRadius: 10, // Blur effect
              spreadRadius: 0, // No spread
            ),
          ],
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 0.14*width,
                child:    ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: this.widget.thumbnail_url,
                    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                ),
            ),),
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(0.012*width),
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2
                ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              height: 0.12*width,
                child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("AI Cloud ",
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.archivoBlack(
                      fontSize: 0.012*width,
                    ),),
                    Text("Sub titile",style:
                    GoogleFonts.archivoBlack(
                        color: Colors.black,
                        fontSize: 0.009*width
                    ),
                      ),
                    Divider(
                        thickness: 2,
                      color: Colors.black,
                    ),

                    Text("Venue:",style:
                    GoogleFonts.archivoBlack(
                        color: Colors.black,
                        fontSize: 0.009*width
                    ),
                    ),

                    Text("Chennai,India",style:
                      GoogleFonts.archivoBlack(
                          color: Colors.black,
                          fontSize: 0.01*width
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: (){
                          js.context.callMethod('open', [this.widget.website_url]);
                        },
                        child: Text("Read more",
                          style: GoogleFonts.archivoBlack(
                              color: Colors.black,
                              fontSize: 0.01*width
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ),)
          ],
        ),
    );
  }
}
