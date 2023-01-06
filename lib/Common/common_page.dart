
import 'package:flutter/material.dart';

// store image path
List<String> onBoardImg = [
  "assets/images/slider1.jpg",
  "assets/images/slider2.jpg",
  "assets/images/slider3.jpg",
];

// store dummy text
List<String> onBoardTxt = [
  "In nature, nothing is perfect and everything is perfect. Trees can be contorted, bent in weird ways, and they're still beautiful. –Alice Walker",
  "Forget not that the earth delights to feel your bare feet and the winds long to play with your hair. —Khalil Gibran",
  "To me a lush carpet of pine needles or spongy grass is more welcome than the most luxurious Persian rug. —Helen Keller"
];

// for build dot pattern

buildDot(int index, BuildContext context, int currentIndex) {
  return Container(
    height: 10,
    width: currentIndex == index ? 25 : 10,
    margin: EdgeInsets.only(right: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.green,
    ),
  );
}
