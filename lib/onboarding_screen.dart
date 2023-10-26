import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'models/items_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: listOfItems.length,
                      physics: const BouncingScrollPhysics(),
                      onPageChanged: (newVal) {},
                      itemBuilder: (ctx, index) {
                        return SizedBox(
                          width: size.width,
                          height: size.height,
                          child: Column(
                            children: [
                              Container(
                                width: size.width,
                                height: size.height / 1.7,
                                child: Image.asset(listOfItems[index].img),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 7, bottom: 1),
                                  child: Text(
                                    listOfItems[index].title,
                                    style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                        shadows: [
                                          Shadow(
                                            color: Colors.yellowAccent.withOpacity(0.7),
                                            offset: Offset(2,5),
                                            blurRadius: 4,
                                          )
                                        ]
                                    ),
                                  )),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                listOfItems[index].subTitle,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,

                                )),

                            ],
                          ),
                        );
                      })),
              Expanded(
                flex: 1,
                child: Column(

                  children: [
                    SizedBox(height: 40,),
                    SmoothPageIndicator(
                      effect: ExpandingDotsEffect(
                        spacing: 6.0,
                        radius: 10.0,
                        dotWidth: 10.0,
                        dotHeight: 10.0,
                        expansionFactor: 3.9,
                        dotColor: Colors.orange,
                        activeDotColor: Colors.orangeAccent,
                      ),
                      count: listOfItems.length,
                      controller: pageController,
                    ),
                    SizedBox(height: 15,),
                    InkWell(onTap:(){
                      Navigator.pushNamed(context, "Login");
                      },
                      child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 28),
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 25,),
                          Text(
                            "Explore Now",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 118,),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.navigate_next_sharp,
                                color: Colors.white,
                                size: 40,

                              )),




                        ],
                      )
                    ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
