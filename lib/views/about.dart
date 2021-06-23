import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AboutUsPage extends StatefulWidget {
  @override
  AboutUsPageState createState() => new AboutUsPageState();
}

class AboutUsPageState extends State<AboutUsPage> {
  final strategistsList = [
    {
      'name': 'Distressed Value Assets Portfolio',
      'description':
          'We seek to find value in distress value Assets that have been ignored by the market...',
      'image': 'assets/banner/dandelion.jpg',
      'content':
          'We hold 12 positions across 5 sectors. We are bullish on oil. Since mid 2020, oil has performed better than most sectors. The reason we decided to get exposure on oil is because the sectore has been distressed for a long duration and multiple oil companies have experienced bankruptcy. The bankruptcy was accelerated by the closure/shut down due to COVID-19. During this period, we decide to seek exposure on good oil related businesses since only resilient/good companies are posed to survive and be operational.'
    },
    {
      'name': 'Emerging Macro Trends Portfolio',
      'description':
          'We seek to gain exposure to potential future disruptors. Especially in technology, finance...',
      'image': 'assets/banner/banner_image.jpg',
      'content':
          'Crypto currency is themed the future of finance. Removing the middleman through decentralization and public ledgers. For us it\'s another asset to grow our fund. Risky for sure, but what is risk? ? We have seen multiple euphoric booms and bursts in a short space of time since inception. After the Tulip like euphoria that ended in a burst in 2018, we decided to acquire a portfolio of cryptocurrencies and held them. The wait was painful, and we doubted ourselves nonstop since it\'s a new asset,so survival is not guaranteed. Recently they have done well growing at a 7x multiple.'
    },
    {
      'name': 'Defensive Investment Portfolio',
      'description':
          'We seek to gain alpha on the Dow Jones index through the selection of only the strong companies...',
      'image': 'assets/banner/lights.jpg',
      'content':
          'Our first 100% systematic investment approach is the popular trend following. We use trend following rules to identify stocks/assets to build our defensive portfolio. Our current exposure and the portfolio have been averaging 1.8% growth returns monthly with lowest maximum drawdown compare to our Buy & Hold Index.'
    },
    {
      'name': 'Risk Premium Portfolio',
      'description':
          'We seek to gain alpha through harvesting risk premium through employing the VIX and the SnP 500...',
      'image': 'assets/banner/sunset.jpg',
      'content':
          'We harvest the S&P 500 Volatility premium systematically. Our approach makes use of the CBOE Volatility index (VIX) (the fear gauge) and the S&P 500 index to determine to go long/short on volatility. We employ ETF\'s (VXX and SVXY) to express our view on volatility premium. This approach does great during high volatile periods (per our backtest) thus a great strategy to hedge our fund during crises periods or irrational fear.'
    },
    {
      'name': 'Industrial Sector Rotation Portfolio',
      'description':
          'We seek to gain exposure to the industrial sector that is in current Economic view...',
      'image': 'assets/banner/guy.jpg',
      'content':
          'Consumer spending is highly correlated to the business cycle. Therefore, we have designed this systematic portfolio to take advantage of this shift in consumer spending. This systematic investment portfolio ranks, selects and invest in Industrial Sector with low volatility. If none of the sectors are selected especially during a bear market, the capital is fully invested in USA government treasuries (tactical asset allocation). This portfolio is expose to only the main American industrial sectors, which are: Consumer Discretionary, Financials, Technology, Health Care, Communications, Utilities Consumer Staples, Real Estate, Materials, Industrial and Energy.'
    },
    {
      'name': 'All Weather Portfolio',
      'description':
          'We seek to preserve cash buying power Against inflation as we wait for buying opportunity...',
      'image': 'assets/banner/dandelion.jpg',
      'content':
          'The main aim of this strategy is preservation of funds/cash. it is not designed to beat the market but inflation. Since it is exposed to both the stock market and the USA Government bonds, the returns are the average of both. The funds are reserved opportunities the market presents now and again. IEF, SPY and Cash are the dominant assets in this portfolio.'
    },
    {
      'name': 'Multi Currency Portfolio',
      'description':
          'We seek exposure to currency Exchange rate market and capture macro trends...',
      'image': 'assets/banner/banner_image.jpg',
      'content':
          'We have developed a Long/Short proprietary systematic currency momentum investment strategy. We only buy or sell currency that have the potential to gain in returns in the nearest future. This strategy proved to be able to harvest the COVID driven momentum in March and April 2020. We decided to pause the strategy and reformulate it, back-test and conduct optimization to take advantage of persistent low volatile periods in the market.'
    },
    {
      'name': 'Dividend Legacy Portfolio',
      'description': 'Coming soon...',
    },
    {'name': 'Southern African Portfolio', 'description': 'Coming soon...'},
  ];

  bool darkTheme = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var res = ModalRoute.of(context)!.settings.arguments;

    if (res == true) {
      this.darkTheme = true;
    } else if (res == false) {
      this.darkTheme = false;
    } else {
      res = null;
    }

