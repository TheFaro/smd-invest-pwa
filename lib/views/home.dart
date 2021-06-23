import 'dart:core';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'home1.dart';
import 'package:smd_investments_website/readers/readers.dart';
import 'package:smd_investments_website/models/models.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  // defining constants

  final teamList = [
    {
      'name': 'Mr Samkeliso Mpendulo Dlamini',
      'position': 'Founder and CEO, Investment Strategist',
      'qualification':
          'BSc in Science, Masters in Medicinal Chemistry and PhD Candidate Medicinal Chemistry',
      'image': 'assets/banner/user.png',
      'linked': 'assets/banner/linkedin.png'
    },
    {
      'name': 'Mr Fanelesibonge Phiwokuhle Malaza',
      'position': 'Programmer, Architect and Data Scientist',
      'qualification': 'BSc Science in Physics and Computer Science',
      'image': 'assets/banner/user.png',
      'linked': 'assets/banner/linkedin.png'
    },
    {
      'name': 'Mr Likhanyiso Sandile Dlamini',
      'position': 'Hedge Fund Risk Manager',
      'qualification': 'BSc Science in Physics and Computer Science',
      'image': 'assets/banner/user.png',
    }
  ];

  // controllers for contact us section
  final name = TextEditingController();
  final email = TextEditingController();
  final message = TextEditingController();

  // for hovering state
  bool isHovering1 = false;
  bool isHovering2 = false;
  bool isHovering3 = false;
  bool isHovering4 = false;
  bool isHovering5 = false;
  bool strategistsMore = false;

  // for theme
  bool darkTheme = false;

  // readers
  InvestingRssReader investingRss = new InvestingRssReader();
  MarketWatchRssReader marketWatchRss = new MarketWatchRssReader();

  // get rss feed data

  // check theme selection
  void checkThemeSelection() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? res = prefs.getBool('theme_selection');

    if (res != null) {
      setState(() {
        darkTheme = res;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    checkThemeSelection();
    DateFormat dateFormat = new DateFormat.Hm();
    DateTime now = DateTime.now();
    DateTime light = dateFormat.parse("06:00");
    light =
        new DateTime(now.year, now.month, now.day, light.hour, light.minute);
    DateTime dark = dateFormat.parse("20:00");
    dark = new DateTime(now.year, now.month, now.day, dark.hour, dark.minute);

    if (now.isAfter(dark)) {
      this.darkTheme = true;
    } else if (now.isAfter(light)) {
      this.darkTheme = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        scaffoldBackgroundColor: darkTheme ? Colors.black : null,
        accentColor: darkTheme ? Color(0xFFD1A84E) : Colors.lightBlue[700],
        canvasColor: darkTheme ? Colors.black : Colors.white,
      ),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Home',
                    style: TextStyle(
                      fontFamily: 'MontSerrat',
                      fontWeight: FontWeight.w900,
                      color: darkTheme ? Color(0xffd1a84e) : Colors.white,
                    )),
                IconButton(
                  icon: Icon(Icons.search),
                  color: darkTheme ? Color(0xffD1A84E) : Colors.white,
                  iconSize: 20,
                  onPressed: () => null,
                ),
              ],
            ),
            backgroundColor: darkTheme ? Colors.black : Colors.lightBlue,
            iconTheme: IconThemeData(
              color: darkTheme ? Color(0xffd1a84e) : Colors.white,
            ),
          ),
          drawer: Drawer(
            child: ListView(children: [
              MaterialButton(
                child: Text('Home'),
                color: darkTheme ? Color(0xffD1A84E) : Colors.white,
                textColor: Colors.black,
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/home'),
                padding: EdgeInsets.all(35.0),
              ),
              MaterialButton(
                child: Text('About Us'),
                color: darkTheme ? Color(0xffD1A84E) : Colors.white,
                textColor: Colors.black,
                onPressed: () => Navigator.pushReplacementNamed(
                    context, '/about',
                    arguments: this.darkTheme),
                padding: EdgeInsets.all(35.0),
              ),
              MaterialButton(
                child: Text('Principles & Culture'),
                color: darkTheme ? Color(0xffD1A84E) : Colors.white,
                textColor: Colors.black,
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/principles'),
                padding: EdgeInsets.all(35.0),
              ),
              MaterialButton(
                child: darkTheme ? Text('Light Mode') : Text('Dark Mode'),
                color: darkTheme ? Color(0xffD1A84E) : Colors.white,
                textColor: Colors.black,
                onPressed: () {
                  setState(() {
                    darkTheme = !darkTheme;
                  });
                },
                padding: const EdgeInsets.all(35),
              ),
            ]),
          ),
          body: SafeArea(
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              Widget? banner;
              Widget? strategistsTable;
              Widget? news;
              Widget? contacts;
              Widget? team;
              Widget? philosophy;
              double? strategyFont;
              double width = MediaQuery.of(context).size.width;
              double height = MediaQuery.of(context).size.height;
              bool mobile;

              Color textColor = darkTheme ? Color(0xffD1A84E) : Colors.black;
              Color color = Color(0xffD1A84E);
              String textFont = 'Montserrat';

              if (constraints.maxWidth < 800) {
                // mobile view definitions
                // banner
                banner = CarouselSlider(
                  items: [
                    // 1st item
                    Stack(
                      children: [
                        Container(
                            margin: EdgeInsets.all(0.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0.0),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/banner/banner_image.jpg'),
                                fit: BoxFit.cover,
                              ),
                            )),
                        Container(color: Color.fromRGBO(0, 0, 0, 0.3)),
                        Positioned(
                          top: 75,
                          left: 30,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Text(
                              'SMD Capital is a data driven investment hedge fund. We employ proprietary models to capture returns',
                              style: TextStyle(
                                fontFamily: textFont,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // 2nd item
                    Stack(children: [
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
                        top: 75,
                        left: 30,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(
                            'Our legacy investment strategies are non correlated and capitalize on Macro themes, Volatility, Distressed Assets, Risk Premium, Sector Rotation, Value and Growth',
                            style: TextStyle(
                              fontFamily: textFont,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 27,
                            ),
                          ),
                        ),
                      ),
                    ]),

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
                          top: 75,
                          left: 30,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Text(
                              'Our mission is to protect wealth and a gradual organic growth of assets, leveraging compound interest',
                              style: TextStyle(
                                fontFamily: textFont,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                              ),
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
                            image: DecorationImage(
                                image: AssetImage('assets/banner/lights.jpg'),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.7),
                                    BlendMode.dstATop)),
                          ),
                        ),
                        Container(color: Color.fromRGBO(0, 0, 0, 0.3)),
                        Positioned(
                          top: 75,
                          left: 30,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Text(
                              'Our Foundation is INTEGRITY \nOur Strength is our PEOPLE \nOur Style is TEAMWORK \nOur Goal is EXCELLENCE',
                              style: TextStyle(
                                fontFamily: textFont,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 23,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // 5th item
                    Stack(children: [
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
                        top: 75,
                        left: 30,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(
                            'We have skin in the game. We own a larger percentage of all the portfolio\'s',
                            style: TextStyle(
                              fontFamily: textFont,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 27,
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ],
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.6,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 1,
                  ),
                );
                strategyFont = 17;
                mobile = true;

                // strategists table
                strategistsTable = ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text('Portfolio',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: textFont,
                              color: textColor,
                            )),
                      ),
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text(
                          'Ticker',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: textFont,
                            color: textColor,
                          ),
                        ),
                      ),
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text('% Exposure',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: textFont,
                              color: textColor,
                            )),
                      ),
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text('Returns (YoY)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: textFont,
                              color: textColor,
                            )),
                      ),
                    ]),
                    Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text('Distressed Value Assets',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: textFont,
                              color: textColor,
                            )),
                      ),
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text('DVAP',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: textFont,
                              color: textColor,
                            )),
                      ),
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text('28%',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: textFont,
                              color: textColor,
                            )),
                      ),
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text('28%',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: textFont,
                              color: textColor,
                            )),
                      ),
                    ]),
                    Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text('Emerging Trends',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: textFont,
                              color: textColor,
                            )),
                      ),
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text('ETP',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: textFont,
                              color: textColor,
                            )),
                      ),
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text('26%',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: textFont,
                              color: textColor,
                            )),
                      ),
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text('20%',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: textFont,
                              color: textColor,
                            )),
                      ),
                    ]),
                    Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text('Defensive Investing',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: textFont,
                              color: textColor,
                            )),
                      ),
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text('DIP',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: textFont,
                              color: textColor,
                            )),
                      ),
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text('10%',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: textFont,
                              color: textColor,
                            )),
                      ),
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text('13%',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: textFont,
                              color: textColor,
                            )),
                      ),
                    ]),
                    Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text('Risk Premium',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: textFont,
                              color: textColor,
                            )),
                      ),
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text('RPP',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Trebuchet MS',
                              color: textColor,
                            )),
                      ),
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text('5%',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: textFont,
                              color: textColor,
                            )),
                      ),
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text('12.36%',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: textFont,
                              color: textColor,
                            )),
                      ),
                    ]),
                    Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text('Industrial Sector Rotation',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: textFont,
                              color: textColor,
                            )),
                      ),
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text('ISRP',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: textFont,
                              color: textColor,
                            )),
                      ),
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text('5%',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: textFont,
                              color: textColor,
                            )),
                      ),
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text('7.53%',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: textFont,
                              color: textColor,
                            )),
                      ),
                    ]),
                    Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text('All Weather',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: textFont,
                              color: textColor,
                            )),
                      ),
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text('AWP',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: textFont,
                              color: textColor,
                            )),
                      ),
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text('10%',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: textFont,
                              color: textColor,
                            )),
                      ),
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text('2.05%',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: textFont,
                              color: textColor,
                            )),
                      ),
                    ]),
                    Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text('Multiple Currencies',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: textFont,
                              color: textColor,
                            )),
                      ),
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text('MCP',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: textFont,
                              color: textColor,
                            )),
                      ),
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text('16%',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: textFont,
                              color: textColor,
                            )),
                      ),
                      Container(
                        width: width * 0.25,
                        padding: const EdgeInsets.all(7),
                        child: Text('11%',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: textFont,
                              color: textColor,
                            )),
                      ),
                    ]),
                    Container(
                        decoration: BoxDecoration(
                          color: darkTheme ? color : Colors.lightBlue[700],
                        ),
                        width: width * 0.8,
                        margin: EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left: 30,
                          right: 30,
                        ),
                        child: InkWell(
                          onTap: () => null,
                          onHover: (hovering) {
                            if (hovering) {
                              setState(() {
                                strategistsMore = hovering;
                              });
                            } else {
                              setState(() {
                                strategistsMore = hovering;
                              });
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              'Learn more about Strategists',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: textFont,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )),
                  ],
                );

                // news
                news = Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FutureBuilder(
                            future: investingRss.loadFeed('NEWS', 'All News'),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                Object obj = snapshot.data!;
                                final list = checkType(obj);

                                if (list is List<InvestingRssNews>) {
                                  List<InvestingRssNews> items = list;

                                  return Column(
                                    children: [
                                      Card(
                                        color: Color(0xffeeeeee),
                                        child: Container(
                                          width: width * 0.8,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(height: 12),
                                              Text(
                                                'All news',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: textFont,
                                                  fontSize: 20,
                                                  color: textColor,
                                                ),
                                              ),
                                              SizedBox(height: 12),
                                              Container(
                                                width: width * 0.8,
                                                height: height * 0.6 * 0.25,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        items[0].enclosure.url),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, right: 8, top: 10),
                                                child: Text(
                                                  '${items[0].title}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: textFont,
                                                    fontSize: 15,
                                                    color: textColor,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(7),
                                                child: Text(
                                                  'By: ${items[0].author} , at ${items[0].pubDate.toString().substring(0, 16)}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: textFont,
                                                    fontSize: 13,
                                                    color: textColor,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(7),
                                                child: InkWell(
                                                  onTap: () => null,
                                                  child: Text(
                                                    '${items[0].link}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily: textFont,
                                                      color: textColor,
                                                      decoration: TextDecoration
                                                          .underline,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 12.0),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 12.0),
                                      MaterialButton(
                                        child: Text(
                                          'See more',
                                        ),
                                        shape: StadiumBorder(),
                                        textColor: darkTheme
                                            ? Colors.black
                                            : Colors.white,
                                        color: darkTheme
                                            ? color
                                            : Colors.lightBlue[700],
                                        padding: const EdgeInsets.only(
                                          top: 13,
                                          bottom: 13,
                                          right: 30,
                                          left: 30,
                                        ),
                                        onPressed: () =>
                                            null, // go the new list view
                                      ),
                                      SizedBox(height: 12.0),
                                    ],
                                  );
                                }
                              } else if (snapshot.hasError) {
                                return Text(
                                  '${snapshot.error}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'roboto',
                                    color: Colors.red,
                                    fontSize: 20,
                                  ),
                                );
                              }

                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }),
                        FutureBuilder(
                            future: investingRss.loadFeed('NEWS', 'Forex News'),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                Object obj = snapshot.data!;
                                final list = checkType(obj);

                                if (list is List<InvestingRssNews>) {
                                  List<InvestingRssNews> items = list;

                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Card(
                                        color: Color(0xffeeeeee),
                                        borderOnForeground: true,
                                        child: Container(
                                          width: width * 0.8,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(height: 12),
                                              Text(
                                                'Forex News',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: textFont,
                                                  color: textColor,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              SizedBox(height: 12.0),
                                              Container(
                                                width: width * 0.8,
                                                height: height * 0.6 * 0.25,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        items[0].enclosure.url),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 8,
                                                  right: 8,
                                                ),
                                                child: Text(
                                                  '${items[0].title}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: textFont,
                                                    fontSize: 15,
                                                    color: textColor,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(7),
                                                child: Text(
                                                  'By: ${items[0].author} , at ${items[0].pubDate.toString().substring(0, 16)}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: textFont,
                                                    fontSize: 13,
                                                    color: textColor,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(7),
                                                child: InkWell(
                                                  onTap: () => null,
                                                  child: Text(
                                                    '${items[0].link}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily: textFont,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      color: textColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 12.0),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 12.0),
                                      MaterialButton(
                                        child: Text(
                                          'See more',
                                        ),
                                        shape: StadiumBorder(),
                                        textColor: darkTheme
                                            ? Colors.black
                                            : Colors.white,
                                        color: darkTheme
                                            ? color
                                            : Colors.lightBlue[700],
                                        padding: const EdgeInsets.only(
                                          top: 13,
                                          bottom: 13,
                                          right: 30,
                                          left: 30,
                                        ),
                                        onPressed: () =>
                                            null, // go the new list view
                                      ),
                                      SizedBox(height: 12.0),
                                    ],
                                  );
                                }
                              } else if (snapshot.hasError) {
                                return Text(
                                  '${snapshot.error}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'roboto',
                                    color: Colors.red,
                                    fontSize: 20,
                                  ),
                                );
                              }

                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }),
                        FutureBuilder(
                            future: investingRss.loadFeed(
                                'NEWS', 'Coronavirus News & Updates'),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                Object obj = snapshot.data!;
                                final list = checkType(obj);

                                if (list is List<InvestingRssNews>) {
                                  List<InvestingRssNews> items = list;

                                  return Column(children: [
                                    Card(
                                      color: Color(0xffeeeeee),
                                      child: Container(
                                        width: width * 0.8,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(height: 12),
                                            Text(
                                              'Coronavirus News & Updates',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: textFont,
                                                fontSize: 20,
                                                color: textColor,
                                              ),
                                            ),
                                            SizedBox(height: 12.0),
                                            Container(
                                              width: width * 0.8,
                                              height: height * 0.6 * 0.25,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      items[0].enclosure.url),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                              ),
                                              child: Text(
                                                '${items[0].title}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: textFont,
                                                  fontSize: 15,
                                                  color: textColor,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(7),
                                              child: Text(
                                                'By: ${items[0].author} , at ${items[0].pubDate.toString().substring(0, 16)}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: textFont,
                                                  fontSize: 13,
                                                  color: textColor,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(7),
                                              child: InkWell(
                                                onTap: () => null,
                                                child: Text(
                                                  '${items[0].link}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: textFont,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    color: textColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 12.0),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 12.0),
                                    MaterialButton(
                                      child: Text(
                                        'See more',
                                      ),
                                      shape: StadiumBorder(),
                                      textColor: darkTheme
                                          ? Colors.black
                                          : Colors.white,
                                      color: darkTheme
                                          ? color
                                          : Colors.lightBlue[700],
                                      padding: const EdgeInsets.only(
                                        top: 13,
                                        bottom: 13,
                                        right: 30,
                                        left: 30,
                                      ),
                                      onPressed: () =>
                                          null, // go the new list view
                                    ),
                                    SizedBox(height: 12.0),
                                  ]);
                                }
                              } else if (snapshot.hasError) {
                                return Text(
                                  '${snapshot.error}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'roboto',
                                    color: Colors.red,
                                    fontSize: 20,
                                  ),
                                );
                              }

                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }),
                        FutureBuilder(
                            future:
                                investingRss.loadFeed('NEWS', 'Economy News'),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                Object obj = snapshot.data!;
                                final list = checkType(obj);

                                if (list is List<InvestingRssNews>) {
                                  List<InvestingRssNews> items = list;

                                  return Column(children: [
                                    Card(
                                      color: Color(0xffeeeeee),
                                      borderOnForeground: true,
                                      child: Container(
                                        width: width * 0.8,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(height: 12),
                                            Text(
                                              'Economy News',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: textFont,
                                                fontSize: 20,
                                                color: textColor,
                                              ),
                                            ),
                                            SizedBox(height: 12.0),
                                            Container(
                                              width: width * 0.8,
                                              height: height * 0.6 * 0.25,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      items[0].enclosure.url),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                              ),
                                              child: Text(
                                                '${items[0].title}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: textFont,
                                                  fontSize: 15,
                                                  color: textColor,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(7),
                                              child: Text(
                                                'By: ${items[0].author} , at ${items[0].pubDate.toString().substring(0, 16)}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: textFont,
                                                  fontSize: 13,
                                                  color: textColor,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(7),
                                              child: InkWell(
                                                onTap: () => null,
                                                child: Text(
                                                  '${items[0].link}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: textFont,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    color: textColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 12.0),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    MaterialButton(
                                      child: Text(
                                        'See more',
                                      ),
                                      shape: StadiumBorder(),
                                      textColor: darkTheme
                                          ? Colors.black
                                          : Colors.white,
                                      color: darkTheme
                                          ? color
                                          : Colors.lightBlue[700],
                                      padding: const EdgeInsets.only(
                                        top: 13,
                                        bottom: 13,
                                        right: 30,
                                        left: 30,
                                      ),
                                      onPressed: () =>
                                          null, // go the new list view
                                    ),
                                    SizedBox(height: 12)
                                  ]);
                                }
                              } else if (snapshot.hasError) {
                                return Text(
                                  '${snapshot.error}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'roboto',
                                    color: Colors.red,
                                    fontSize: 20,
                                  ),
                                );
                              }

                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }),
                      ]),
                );

                // contact us
                contacts = Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                        margin: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          controller: name,
                          style: TextStyle(
                            fontFamily: textFont,
                            color: textColor,
                          ),
                          cursorColor: textColor,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Name',
                            hintStyle: TextStyle(
                              fontFamily: textFont,
                              color: textColor,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2.0,
                                  color: darkTheme
                                      ? color
                                      : Colors.lightBlue[700]!),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.0,
                                  color: darkTheme
                                      ? color
                                      : Colors.lightBlue[700]!),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.0,
                                  color: darkTheme
                                      ? color
                                      : Colors.lightBlue[700]!),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                        margin: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          controller: email,
                          style: TextStyle(
                            fontFamily: textFont,
                            color: textColor,
                          ),
                          cursorColor: textColor,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Email Address',
                            hintStyle: TextStyle(
                              fontFamily: textFont,
                              color: textColor,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.0,
                                  color: darkTheme ? color : Colors.lightBlue),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.0,
                                  color: darkTheme
                                      ? color
                                      : Colors.lightBlue[700]!),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.0,
                                  color: darkTheme ? color : Colors.lightBlue),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                        margin: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          controller: message,
                          style: TextStyle(
                            fontFamily: textFont,
                            color: textColor,
                          ),
                          cursorColor: textColor,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Message',
                            hintStyle: TextStyle(
                              fontFamily: textFont,
                              color: textColor,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.0,
                                  color: darkTheme ? color : Colors.lightBlue),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.0,
                                  color: darkTheme
                                      ? color
                                      : Colors.lightBlue[700]!),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.0,
                                  color: darkTheme ? color : Colors.lightBlue),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      MaterialButton(
                        onPressed: () => displayDialog(
                            context, 'Attention', 'Coming soon...'),
                        child: Text(
                          'Send Message',
                          style: TextStyle(
                            fontFamily: textFont,
                            color: Colors.black,
                          ),
                        ),
                        shape: StadiumBorder(),
                        color: darkTheme ? color : Colors.lightBlue[700],
                        padding: EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                          left: 40,
                          right: 40,
                        ),
                      ),
                      SizedBox(height: 20.0),
                    ],
                  ),
                );

                // team
                team = Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      createTeamMemberCard(
                          context,
                          teamList[0]['name']!,
                          teamList[0]['position']!,
                          teamList[0]['qualification']!,
                          teamList[0]['image']!),
                      createTeamMemberCard(
                          context,
                          teamList[2]['name']!,
                          teamList[2]['position']!,
                          teamList[2]['qualification']!,
                          teamList[2]['image']!),
                      createTeamMemberCard(
                          context,
                          teamList[1]['name']!,
                          teamList[1]['position']!,
                          teamList[1]['qualification']!,
                          teamList[1]['image']!),
                    ]);

                // philosophy
                philosophy = Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                        color: darkTheme ? color : Colors.lightBlue,
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          BoxShadow(
                            color: darkTheme
                                ? Color.fromRGBO(209, 168, 78, 0.5)
                                : Colors.lightBlue[200]!,
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(15.0),
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'We have removed the guess work with our systematic data driven proprietary models for top/down, bottom/up market research.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: textFont,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_downward,
                      color: darkTheme ? color : Colors.black,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                        color: darkTheme ? color : Colors.lightBlue,
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          BoxShadow(
                            color: darkTheme
                                ? Color.fromRGBO(209, 168, 78, 0.5)
                                : Colors.lightBlue[200]!,
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(12.0),
                      padding: EdgeInsets.only(
                        top: 12.0,
                        bottom: 12.0,
                      ),
                      child: Text(
                        'Our portfolio construction process emphasizes on wealth preservation through systematic risk quantification and management.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: textFont,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_downward,
                      color: darkTheme ? color : Colors.black,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                        color: darkTheme ? color : Colors.lightBlue,
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          BoxShadow(
                            color: darkTheme
                                ? Color.fromRGBO(209, 168, 78, 0.5)
                                : Colors.lightBlue[200]!,
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(12.0),
                      padding: EdgeInsets.only(
                        top: 12.0,
                        bottom: 12.0,
                      ),
                      child: Text(
                        'We keep our investors fully informed monthly about the status of the market, expectation and mitigation measures, especially in the case of irrational market fear.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: textFont,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                // web view definitions
                // banner
                banner = Stack(children: [
                  Positioned(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: width,
                      height: height * 0.82,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/banner/banner_image.jpg'),
                        fit: BoxFit.cover,
                      )),
                    ),
                  ),
                  Container(
                    width: width,
                    height: height * 0.82,
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                  Positioned(
                    top: 0,
                    child: Container(
                      width: width,
                      height: height * 0.82,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(30),
                                    margin: EdgeInsets.only(
                                        left: width * 0.085,
                                        right: width * 0.085,
                                        top: 10),
                                    decoration: BoxDecoration(
                                      color: darkTheme
                                          ? Colors.black
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          width * 0.1 * 0.5),
                                    ),
                                    child: Container(
                                      width: width * 0.1,
                                      height: width * 0.1,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            darkTheme
                                                ? 'assets/banner/gold.png'
                                                : 'assets/banner/icon.png',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => null,
                                    onHover: (hovering) {
                                      setState(() {
                                        isHovering1 = hovering;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.ease,
                                      width: width * 0.3,
                                      height: height * 0.3,
                                      color: isHovering1
                                          ? darkTheme
                                              ? Color.fromRGBO(
                                                  209, 168, 78, 0.5)
                                              : Color.fromRGBO(3, 169, 244, 0.3)
                                          : Colors.transparent,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: 25,
                                          right: 25,
                                          top: 30,
                                        ),
                                        child: AnimatedDefaultTextStyle(
                                          duration: Duration(milliseconds: 200),
                                          style: TextStyle(
                                            fontFamily: 'Trebuchet MS',
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: isHovering1 ? 28 : 25,
                                          ),
                                          child: Text(
                                            'SMD Capital is a data driven investment hedge fund. We employ proprietary models to capture returns',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: textFont,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => null,
                                    onHover: (hovering) {
                                      setState(() {
                                        isHovering2 = hovering;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.ease,
                                      width: width * 0.3,
                                      height: height * 0.3,
                                      color: isHovering2
                                          ? darkTheme
                                              ? Color.fromRGBO(
                                                  209, 168, 78, 0.5)
                                              : Color.fromRGBO(3, 169, 244, 0.3)
                                          : Colors.transparent,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: 25,
                                          right: 25,
                                          top: 20,
                                        ),
                                        child: AnimatedDefaultTextStyle(
                                          duration: Duration(milliseconds: 200),
                                          style: TextStyle(
                                            fontFamily: textFont,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: isHovering2 ? 25 : 22,
                                          ),
                                          child: Text(
                                            'Our legacy investment strategies are non correlated and capitalize on Macro themes, Volatility, Distressed Assets, Risk Premium, Sector Rotation, Value and Growth',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                            SizedBox(height: height * 0.1),
                            Row(children: <Widget>[
                              InkWell(
                                onTap: () => null,
                                onHover: (hovering) {
                                  setState(() {
                                    isHovering3 = hovering;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.ease,
                                  width: width * 0.3,
                                  height: height * 0.3,
                                  color: isHovering3
                                      ? darkTheme
                                          ? Color.fromRGBO(209, 168, 78, 0.5)
                                          : Color.fromRGBO(3, 169, 244, 0.3)
                                      : Colors.transparent,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 25,
                                      right: 25,
                                      top: 20,
                                    ),
                                    child: AnimatedDefaultTextStyle(
                                      duration: Duration(milliseconds: 200),
                                      style: TextStyle(
                                        fontFamily: textFont,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: isHovering3 ? 30 : 26,
                                      ),
                                      child: Text(
                                        'Our mission is to protect wealth and a gradual organic growth of assets, leveraging compound interest',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () => null,
                                onHover: (hovering) {
                                  setState(() {
                                    isHovering4 = hovering;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.ease,
                                  width: width * 0.3,
                                  height: height * 0.3,
                                  color: isHovering4
                                      ? darkTheme
                                          ? Color.fromRGBO(209, 168, 78, 0.5)
                                          : Color.fromRGBO(3, 169, 244, 0.3)
                                      : Colors.transparent,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 25,
                                      right: 25,
                                      top: 20,
                                    ),
                                    child: AnimatedDefaultTextStyle(
                                      duration: Duration(milliseconds: 200),
                                      style: TextStyle(
                                        fontFamily: textFont,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: isHovering4 ? 28 : 26,
                                      ),
                                      child: Text(
                                        'Our Foundation is INTEGRITY \nOur Strength is our PEOPLE \nOur Style is TEAMWORK \nOur Goal is EXCELLENCE',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () => null,
                                onHover: (hovering) {
                                  setState(() {
                                    isHovering5 = hovering;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.ease,
                                  width: width * 0.3,
                                  height: height * 0.3,
                                  color: isHovering5
                                      ? darkTheme
                                          ? Color.fromRGBO(209, 168, 78, 0.5)
                                          : Color.fromRGBO(3, 169, 244, 0.3)
                                      : Colors.transparent,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 25,
                                      right: 25,
                                      top: 35,
                                    ),
                                    child: AnimatedDefaultTextStyle(
                                      duration: Duration(milliseconds: 200),
                                      style: TextStyle(
                                        fontFamily: textFont,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: isHovering5 ? 33 : 27,
                                      ),
                                      child: Text(
                                        'We have skin in the game. We own a larger percentage of all the portfolio\'s',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ]),
                    ),
                  ),
                ]);
                strategyFont = 23;
                mobile = false;

                // strategists
                strategistsTable = ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text('Portfolio',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontFamily: textFont,
                                  fontSize: 28,
                                  color: textColor,
                                )),
                          ),
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text('Ticker',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontFamily: textFont,
                                  fontSize: 28,
                                  color: textColor,
                                )),
                          ),
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text('% Exposure',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontFamily: textFont,
                                  fontSize: 28,
                                  color: textColor,
                                )),
                          ),
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text('Returns (YoY)',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontFamily: textFont,
                                  color: textColor,
                                  fontSize: 28,
                                )),
                          ),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text('Distressed Value Assets',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: textFont,
                                  fontSize: 17,
                                  color: textColor,
                                )),
                          ),
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text('DVAP',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Trebuchet MS',
                                  fontSize: 17,
                                  color: textColor,
                                )),
                          ),
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text(
                              '28%',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                color: textColor,
                                fontFamily: 'Trebuchet MS',
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text('28%',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: textColor,
                                  fontFamily: textFont,
                                )),
                          ),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text('Emerging Trends',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: textColor,
                                  fontFamily: textFont,
                                )),
                          ),
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text('ETP',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: textFont,
                                  color: textColor,
                                )),
                          ),
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text('26%',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: textFont,
                                  color: textColor,
                                )),
                          ),
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text(
                              '20%',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: textFont,
                                color: textColor,
                              ),
                            ),
                          ),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text(
                              'Defensive Investing',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: textFont,
                                color: textColor,
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text('DIP',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: textFont,
                                  color: textColor,
                                )),
                          ),
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text('10%',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: textFont,
                                  color: textColor,
                                )),
                          ),
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text('13%',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: textFont,
                                  color: textColor,
                                )),
                          ),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text(
                              'Risk Premium',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: textFont,
                                color: textColor,
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text(
                              'RPP',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: textFont,
                                color: textColor,
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text(
                              '5%',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: textFont,
                                color: textColor,
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text(
                              '12.36%',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: textFont,
                                color: textColor,
                              ),
                            ),
                          ),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text(
                              'Industrial Sector Rotation',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: textFont,
                                color: textColor,
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text(
                              'ISRP',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: textFont,
                                color: textColor,
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text(
                              '5%',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: textFont,
                                color: textColor,
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text(
                              '7.53%',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: textFont,
                                color: textColor,
                              ),
                            ),
                          ),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text('All Weather',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: textFont,
                                  color: textColor,
                                )),
                          ),
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text(
                              'AWP',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: textFont,
                                color: textColor,
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text(
                              '10%',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: textFont,
                                color: textColor,
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text(
                              '2.05%',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: textFont,
                                color: textColor,
                              ),
                            ),
                          ),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text(
                              'Multiple Currencies',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: textFont,
                                color: textColor,
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text('MCP',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: textFont,
                                  color: textColor,
                                )),
                          ),
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text(
                              '16%',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: textFont,
                                color: textColor,
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.15,
                            padding: const EdgeInsets.all(7),
                            child: Text(
                              '11%',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: textFont,
                                color: textColor,
                              ),
                            ),
                          ),
                        ]),
                    Container(
                        decoration: BoxDecoration(
                          color: darkTheme ? color : Colors.lightBlue,
                        ),
                        width: width * 0.5,
                        margin: EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left: width * 0.4,
                          right: width * 0.4,
                        ),
                        child: InkWell(
                          onTap: () => null,
                          onHover: (hovering) {
                            if (hovering) {
                              setState(() {
                                strategistsMore = hovering;
                              });
                            } else {
                              setState(() {
                                strategistsMore = hovering;
                              });
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              'Learn more about Strategists',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Trebuchet MS',
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )),
                  ],
                );

                // news
                /*news = CarouselSlider(
                items: [
                  // 1st item
                  Container(
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        Text(
                          'News from Investing.com',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Trebuchet MS',
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FutureBuilder(
                                  future: investingRss.loadFeed('NEWS', 'All News'),
                                  builder: (context, snapshot){

                                    if(snapshot.hasData){
                                      Object obj = snapshot.data!;
                                      final list = checkType(obj);

                                      if(list is List<InvestingRssNews>){
                                        List<InvestingRssNews> items = list;

                                        return Column(
                                          children: [
                                            Card(
                                              color: Color(0xffeeeeee),
                                              child: Container(
                                                width: width * 0.24,
                                                height: 300,
                                                child:Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    SizedBox(height: 12),
                                                    Text(
                                                      'All news',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        fontFamily: 'Trebuchet MS',
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    SizedBox(height: 12),
                                                    Container(
                                                      width :width * 0.24,
                                                      height: height * 0.6 * 0.25,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: NetworkImage(items[0].enclosure.url),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                        left: 8,
                                                        right: 8,
                                                      ),
                                                      child: Text(
                                                        '${items[0].title}',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                          fontFamily: 'Trebuchet MS',
                                                          fontSize: 15,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(7),
                                                      child: Text(
                                                        'By: ${items[0].author} , at ${items[0].pubDate.toString().substring(0,16)}',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                          fontFamily: 'Trebuchet MS',
                                                          fontSize: 13,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(7),
                                                      child: InkWell(
                                                        onTap: () => null,
                                                        child: Text(
                                                          '${items[0].link}',
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily: 'Trebuchet MS',
                                                            decoration: TextDecoration.underline,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 12.0),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 12.0),
                                            MaterialButton(
                                              child: Text(
                                                'See more',
                                              ),
                                              shape: StadiumBorder(),
                                              textColor: Colors.white,
                                              color: Colors.lightBlue[700],
                                              onPressed: () => null, // go the new list view
                                            ),
                                            SizedBox(height: 12.0),
                                          ],
                                        );
                                      }
                                    }else if(snapshot.hasError){
                                      return Text(
                                        '${snapshot.error}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'roboto',
                                          color: Colors.red,
                                          fontSize: 20,
                                        ),
                                      );
                                    }

                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                              ),
                              FutureBuilder(
                                  future: investingRss.loadFeed('NEWS', 'Forex News'),
                                  builder: (context, snapshot){

                                    if(snapshot.hasData){
                                      Object obj = snapshot.data!;
                                      final list = checkType(obj);

                                      if(list is List<InvestingRssNews>){
                                        List<InvestingRssNews> items = list;

                                        return Column(
                                            children: [
                                              Card(
                                                color: Color(0xffeeeeee),
                                                borderOnForeground: true,
                                                child: Container(
                                                  width: width * 0.24,
                                                  height: 300,
                                                  child:Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      SizedBox(height: 12),
                                                      Text(
                                                        'Forex News',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                          fontFamily: 'Trebuchet MS',
                                                          fontSize: 20,

                                                        ),
                                                      ),
                                                      SizedBox(height: 12.0),
                                                      Container(
                                                        width :width * 0.24,
                                                        height: height * 0.6 * 0.25,
                                                        decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                            image: NetworkImage(items[0].enclosure.url),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(
                                                          left: 8,
                                                          right: 8,
                                                        ),
                                                        child: Text(
                                                          '${items[0].title}',
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily: 'Trebuchet MS',
                                                            fontSize: 15,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(7),
                                                        child: Text(
                                                          'By: ${items[0].author} , at ${items[0].pubDate.toString().substring(0,16)}',
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily: 'Trebuchet MS',
                                                            fontSize: 13,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(7),
                                                        child: InkWell(
                                                          onTap: () => null,
                                                          child: Text(
                                                            '${items[0].link}',
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                              fontFamily: 'Trebuchet MS',
                                                              decoration: TextDecoration.underline,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 12.0),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 12.0),
                                              MaterialButton(
                                                child: Text(
                                                  'See more',
                                                ),
                                                shape: StadiumBorder(),
                                                textColor: Colors.white,
                                                color: Colors.lightBlue[700],
                                                onPressed: () => null, // go the new list view
                                              ),
                                              SizedBox(height: 12.0),
                                            ]
                                        );
                                      }
                                    }else if(snapshot.hasError){
                                      return Text(
                                        '${snapshot.error}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'roboto',
                                          color: Colors.red,
                                          fontSize: 20,
                                        ),
                                      );
                                    }

                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                              ),
                              FutureBuilder(
                                  future: investingRss.loadFeed('NEWS', 'Coronavirus News & Updates'),
                                  builder: (context, snapshot){

                                    if(snapshot.hasData){
                                      Object obj = snapshot.data!;
                                      final list = checkType(obj);

                                      if(list is List<InvestingRssNews>){
                                        List<InvestingRssNews> items = list;

                                        return Column(
                                            children: [
                                              Card(
                                                color: Color(0xffeeeeee),
                                                child: Container(
                                                  width: width * 0.24,
                                                  height : 300,
                                                  child:Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      SizedBox(height: 12),
                                                      Text(
                                                        'Coronavirus News & Updates',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                          fontFamily: 'Trebuchet MS',
                                                          fontSize: 20,

                                                        ),
                                                      ),
                                                      SizedBox(height: 12.0),
                                                      Container(
                                                        width :width * 0.24,
                                                        height: height * 0.6 * 0.25,
                                                        decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                            image: NetworkImage(items[0].enclosure.url),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(
                                                          left: 8,
                                                          right: 8,
                                                        ),
                                                        child: Text(
                                                          '${items[0].title}',
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily: 'Trebuchet MS',
                                                            fontSize: 15,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(7),
                                                        child: Text(
                                                          'By: ${items[0].author} , at ${items[0].pubDate.toString().substring(0,16)}',
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily: 'Trebuchet MS',
                                                            fontSize: 13,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(7),
                                                        child: InkWell(
                                                          onTap: () => null,
                                                          child: Text(
                                                            '${items[0].link}',
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                              fontFamily: 'Trebuchet MS',
                                                              decoration: TextDecoration.underline,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 12.0),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 12.0),
                                              MaterialButton(
                                                child: Text(
                                                  'See more',
                                                ),
                                                shape: StadiumBorder(),
                                                textColor: Colors.white,
                                                color: Colors.lightBlue[700],
                                                onPressed: () => null, // go the new list view
                                              ),
                                              SizedBox(height: 12.0),
                                            ]
                                        );
                                      }
                                    }else if(snapshot.hasError){
                                      return Text(
                                        '${snapshot.error}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'roboto',
                                          color: Colors.red,
                                          fontSize: 20,
                                        ),
                                      );
                                    }

                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                              ),
                              FutureBuilder(
                                  future: investingRss.loadFeed('NEWS', 'Economy News'),
                                  builder: (context, snapshot){

                                    if(snapshot.hasData){
                                      Object obj = snapshot.data!;
                                      final list = checkType(obj);

                                      if(list is List<InvestingRssNews>){
                                        List<InvestingRssNews> items = list;

                                        return Column(
                                            children: [
                                              Card(
                                                color: Color(0xffeeeeee),
                                                borderOnForeground: true,
                                                child: Container(
                                                  width: width * 0.24,
                                                  height: 300,
                                                  child:Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      SizedBox(height: 12),
                                                      Text(
                                                        'Economy News',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                          fontFamily: 'Trebuchet MS',
                                                          fontSize: 20,

                                                        ),
                                                      ),
                                                      SizedBox(height: 12.0),
                                                      Container(
                                                        width :width * 0.24,
                                                        height: height * 0.6 * 0.25,
                                                        decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                            image: NetworkImage(items[0].enclosure.url),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(
                                                          left: 8,
                                                          right: 8,
                                                        ),
                                                        child: Text(
                                                          '${items[0].title}',
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily: 'Trebuchet MS',
                                                            fontSize: 15,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(7),
                                                        child: Text(
                                                          'By: ${items[0].author} , at ${items[0].pubDate.toString().substring(0,16)}',
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily: 'Trebuchet MS',
                                                            fontSize: 13,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(7),
                                                        child: InkWell(
                                                          onTap: () => null,
                                                          child: Text(
                                                            '${items[0].link}',
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                              fontFamily: 'Trebuchet MS',
                                                              decoration: TextDecoration.underline,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 12.0),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 12),
                                              MaterialButton(
                                                child: Text(
                                                  'See more',
                                                ),
                                                shape: StadiumBorder(),
                                                textColor: Colors.white,
                                                color: Colors.lightBlue[700],
                                                onPressed: () => null, // go the new list view
                                              ),
                                              SizedBox(height: 12)
                                            ]
                                        );
                                      }
                                    }else if(snapshot.hasError){
                                      return Text(
                                        '${snapshot.error}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'roboto',
                                          color: Colors.red,
                                          fontSize: 20,
                                        ),
                                      );
                                    }

                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                              ),

                            ]
                        ),
                      ]
                    ),
                  ),

                  // 2nd item
                  Container(
                    child: Column(
                        children: [
                          SizedBox(height: 15),
                          Text(
                            'News from marketwatch.com',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Trebuchet MS',
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15.0),
                        ]
                    ),
                  ),
                ],
                options: CarouselOptions(
                  height: height * 0.6,
                  enlargeCenterPage: false,
                  autoPlay: true,
                  aspectRatio: 16/9,
                  autoPlayCurve: Curves.bounceIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(seconds: 25),
                  viewportFraction: 1,
                ),
              );*/
                news = Container(
                  child: Column(children: [
                    SizedBox(height: 15.0),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FutureBuilder(
                              future: investingRss.loadFeed('NEWS', 'All News'),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  Object obj = snapshot.data!;
                                  final list = checkType(obj);

                                  if (list is List<InvestingRssNews>) {
                                    List<InvestingRssNews> items = list;

                                    return Column(
                                      children: [
                                        Card(
                                          color: Color(0xffeeeeee),
                                          child: Container(
                                            width: width * 0.24,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(height: 12),
                                                Text(
                                                  'All news',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Trebuchet MS',
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(height: 12),
                                                Container(
                                                  width: width * 0.24,
                                                  height: height * 0.6 * 0.25,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          items[0]
                                                              .enclosure
                                                              .url),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 8,
                                                    right: 8,
                                                  ),
                                                  child: Text(
                                                    '${items[0].title}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'Trebuchet MS',
                                                      fontSize: 15,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(7),
                                                  child: Text(
                                                    'By: ${items[0].author} , at ${items[0].pubDate.toString().substring(0, 16)}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'Trebuchet MS',
                                                      fontSize: 13,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(7),
                                                  child: InkWell(
                                                    onTap: () => null,
                                                    child: Text(
                                                      '${items[0].link}',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'Trebuchet MS',
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 12.0),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 12.0),
                                        MaterialButton(
                                          child: Text(
                                            'See more',
                                          ),
                                          shape: StadiumBorder(),
                                          textColor: Colors.white,
                                          color: Colors.lightBlue[700],
                                          padding: const EdgeInsets.only(
                                            top: 13,
                                            bottom: 13,
                                            right: 30,
                                            left: 30,
                                          ),
                                          onPressed: () =>
                                              null, // go the new list view
                                        ),
                                        SizedBox(height: 12.0),
                                      ],
                                    );
                                  }
                                } else if (snapshot.hasError) {
                                  return Text(
                                    '${snapshot.error}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'roboto',
                                      color: Colors.red,
                                      fontSize: 20,
                                    ),
                                  );
                                }

                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }),
                          FutureBuilder(
                              future:
                                  investingRss.loadFeed('NEWS', 'Forex News'),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  Object obj = snapshot.data!;
                                  final list = checkType(obj);

                                  if (list is List<InvestingRssNews>) {
                                    List<InvestingRssNews> items = list;

                                    return Column(children: [
                                      Card(
                                        color: Color(0xffeeeeee),
                                        borderOnForeground: true,
                                        child: Container(
                                          width: width * 0.24,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(height: 12),
                                              Text(
                                                'Forex News',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Trebuchet MS',
                                                  fontSize: 20,
                                                ),
                                              ),
                                              SizedBox(height: 12.0),
                                              Container(
                                                width: width * 0.24,
                                                height: height * 0.6 * 0.25,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        items[0].enclosure.url),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 8,
                                                  right: 8,
                                                ),
                                                child: Text(
                                                  '${items[0].title}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Trebuchet MS',
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(7),
                                                child: Text(
                                                  'By: ${items[0].author} , at ${items[0].pubDate.toString().substring(0, 16)}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Trebuchet MS',
                                                    fontSize: 13,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(7),
                                                child: InkWell(
                                                  onTap: () => null,
                                                  child: Text(
                                                    '${items[0].link}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'Trebuchet MS',
                                                      decoration: TextDecoration
                                                          .underline,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 12.0),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 12.0),
                                      MaterialButton(
                                        child: Text(
                                          'See more',
                                        ),
                                        shape: StadiumBorder(),
                                        textColor: Colors.white,
                                        color: Colors.lightBlue[700],
                                        padding: const EdgeInsets.only(
                                          top: 13,
                                          bottom: 13,
                                          right: 30,
                                          left: 30,
                                        ),
                                        onPressed: () =>
                                            null, // go the new list view
                                      ),
                                      SizedBox(height: 12.0),
                                    ]);
                                  }
                                } else if (snapshot.hasError) {
                                  return Text(
                                    '${snapshot.error}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'roboto',
                                      color: Colors.red,
                                      fontSize: 20,
                                    ),
                                  );
                                }

                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }),
                          FutureBuilder(
                              future: investingRss.loadFeed(
                                  'NEWS', 'Coronavirus News & Updates'),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  Object obj = snapshot.data!;
                                  final list = checkType(obj);

                                  if (list is List<InvestingRssNews>) {
                                    List<InvestingRssNews> items = list;

                                    return Column(children: [
                                      Card(
                                        color: Color(0xffeeeeee),
                                        child: Container(
                                          width: width * 0.24,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(height: 12),
                                              Text(
                                                'Coronavirus News & Updates',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Trebuchet MS',
                                                  fontSize: 20,
                                                ),
                                              ),
                                              SizedBox(height: 12.0),
                                              Container(
                                                width: width * 0.24,
                                                height: height * 0.6 * 0.25,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        items[0].enclosure.url),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 8,
                                                  right: 8,
                                                ),
                                                child: Text(
                                                  '${items[0].title}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Trebuchet MS',
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(7),
                                                child: Text(
                                                  'By: ${items[0].author} , at ${items[0].pubDate.toString().substring(0, 16)}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Trebuchet MS',
                                                    fontSize: 13,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(7),
                                                child: InkWell(
                                                  onTap: () => null,
                                                  child: Text(
                                                    '${items[0].link}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'Trebuchet MS',
                                                      decoration: TextDecoration
                                                          .underline,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 12.0),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 12.0),
                                      MaterialButton(
                                        child: Text(
                                          'See more',
                                        ),
                                        shape: StadiumBorder(),
                                        textColor: Colors.white,
                                        color: Colors.lightBlue[700],
                                        padding: const EdgeInsets.only(
                                          top: 13,
                                          bottom: 13,
                                          right: 30,
                                          left: 30,
                                        ),
                                        onPressed: () =>
                                            null, // go the new list view
                                      ),
                                      SizedBox(height: 12.0),
                                    ]);
                                  }
                                } else if (snapshot.hasError) {
                                  return Text(
                                    '${snapshot.error}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'roboto',
                                      color: Colors.red,
                                      fontSize: 20,
                                    ),
                                  );
                                }

                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }),
                          FutureBuilder(
                              future:
                                  investingRss.loadFeed('NEWS', 'Economy News'),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  Object obj = snapshot.data!;
                                  final list = checkType(obj);

                                  if (list is List<InvestingRssNews>) {
                                    List<InvestingRssNews> items = list;

                                    return Column(children: [
                                      Card(
                                        color: Color(0xffeeeeee),
                                        borderOnForeground: true,
                                        child: Container(
                                          width: width * 0.24,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(height: 12),
                                              Text(
                                                'Economy News',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Trebuchet MS',
                                                  fontSize: 20,
                                                ),
                                              ),
                                              SizedBox(height: 12.0),
                                              Container(
                                                width: width * 0.24,
                                                height: height * 0.6 * 0.25,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        items[0].enclosure.url),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 8,
                                                  right: 8,
                                                ),
                                                child: Text(
                                                  '${items[0].title}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Trebuchet MS',
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(7),
                                                child: Text(
                                                  'By: ${items[0].author} , at ${items[0].pubDate.toString().substring(0, 16)}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Trebuchet MS',
                                                    fontSize: 13,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(7),
                                                child: InkWell(
                                                  onTap: () => null,
                                                  child: Text(
                                                    '${items[0].link}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'Trebuchet MS',
                                                      decoration: TextDecoration
                                                          .underline,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 12.0),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      MaterialButton(
                                        child: Text(
                                          'See more',
                                        ),
                                        shape: StadiumBorder(),
                                        textColor: Colors.white,
                                        color: Colors.lightBlue[700],
                                        padding: const EdgeInsets.only(
                                          top: 13,
                                          bottom: 13,
                                          right: 30,
                                          left: 30,
                                        ),
                                        onPressed: () =>
                                            null, // go the new list view
                                      ),
                                      SizedBox(height: 12)
                                    ]);
                                  }
                                } else if (snapshot.hasError) {
                                  return Text(
                                    '${snapshot.error}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'roboto',
                                      color: Colors.red,
                                      fontSize: 20,
                                    ),
                                  );
                                }

                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }),
                        ]),
                  ]),
                );

                // contact us
                contacts = Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: darkTheme ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                        color: darkTheme
                            ? Color(0xFFD1A84E)
                            : Color.fromRGBO(0, 0, 0, 0.3)),
                  ),
                  margin: const EdgeInsets.only(
                    top: 30,
                    left: 80,
                    right: 80,
                    bottom: 30,
                  ),
                  padding: const EdgeInsets.only(
                    top: 30,
                    left: 80,
                    right: 80,
                    bottom: 30,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: width * 0.3,
                            height: 70,
                            margin: const EdgeInsets.all(15.0),
                            child: TextFormField(
                              controller: name,
                              style: TextStyle(
                                fontFamily: textFont,
                                color: textColor,
                              ),
                              cursorColor: textColor,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: 'Name',
                                hintStyle: TextStyle(
                                  fontFamily: textFont,
                                  color: textColor,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.0,
                                      color:
                                          darkTheme ? color : Colors.lightBlue),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.0,
                                      color:
                                          darkTheme ? color : Colors.lightBlue),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2.0,
                                      color:
                                          darkTheme ? color : Colors.lightBlue),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.3,
                            height: 70,
                            margin: const EdgeInsets.all(15.0),
                            child: TextFormField(
                              controller: email,
                              style: TextStyle(
                                fontFamily: textFont,
                                color: textColor,
                              ),
                              cursorColor: textColor,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'Email Address',
                                hintStyle: TextStyle(
                                  fontFamily: textFont,
                                  color: textColor,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.0,
                                      color:
                                          darkTheme ? color : Colors.lightBlue),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.0,
                                      color:
                                          darkTheme ? color : Colors.lightBlue),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2.0,
                                      color:
                                          darkTheme ? color : Colors.lightBlue),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: width * 0.67,
                        height: 70,
                        margin: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          controller: message,
                          style: TextStyle(
                            fontFamily: textFont,
                            color: textColor,
                          ),
                          cursorColor: textColor,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Message',
                            hintStyle: TextStyle(
                              fontFamily: textFont,
                              color: textColor,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.0,
                                  color: darkTheme ? color : Colors.lightBlue),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.0,
                                  color: darkTheme ? color : Colors.lightBlue),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2.0,
                                  color: darkTheme ? color : Colors.lightBlue),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      MaterialButton(
                          onPressed: () => displayDialog(
                              context, 'Attention', 'Coming soon...'),
                          child: Text(
                            'Send Message',
                            style: TextStyle(
                              fontFamily: textFont,
                              color: Colors.black,
                            ),
                          ),
                          shape: StadiumBorder(),
                          color: darkTheme ? color : Colors.lightBlue,
                          padding: EdgeInsets.all(20.0)),
                      SizedBox(height: 20.0),
                    ],
                  ),
                );

                //team
                team = Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: width * 0.3,
                        child: createTeamMemberCard(
                            context,
                            teamList[0]['name']!,
                            teamList[0]['position']!,
                            teamList[0]['qualification']!,
                            teamList[0]['image']!),
                      ),
                      Container(
                        width: width * 0.3,
                        child: createTeamMemberCard(
                            context,
                            teamList[2]['name']!,
                            teamList[2]['position']!,
                            teamList[2]['qualification']!,
                            teamList[2]['image']!),
                      ),
                      Container(
                        width: width * 0.3,
                        child: createTeamMemberCard(
                            context,
                            teamList[1]['name']!,
                            teamList[1]['position']!,
                            teamList[1]['qualification']!,
                            teamList[1]['image']!),
                      ),
                    ],
                  ),
                );

                //philosophy
                philosophy = Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      decoration: BoxDecoration(
                        color: darkTheme ? color : Colors.lightBlue,
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          BoxShadow(
                            color: darkTheme
                                ? Color.fromRGBO(209, 168, 78, 0.5)
                                : Colors.lightBlue[200]!,
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(15.0),
                      padding: EdgeInsets.all(25),
                      child: Text(
                        'We have removed the guess work with our systematic data driven proprietary models for top/down, bottom/up market research.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: textFont,
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: darkTheme ? color : Colors.black,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      decoration: BoxDecoration(
                        color: darkTheme ? color : Colors.lightBlue,
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          BoxShadow(
                            color: darkTheme
                                ? Color.fromRGBO(209, 168, 78, 0.5)
                                : Colors.lightBlue[200]!,
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(15.0),
                      padding: EdgeInsets.all(25),
                      child: Text(
                        'Our portfolio construction process emphasizes on wealth preservation through systematic risk quantification and management.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: textFont,
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: darkTheme ? color : Colors.black,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      decoration: BoxDecoration(
                        color: darkTheme ? color : Colors.lightBlue,
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          BoxShadow(
                            color: darkTheme
                                ? Color.fromRGBO(209, 168, 78, 0.5)
                                : Colors.lightBlue[200]!,
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(15.0),
                      padding: EdgeInsets.all(25),
                      child: Text(
                        'We keep our investors fully informed monthly about the status of the market, expectation and mitigation measures, especially in the case of irrational market fear.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: textFont,
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                );

                /*Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FutureBuilder(
                        future: marketWatchRss.initiate('Top Stories'),
                        builder: (context, snapshot){

                          if(snapshot.hasData){

                            /*if(list is List<InvestingRssNews>){
                                          List<InvestingRssNews> items = list;

                                          return Column(
                                            children: [
                                              Card(
                                                color: Color(0xffeeeeee),
                                                child: Container(
                                                  width: width * 0.24,
                                                  height: 300,
                                                  child:Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      SizedBox(height: 12),
                                                      Text(
                                                        'All news',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                          fontFamily: 'Trebuchet MS',
                                                          fontSize: 20,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      SizedBox(height: 12),
                                                      Container(
                                                        width :width * 0.24,
                                                        height: height * 0.6 * 0.25,
                                                        decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                            image: NetworkImage(items[0].enclosure.url),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(
                                                          left: 8,
                                                          right: 8,
                                                        ),
                                                        child: Text(
                                                          '${items[0].title}',
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily: 'Trebuchet MS',
                                                            fontSize: 15,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(7),
                                                        child: Text(
                                                          'By: ${items[0].author} , at ${items[0].pubDate.toString().substring(0,16)}',
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily: 'Trebuchet MS',
                                                            fontSize: 13,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(7),
                                                        child: InkWell(
                                                          onTap: () => null,
                                                          child: Text(
                                                            '${items[0].link}',
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                              fontFamily: 'Trebuchet MS',
                                                              decoration: TextDecoration.underline,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 12.0),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 12.0),
                                              MaterialButton(
                                                child: Text(
                                                  'See more',
                                                ),
                                                shape: StadiumBorder(),
                                                textColor: Colors.white,
                                                color: Colors.lightBlue[700],
                                                onPressed: () => null, // go the new list view
                                              ),
                                              SizedBox(height: 12.0),
                                            ],
                                          );*/
                          }else if(snapshot.hasError){
                            return Text(
                              '${snapshot.error}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'roboto',
                                color: Colors.red,
                                fontSize: 20,
                              ),
                            );
                          }

                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                    ),
                    FutureBuilder(
                        future: investingRss.loadFeed('NEWS', 'Forex News'),
                        builder: (context, snapshot){

                          if(snapshot.hasData){
                            Object obj = snapshot.data!;
                            final list = checkType(obj);

                            if(list is List<InvestingRssNews>){
                              List<InvestingRssNews> items = list;

                              return Column(
                                  children: [
                                    Card(
                                      color: Color(0xffeeeeee),
                                      borderOnForeground: true,
                                      child: Container(
                                        width: width * 0.24,
                                        height: 300,
                                        child:Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(height: 12),
                                            Text(
                                              'Forex News',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Trebuchet MS',
                                                fontSize: 20,

                                              ),
                                            ),
                                            SizedBox(height: 12.0),
                                            Container(
                                              width :width * 0.24,
                                              height: height * 0.6 * 0.25,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(items[0].enclosure.url),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                              ),
                                              child: Text(
                                                '${items[0].title}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Trebuchet MS',
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(7),
                                              child: Text(
                                                'By: ${items[0].author} , at ${items[0].pubDate.toString().substring(0,16)}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Trebuchet MS',
                                                  fontSize: 13,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(7),
                                              child: InkWell(
                                                onTap: () => null,
                                                child: Text(
                                                  '${items[0].link}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Trebuchet MS',
                                                    decoration: TextDecoration.underline,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 12.0),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 12.0),
                                    MaterialButton(
                                      child: Text(
                                        'See more',
                                      ),
                                      shape: StadiumBorder(),
                                      textColor: Colors.white,
                                      color: Colors.lightBlue[700],
                                      onPressed: () => null, // go the new list view
                                    ),
                                    SizedBox(height: 12.0),
                                  ]
                              );
                            }
                          }else if(snapshot.hasError){
                            return Text(
                              '${snapshot.error}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'roboto',
                                color: Colors.red,
                                fontSize: 20,
                              ),
                            );
                          }

                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                    ),
                    FutureBuilder(
                        future: investingRss.loadFeed('NEWS', 'Coronavirus News & Updates'),
                        builder: (context, snapshot){

                          if(snapshot.hasData){
                            Object obj = snapshot.data!;
                            final list = checkType(obj);

                            if(list is List<InvestingRssNews>){
                              List<InvestingRssNews> items = list;

                              return Column(
                                  children: [
                                    Card(
                                      color: Color(0xffeeeeee),
                                      child: Container(
                                        width: width * 0.24,
                                        height : 300,
                                        child:Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(height: 12),
                                            Text(
                                              'Coronavirus News & Updates',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Trebuchet MS',
                                                fontSize: 20,

                                              ),
                                            ),
                                            SizedBox(height: 12.0),
                                            Container(
                                              width :width * 0.24,
                                              height: height * 0.6 * 0.25,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(items[0].enclosure.url),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                              ),
                                              child: Text(
                                                '${items[0].title}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Trebuchet MS',
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(7),
                                              child: Text(
                                                'By: ${items[0].author} , at ${items[0].pubDate.toString().substring(0,16)}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Trebuchet MS',
                                                  fontSize: 13,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(7),
                                              child: InkWell(
                                                onTap: () => null,
                                                child: Text(
                                                  '${items[0].link}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Trebuchet MS',
                                                    decoration: TextDecoration.underline,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 12.0),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 12.0),
                                    MaterialButton(
                                      child: Text(
                                        'See more',
                                      ),
                                      shape: StadiumBorder(),
                                      textColor: Colors.white,
                                      color: Colors.lightBlue[700],
                                      onPressed: () => null, // go the new list view
                                    ),
                                    SizedBox(height: 12.0),
                                  ]
                              );
                            }
                          }else if(snapshot.hasError){
                            return Text(
                              '${snapshot.error}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'roboto',
                                color: Colors.red,
                                fontSize: 20,
                              ),
                            );
                          }

                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                    ),
                    FutureBuilder(
                        future: investingRss.loadFeed('NEWS', 'Economy News'),
                        builder: (context, snapshot){

                          if(snapshot.hasData){
                            Object obj = snapshot.data!;
                            final list = checkType(obj);

                            if(list is List<InvestingRssNews>){
                              List<InvestingRssNews> items = list;

                              return Column(
                                  children: [
                                    Card(
                                      color: Color(0xffeeeeee),
                                      borderOnForeground: true,
                                      child: Container(
                                        width: width * 0.24,
                                        height: 300,
                                        child:Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(height: 12),
                                            Text(
                                              'Economy News',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Trebuchet MS',
                                                fontSize: 20,

                                              ),
                                            ),
                                            SizedBox(height: 12.0),
                                            Container(
                                              width :width * 0.24,
                                              height: height * 0.6 * 0.25,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(items[0].enclosure.url),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                              ),
                                              child: Text(
                                                '${items[0].title}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Trebuchet MS',
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(7),
                                              child: Text(
                                                'By: ${items[0].author} , at ${items[0].pubDate.toString().substring(0,16)}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Trebuchet MS',
                                                  fontSize: 13,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(7),
                                              child: InkWell(
                                                onTap: () => null,
                                                child: Text(
                                                  '${items[0].link}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Trebuchet MS',
                                                    decoration: TextDecoration.underline,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 12.0),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    MaterialButton(
                                      child: Text(
                                        'See more',
                                      ),
                                      shape: StadiumBorder(),
                                      textColor: Colors.white,
                                      color: Colors.lightBlue[700],
                                      onPressed: () => null, // go the new list view
                                    ),
                                    SizedBox(height: 12)
                                  ]
                              );
                            }
                          }else if(snapshot.hasError){
                            return Text(
                              '${snapshot.error}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'roboto',
                                color: Colors.red,
                                fontSize: 20,
                              ),
                            );
                          }

                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                    ),

                  ]
              );*/
              }

              return createBody(
                  context,
                  banner,
                  strategistsTable,
                  strategyFont,
                  mobile,
                  width,
                  height,
                  news,
                  contacts,
                  team,
                  philosophy,
                  textColor,
                  color,
                  textFont);
            }),
          ),
        ),
      ),
    );
  }

  Widget createBody(
      BuildContext context,
      Widget banner,
      Widget table,
      double strategyFont,
      bool mobile,
      double width,
      double height,
      Widget news,
      Widget contacts,
      Widget team,
      Widget philosophy,
      Color textColor,
      Color color,
      String textFont) {
    return ListView(
      shrinkWrap: true,
      children: [
        banner,
        // art of creating value
        Container(
          decoration: BoxDecoration(
            color: this.darkTheme ? color : Colors.lightBlue,
          ),
          width: width,
          child: Padding(
            padding: EdgeInsets.only(
              top: 20.0,
              bottom: 20.0,
            ),
            child: Text(
              '\"Strategy is the art of creating value.\"',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: textFont,
                color: this.darkTheme ? Colors.black : Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: strategyFont,
              ),
            ),
          ),
        ),

        // strategists table
        Padding(
          padding: const EdgeInsets.only(
            top: 25.0,
            bottom: 25.0,
          ),
          child: Text(
            'Kua Capital Strategists Returns',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: textFont,
              color: textColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        table,
        SizedBox(height: 15),

        // opportunities come infrequently
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Text(
            '\"Opportunities come infrequently. When it rains gold, put out the bucket, not the thimble\" \n~Warren Buffet',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: textFont,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: mobile ? 15 : 25,
            ),
          ),
          padding: const EdgeInsets.all(15.0),
        ),

        // Investment Philosophy and Process
        Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            'Investment Philosophy and Process',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: textFont,
              color: this.darkTheme ? color : Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 30,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        Container(
          width: width,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 20.0,
            ),
            child: Text(
              'You must add value to yourself to be relevant.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: textFont,
                color: this.darkTheme ? color : Colors.black,
                fontSize: 19,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        philosophy,

        // Our Team
        Container(
            width: width * 0.75,
            child: Text(
              'Our Team',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: textFont,
                color: this.darkTheme ? color : Colors.black,
                fontWeight: FontWeight.w800,
                fontSize: 30,
                decoration: TextDecoration.underline,
              ),
            )),
        Container(
          width: width,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 20.0,
            ),
            child: Text(
              'Driven by the pursuit for growth.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: textFont,
                color: this.darkTheme ? color : Colors.black,
                fontSize: 19,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        team,

        // news headlines, One from each out of six
        /*Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            'News Updates',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Trebuchet MS',
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        news,*/

        // see more news update
        /*SizedBox(height: 15.0),
        Container(
          color: Color(0xffeeeeee),
          child: InkWell(
            onTap: () => null,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'See more news',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Trebuchet MS',
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),*/

        // contact us definitions
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(12.0),
          child: ListTile(
            title: Text(
              'Contact Us',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: textFont,
                color: this.darkTheme ? color : Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 35,
                decoration: TextDecoration.underline,
              ),
            ),
            subtitle: Text(
              'Have a Question ?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: textFont,
                color: this.darkTheme ? color : Colors.black,
                fontSize: 19,
              ),
            ),
          ),
        ),
        contacts,
      ],
    );
  }

  // check the type of list for investing news and analysis
  checkType(Object data) {
    if (data is List<InvestingRssNews>) {
      return List<InvestingRssNews>.from(data);
    } else if (data is List<InvestingRssAnalysis>) {
      return List<InvestingRssAnalysis>.from(data);
    }
  }

  // build news listView
  Widget _buildNewsListView(context, List<InvestingRssNews> data) {
    return ListView(shrinkWrap: true, children: [
      Container(
        width: MediaQuery.of(context).size.width,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            width: 30,
            height: 30,
            child: Image.network(data[0].enclosure.url, width: 30, height: 30),
          ),
          Text(data[0].title),
          Text('${data[0].pubDate}'),
          Text(data[0].author),
          Text(data[0].link)
        ]),
      ),
    ]);
  }

  Widget createTeamMemberCard(BuildContext context, String name,
      String position, String qualification, String image) {
    return Card(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Theme(
                      data: Theme.of(context).copyWith(
                        scaffoldBackgroundColor: Colors.white,
                        accentColor: Colors.white,
                      ),
                      child: Builder(
                        builder: (context) => Scaffold(
                          appBar: AppBar(
                            title: Text(
                              name,
                              style: TextStyle(fontFamily: 'Trebuchet MS'),
                            ),
                            backgroundColor: Colors.black,
                          ),
                          body: SafeArea(
                            child: Center(
                              child: Hero(
                                tag: name + 'profile_image',
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  child: Image.asset(image, height: 100),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 120,
                child: Hero(
                  tag: name + 'profile_image',
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(height: 7.0),
            ListTile(
              title: Text(
                name,
                style: TextStyle(fontFamily: 'Trebuchet MS'),
              ),
              subtitle: Text(
                'Name',
                style: TextStyle(
                    fontFamily: 'Trebuchet MS', fontWeight: FontWeight.w300),
              ),
            ),
            ListTile(
              title: Text(
                position,
                style: TextStyle(fontFamily: 'Trebuchet MS'),
              ),
              subtitle: Text(
                'Position',
                style: TextStyle(
                    fontFamily: 'Trebuchet MS', fontWeight: FontWeight.w300),
              ),
            ),
          ]),
    );
  }

  Future displayDialog(BuildContext context, String name, String content) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(name,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Trebuchet MS',
                color: Colors.black,
                fontWeight: FontWeight.bold)),
        content: SingleChildScrollView(child: Text(content)),
        actions: [
          MaterialButton(
            child: Text('Close'),
            onPressed: () => Navigator.pop(context),
            color: Colors.black,
            textColor: Colors.white,
            shape: StadiumBorder(),
            elevation: 5,
            padding: EdgeInsets.all(15.0),
          ),
        ],
      ),
    );
  }
}
