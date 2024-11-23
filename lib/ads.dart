import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loop_page_view/loop_page_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Ads extends StatefulWidget {
  const Ads({super.key});
  @override
  State<Ads> createState() => _AdsState();
}
class _AdsState extends State<Ads> {
  var controller=LoopPageController(
    viewportFraction: 0.8,
  );
  var page_nu=0;
  var no_of_ads=5;
  PageController pageController=PageController();
  @override
  Widget build(BuildContext context) {
    return

      Column(
      children: [
        AbsorbPointer(
          absorbing: true,
          child: Container(
            padding: EdgeInsets.all(0),
            width: 0.87*MediaQuery.of(context).size.width,
            child: LoopPageView.builder(
              controller: controller,
              itemCount: no_of_ads+1,
              itemBuilder: (_, index) {
                return
                  Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            10,
                          )
                      ),
                      margin: EdgeInsets.only(
                          left: 20,
                          right: 20
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              10
                          ),
                          child:
                          CachedNetworkImage(
                            imageUrl: "https://files.techxconf.com/2024/ogimage.png",
                            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                            fit: BoxFit.fill,
                          ),

                          // Image.asset("dummy/img.png",fit: BoxFit.fill,))
                  ));
              },
            ),
            height: 0.3*MediaQuery.of(context).size.width,
          ),
        ),
        Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)
                ),
                height: 40,
                width: 40,
                child: Center(
                  child: Icon(Icons.arrow_back_ios_new,color: Colors.white,
                    size: 15,
                  ),
                ),
              ),
              AnimatedSmoothIndicator(
                duration: Duration(
                  seconds: 1
                ),
                activeIndex: page_nu,
                count: no_of_ads+1,
                effect: ExpandingDotsEffect(
                  dotColor: Colors.black,
                  strokeWidth: 1,
                  activeDotColor: Colors.black
                ),
              ),
              InkWell(
                onTap: (){
                  if(no_of_ads==page_nu){
                    page_nu=-1;
                  }
                  setState(() {
                  });
                  controller.animateToPage(++page_nu,
                      duration: Duration(
                        milliseconds: 1300
                      ), curve: Curves.decelerate,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  height: 40,
                  width: 40,
                  child: Center(
                    child: Icon(Icons.arrow_forward_ios,color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
