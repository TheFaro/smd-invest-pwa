import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SafeArea(
        child: ListView(
            children: [
              CarouselSlider(
                items: [
                  // 1st item
                  Stack(
                    children: [
                      Container(
                          margin: EdgeInsets.all(0.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.0),
                            image: DecorationImage(
                              image: AssetImage('assets/banner/banner_image.jpg'),
                              fit: BoxFit.cover,
                            ),
                          )
                      ),
                      Container(color: Color.fromRGBO(0, 0, 0, 0.3)),
                      Positioned(
                        child: Text(
                          'SMD Capital is a data driven investment hedge fund. We employ proprietary models to capture returns',
                          style: TextStyle(
                            fontFamily: 'roboto',
                            color: Colors.white
                          ),
                        ),
                      ),
                    ],
                  ),

                  // 2nd item
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(0.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0.0),
                          image: DecorationImage(
                            image: AssetImage('assets/banner/dandelion.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(color: Color.fromRGBO(0, 0, 0, 0.3)),
                      Positioned(
                        child: Text(
                          'Our legacy investment strategies are non correlated and capitalize on Macro themes, Volatility, Distressed Assets, Risk Premium, Sector Rotation, Value and Growth',
                          style: TextStyle(
                            fontFamily: 'roboto',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ]
                  ),

                  // 3rd item
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(0.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0.0),
                          image: DecorationImage(
                            image: AssetImage('assets/banner/guy.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(color: Color.fromRGBO(0, 0, 0, 0.3)),
                      Positioned(
                        child: Text(
                          'Our mission is to protect wealth and a gradual organic growth of assets, leveraging compound interest',
                          style: TextStyle(
                            fontFamily: 'roboto',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // 4th item
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(0.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0.0),
                          image: DecorationImage(
                              image: AssetImage('assets/banner/lights.jpg'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop)
                          ),
                        ),
                      ),
                      Container(color: Color.fromRGBO(0, 0, 0, 0.3)),
                      Positioned(
                        child: Text(
                          'Our Foundation is INTEGRITY \nOur Strength is our PEOPLE \nOur Style is TEAMWORK \nOur Goal is Excellence',
                          style: TextStyle(
                            fontFamily: 'roboto',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // 5th item
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(0.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0.0),
                          image: DecorationImage(
                            image: AssetImage('assets/banner/sunset.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(color: Color.fromRGBO(0, 0, 0, 0.3)),
                      Positioned(
                        child: Text(
                          'We have skin in the game. We own a larger percentage of all the portfolio\'s',
                          style: TextStyle(
                            fontFamily: 'roboto',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ]
                  ),
                ],
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.8,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16/9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 1,
                ),
              ),
            ],
        ),
      ),
    );
  }
}