
import 'package:flutter/material.dart';
import 'package:hover_widget/hover_widget.dart';
class CategoryContainer extends StatefulWidget {
  String category;
  String icon;
  CategoryContainer({required this.category,required this.icon});
  @override
  State<CategoryContainer> createState() => _CategoryContainerState();
}

class _CategoryContainerState extends State<CategoryContainer> {
  bool onHover=false;
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return   InkWell(
      onHover: (e){
        onHover=e;
        setState(() {

        });
      },
      onTap: (){

      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
          height:0.1*width,
          width: 0.1*width,
          padding: EdgeInsets.all(0.01*width),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5), // Shadow color
                offset: Offset(5, 5), // Shadow position (right and down)
                blurRadius: 10, // Blur effect
                spreadRadius: 0, // No spread
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 2
            ),
            color: onHover?Colors.white:Colors.black,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FittedBox(
                child: SizedBox(
                  height: 0.009*width,
                  width: 2,
                ),
              ),
              FittedBox(
                child: Image.asset(this.widget.icon,
                  color: onHover?Colors.black:Colors.white,
                  height: 0.029*width,
                  width: 0.029*width,
                ),
              ),
              FittedBox(child: Text(this.widget.category,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: onHover?Colors.black:Colors.white,
                    fontFamily: "spotify",
                  fontSize: 0.012*width
                ),
              )),
            ],
          )),
    );
  }
}
