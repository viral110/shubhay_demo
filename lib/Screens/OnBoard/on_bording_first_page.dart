import 'package:flutter/material.dart';
import 'package:shubhay_demo/Common/common_page.dart';

import '../Auth/login_page.dart';

class OnBordingFirstPage extends StatefulWidget {
  const OnBordingFirstPage({Key? key}) : super(key: key);

  @override
  _OnBordingFirstPageState createState() => _OnBordingFirstPageState();
}

class _OnBordingFirstPageState extends State<OnBordingFirstPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: bodyWidget(),
      ),
    );
  }

  Widget bodyWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: PageView.builder(
            itemCount: onBoardImg.length,
            scrollDirection: Axis.horizontal,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 1.7,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(onBoardImg[index]),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      onBoardTxt[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onBoardImg.length,
              (index) {
                return buildDot(index, context, currentIndex);
              },
            ),
          ),
        ),
        submitBtn(),
      ],
    );
  }

  // start btn
  Widget submitBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      },
      child: Container(
        height: 56,
        margin: EdgeInsets.all(12),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green,
        ),
        child: const Text(
          "Start",
          style: TextStyle(
            color: Colors.white,
            fontSize: 19,
          ),
        ),
      ),
    );
  }
}