    Color color = Color(0xffD1A84E);
    String textFont = 'Montserrat';
    Color textColor = darkTheme ? color : Colors.black;

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Theme(
      data: Theme.of(context).copyWith(
        scaffoldBackgroundColor: darkTheme ? color : Colors.white,
        accentColor: darkTheme ? color : Colors.white,
        canvasColor: darkTheme ? Colors.black : Colors.white,
      ),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text(
              'About Us',
              style: TextStyle(
                fontFamily: textFont,
                color: darkTheme ? color : Colors.white,
                fontWeight: FontWeight.w600,
              ),
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
                onPressed: () => Navigator.pushReplacementNamed(
                    context, '/home',
                    arguments: this.darkTheme),
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
                onPressed: () => Navigator.pushReplacementNamed(
                    context, '/principles',
                    arguments: this.darkTheme),
                padding: EdgeInsets.all(35.0),
              ),
            ]),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        Positioned(
                          child: Container(
                            width: width,
                            height: height * 0.4,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/banner/banner_image.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          child: Container(
                            width: width,
                            height: height * 0.4,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(
                                0,
                                0,
                                0,
                                0.3,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          child: Container(
                            padding: const EdgeInsets.all(30),
                            margin: EdgeInsets.only(left: 120, top: 10),
                            decoration: BoxDecoration(
                              color: darkTheme ? Colors.black : Colors.white,
                              borderRadius:
                                  BorderRadius.circular(width * 0.1 * 0.5),
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
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Container(
                      width: width * 0.4,
                      child: Text(
                        'What are we about ?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: textFont,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontSize: 38,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      padding: EdgeInsets.all(15.0),
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        'Incorporated in Eswatini but with footprints in Africa and globally, at Kua Capital our core market approach is systemic with a business owner mindset with zero tolerance to stock price addiction. We value business according to their earnings, dividends, competitiveness(moats) and their future value creation (either through expansion or innovation). \n\nWe believe in the concept of compounding wealth gradually through acquisition of high-quality low risk assets with a big margin of safety. We apply thoroughly tested principles using robust data driven quantitative analysis. As a Hedge fund, we seek exposure to quality distressed assets, emerging trends, emerging markets, macro trends, risk parity, volatility risk premium,sector rotation, trend following and exchange rates. \n\nWe are data driven in formulating our market investment strategies and cash deployment. We have skin in the game, our interest is aligned with those of our clients. We make money when they do and share a larger portion of the downside. This makes use excellent stewards to our client’s wealth.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: textFont,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0),

                    // principle and culture header
                    Container(
                      child: Text(
                        'Principle & Culture',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: textFont,
                          fontSize: 38,
                          fontWeight: FontWeight.w900,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    // principle and culture
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      padding: const EdgeInsets.all(
                        15,
                      ),
                      width: width * 0.6,
                      child: Text(
                        'At SMD Global Investment we have two criteria that enable us to align our objectives with those of our client. A high-water mark provision, meaning we only charge fees after outperforming our highest historic returns performance. We also put emphasis on performance-based compensation meaning we only charge performance fees only when we deliver positive returns. With this we avoid conflict of interest, maintain respect and integrity for our partners and investors.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: textFont,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 50),

                    // strategists header
                    Container(
                      width: width,
                      color: Colors.white,
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'More about our Strategists...',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: textFont,
                          color: Colors.black,
                          fontSize: 42,
                        ),
                      ),
                    ),
                    SizedBox(height: 35),

                    // strategists rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        createStrategyCard(
                            context,
                            strategistsList[0]['name']!,
                            strategistsList[0]['description']!,
                            strategistsList[0]['image']!,
                            strategistsList[0]['content']!),
                        createStrategyCard(
                            context,
                            strategistsList[1]['name']!,
                            strategistsList[1]['description']!,
                            strategistsList[1]['image']!,
                            strategistsList[1]['content']!),
                        createStrategyCard(
                            context,
                            strategistsList[2]['name']!,
                            strategistsList[2]['description']!,
                            strategistsList[2]['image']!,
                            strategistsList[2]['content']!),
                      ],
                    ),
                    SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        createStrategyCard(
                            context,
                            strategistsList[3]['name']!,
                            strategistsList[3]['description']!,
                            strategistsList[3]['image']!,
                            strategistsList[3]['content']!),
                        createStrategyCard(
                            context,
                            strategistsList[4]['name']!,
                            strategistsList[4]['description']!,
                            strategistsList[4]['image']!,
                            strategistsList[4]['content']!),
                        createStrategyCard(
                            context,
                            strategistsList[5]['name']!,
                            strategistsList[5]['description']!,
                            strategistsList[5]['image']!,
                            strategistsList[5]['content']!),
                      ],
                    ),
                    SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        createStrategyCard(
                            context,
                            strategistsList[6]['name']!,
                            strategistsList[6]['description']!,
                            strategistsList[6]['image']!,
                            strategistsList[6]['content']!),
                        createStrategyCard(context, strategistsList[7]['name']!,
                            strategistsList[7]['description']!, '', ''),
                        createStrategyCard(context, strategistsList[8]['name']!,
                            strategistsList[7]['description']!, '', ''),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget createStrategyCard(BuildContext context, String name,
      String description, String image, String content) {
    String textFont = 'Montserrat';
    Color color = Color(0xffd1a84e);
    Color textColor = this.darkTheme ? color : Colors.black;
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      height: image == '' ? null : MediaQuery.of(context).size.width * 0.3,
      child: Card(
        color: Colors.black12,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 12.0),
              Container(
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: textFont,
                    fontWeight: FontWeight.w900,
                    fontSize: 19,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 12.0),
              image != ''
                  ? Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: 220,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Container(),
              SizedBox(height: 32),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  description,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: textFont,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 13.0),
              image != ''
                  ? MaterialButton(
                      onPressed: () => displayDialog(context, name, content),
                      child: Text(
                        'Learn More',
                        style: TextStyle(
                          fontFamily: textFont,
                        ),
                      ),
                      textColor: darkTheme ? color : Color(0xffffffff),
                      color: this.darkTheme ? Colors.black : Colors.lightBlue,
                      shape: StadiumBorder(),
                      elevation: 5,
                      padding: const EdgeInsets.only(
                        top: 15.0,
                        bottom: 15.0,
                        right: 30.0,
                        left: 30.0,
                      ),
                    )
                  : Container(),
              image != ''
                  ? SizedBox(
                      height: 15.0,
                    )
                  : Container(),
            ]),
      ),
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
