import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:tixon/components/category_container.dart';

List categories_string=[
  "Workshops",
  "Symposium",
  "Paper\npresentation",
  "Hackathon",
  "Cultural\nFest",
  "Entrepreneurship\n Events"
];

List categories_icons=[
  "assets/workshop.png",
  "assets/symposium.png",
  "assets/paper.png",
  "assets/hackathon.png",
  "assets/cultural.png",
"assets/entrepreneur.png",
];

class Categories extends StatelessWidget {
  const Categories({super.key});
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Container(
      width: 0.7*MediaQuery.of(context).size.width,
      height:  0.1*width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(6, (index)=>
        CategoryContainer(
          category: categories_string[index],
          icon: categories_icons[index]
        )
        )
      ),
    );
  }
}
