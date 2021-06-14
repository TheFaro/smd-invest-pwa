import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage1 extends StatelessWidget{

  // defining constants
  final List strategistsList = [
    {
      'name': 'Distressed Value Assets Portfolio',
      'description': 'We seek to find value in distress value Assets that have been ignored by the market...',
      'image': 'assets/banner/dandelion.jpg',
      'content': 'We hold 12 positions across 5 sectors. We are bullish on oil. Since mid 2020, oil has performed better than most sectors. The reason we decided to get exposure on oil is because the sectore has been distressed for a long duration and multiple oil companies have experienced bankruptcy. The bankruptcy was accelerated by the closure/shut down due to COVID-19. During this period, we decide to seek exposure on good oil related businesses since only resilient/good companies are posed to survive and be operational.'
    },{
      'name': 'Emerging Macro Trends Portfolio',
      'description': 'We seek to gain exposure to potential future disruptors. Especially in technology, finance, transportation, pharmacy and bio-tech...',
      'image': 'assets/banner/banner_image.jpg',
      'content': 'Crypto currency is themed the future of finance. Removing the middleman through decentralization and public ledgers. For us it\'s another asset to grow our fund. Risky for sure, but what is risk? ? We have seen multiple euphoric booms and bursts in a short space of time since inception. After the Tulip like euphoria that ended in a burst in 2018, we decided to acquire a portfolio of cryptocurrencies and held them. The wait was painful, and we doubted ourselves nonstop since it\'s a new asset,so survival is not guaranteed. Recently they have done well growing at a 7x multiple.'
    },{
      'name': 'Defensive Investment Portfolio',
      'description': 'We seek to gain alpha on the Dow Jones index through the selection of only the strong companies...',
      'image': 'assets/banner/lights.jpg',
      'content': 'Our first 100% systematic investment approach is the popular trend following. We use trend following rules to identify stocks/assets to build our defensive portfolio. Our current exposure and the portfolio have been averaging 1.8% growth returns monthly with lowest maximum drawdown compare to our Buy & Hold Index.'
    },{
      'name': 'Risk Premium Portfolio',
      'description': 'We seek to gain alpha through harvesting risk premium through employing the VIX and the SnP 500...',
      'image': 'assets/banner/sunset.jpg',
      'content': 'We harvest the S&P 500 Volatility premium systematically. Our approach makes use of the CBOE Volatility index (VIX) (the fear gauge) and the S&P 500 index to determine to go long/short on volatility. We employ ETF\'s (VXX and SVXY) to express our view on volatility premium. This approach does great during high volatile periods (per our backtest) thus a great strategy to hedge our fund during crises periods or irrational fear.'
    },{
      'name': 'Industrial Sector Rotation Portfolio',
      'description': 'We seek to gain exposure to the industrial sector that is in current Economic view...',
      'image': 'assets/banner/guy.jpg',
      'content': 'Consumer spending is highly correlated to the business cycle. Therefore, we have designed this systematic portfolio to take advantage of this shift in consumer spending. This systematic investment portfolio ranks, selects and invest in Industrial Sector with low volatility. If none of the sectors are selected especially during a bear market, the capital is fully invested in USA government treasuries (tactical asset allocation). This portfolio is expose to only the main American industrial sectors, which are: Consumer Discretionary, Financials, Technology, Health Care, Communications, Utilities Consumer Staples, Real Estate, Materials, Industrial and Energy.'
    },{
      'name': 'All Weather Portfolio',
      'description': 'We seek to preserve cash buying power Against inflation as we wait for buying opportunity...',
      'image': 'assets/banner/dandelion.jpg',
      'content': 'The main aim of this strategy is preservation of funds/cash. it is not designed to beat the market but inflation. Since it is exposed to both the stock market and the USA Government bonds, the returns are the average of both. The funds are reserved opportunities the market presents now and again. IEF, SPY and Cash are the dominant assets in this portfolio.'
    },{
      'name': 'Multi Currency Portfolio',
      'description': 'We seek exposure to currency Exchange rate market and capture macro trends...',
      'image': 'assets/banner/banner_image.jpg',
      'content': 'We have developed a Long/Short proprietary systematic currency momentum investment strategy. We only buy or sell currency that have the potential to gain in returns in the nearest future. This strategy proved to be able to harvest the COVID driven momentum in March and April 2020. We decided to pause the strategy and reformulate it, back-test and conduct optimization to take advantage of persistent low volatile periods in the market.'
    },{
      'name': 'Dividend Legacy Portfolio',
      'description': 'Coming soon...',
    },{
      'name': 'Southern African Portfolio',
      'description': 'Coming soon...'
    }
  ];

  final List teamList = [
    {
      'name': 'Mr Samkeliso Mpendulo Dlamini',
      'position': 'Founder and CEO, Investment Strategist',
      'qualification': 'BSc in Science, Masters in Medicinal Chemistry and PhD Candidate Medicinal Chemistry',
      'image': 'assets/banner/user.png',
      'linked': 'assets/banner/linkedin.png'
    },{
      'name': 'Mr Fanelesibonge Phiwokuhle Malaza',
      'position': 'Programmer, Architecture and Data Scientist Manager',
      'qualification': 'BSc Science in Physics and Computer Science',
      'image': 'assets/banner/user.png',
      'linked': 'assets/banner/linkedin.png'
    },{
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: createWebView(context)
      ),
    );
  }

  Widget createStrategyCard(BuildContext context, String name, String description, String image, String content){
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      child: Card(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize:MainAxisSize.min,
            children: [
              SizedBox(height: 12.0),
              Container(
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Trebuchet MS',
                    fontWeight: FontWeight.w700,
                    fontSize: 19,
                  ),
                ),
              ),
              SizedBox(height: 12.0),
              image != null ? Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 220,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ) : Container(),
              Padding(
                padding: EdgeInsets.only(
                  top: 5,
                  left: 7,
                ),
                child: Text(
                  description,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Trebuchet MS',
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 13.0),
              image != null ?MaterialButton(
                onPressed: () => displayDialog(context, name, content),
                child: Text('Learn More', style: TextStyle(fontFamily: 'Trebuchet MS',),),
                textColor: Color(0xffffffff),
                color: Colors.lightBlue,
                shape: StadiumBorder(),
                elevation: 5,
                padding: const EdgeInsets.only(
                  top: 15.0,
                  bottom: 15.0,
                  right: 30.0,
                  left: 30.0,
                ),
              ) : Container(),
              image != null ? SizedBox(height: 15.0,) : Container(),
            ]
        ),
      ),
    );
  }

  Widget createTeamMemberCard(BuildContext context, String name, String position, String qualification, String image){
    return Container(
      padding: EdgeInsets.all(20.0),
      width: MediaQuery.of(context).size.width * 0.3,
      child: Card(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Theme(
                    data: Theme.of(context).copyWith(
                      scaffoldBackgroundColor: Colors.white,
                      accentColor: Colors.white,
                    ),
                    child: Builder(
                      builder: (context) => Scaffold(
                        appBar: AppBar(
                          title: Text(name, style: TextStyle(fontFamily:'Trebuchet MS'),),
                          backgroundColor: Colors.black,
                        ),
                        body: SafeArea(
                          child: Center(
                            child: Hero(
                              tag: name+'profile_image',
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 0.5,
                                child: Image.asset(image, height: 100),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
                child: Hero(
                  tag: name+'profile_image',
                  child: Image.asset(image, fit: BoxFit.contain,),
                ),
              ),
              SizedBox(height: 7.0),
              ListTile(
                title: Text(name,style:TextStyle(fontFamily: 'Trebuchet MS'),),
                subtitle: Text('Name', style:TextStyle(fontFamily: 'Trebuchet MS',fontWeight: FontWeight.w300) ,),
              ),
              ListTile(
                title: Text(position,style:TextStyle(fontFamily: 'Trebuchet MS'),),
                subtitle: Text('Position', style:TextStyle(fontFamily: 'Trebuchet MS',fontWeight: FontWeight.w300) ,),
              ),
            ]
        ),
      ),
    );
  }

  Widget createWebView(BuildContext context){
    return Scrollbar(isAlwaysShown: true, child: ListView(
      shrinkWrap: true,
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
                  top: 95,
                  left: 60,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      'SMD Capital is a data driven investment hedge fund. We employ proprietary models to capture returns',
                      style: TextStyle(
                        fontFamily: 'Trebuchet MS',
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
                      ),
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
                    top: 95,
                    left: 60,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        'Our legacy investment strategies are non correlated and capitalize on Macro themes, Volatility, Distressed Assets, Risk Premium, Sector Rotation, Value and Growth',
                        style: TextStyle(
                          fontFamily: 'Trebuchet MS',
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 40,
                        ),
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
                  top: 95,
                  left: 60,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      'Our mission is to protect wealth and a gradual organic growth of assets, leveraging compound interest',
                      style: TextStyle(
                        fontFamily: 'Trebuchet MS',
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
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
                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop)
                    ),
                  ),
                ),
                Container(color: Color.fromRGBO(0, 0, 0, 0.3)),
                Positioned(
                  top: 95,
                  left: 60,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      'Our Foundation is INTEGRITY \nOur Strength is our PEOPLE \nOur Style is TEAMWORK \nOur Goal is EXCELLENCE',
                      style: TextStyle(
                        fontFamily: 'Trebuchet MS',
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
                      ),
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
                    top: 95,
                    left: 60,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        'We have skin in the game. We own a larger percentage of all the portfolio\'s',
                        style: TextStyle(
                          fontFamily: 'Trebuchet MS',
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 40,
                        ),
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

        Container(
          decoration: BoxDecoration(
            color: Colors.lightBlue,
          ),
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.only(
              top: 20.0,
              bottom: 20.0,
            ),
            child: Text(
              '\"Strategy is the art of creating value.\"',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Trebuchet MS',
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 27,
              ),
            ),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            createStrategyCard(context, strategistsList[0]['name'], strategistsList[0]['description'], strategistsList[0]['image'], strategistsList[0]['content']),
            SizedBox(width: MediaQuery.of(context).size.width * 0.04),
            createStrategyCard(context, strategistsList[1]['name'], strategistsList[1]['description'], strategistsList[1]['image'], strategistsList[1]['content']),
            SizedBox(width: MediaQuery.of(context).size.width * 0.04),
            createStrategyCard(context, strategistsList[2]['name'], strategistsList[2]['description'], strategistsList[2]['image'], strategistsList[2]['content']),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            createStrategyCard(context, strategistsList[3]['name'], strategistsList[3]['description'], strategistsList[3]['image'], strategistsList[3]['content']),
            SizedBox(width: MediaQuery.of(context).size.width * 0.04),
            createStrategyCard(context, strategistsList[4]['name'], strategistsList[4]['description'], strategistsList[4]['image'], strategistsList[4]['content']),
            SizedBox(width: MediaQuery.of(context).size.width * 0.04),
            createStrategyCard(context, strategistsList[5]['name'], strategistsList[5]['description'], strategistsList[5]['image'], strategistsList[5]['content']),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            createStrategyCard(context, strategistsList[6]['name'], strategistsList[6]['description'], strategistsList[6]['image'], strategistsList[6]['content']),
            SizedBox(width: MediaQuery.of(context).size.width * 0.04),
            createStrategyCard(context, strategistsList[7]['name'], strategistsList[7]['description'], null, null),
            SizedBox(width: MediaQuery.of(context).size.width * 0.04),
            createStrategyCard(context, strategistsList[8]['name'], strategistsList[7]['description'], null, null),
          ],
        ),

        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          color: Colors.black12,
          padding: EdgeInsets.only(
            top: 10,
            bottom: 10,
            right: MediaQuery.of(context).size.width * 0.2,
            left: MediaQuery.of(context).size.width*0.2,
          ),
          child: Text(
            'KUA Capital Investments Net Returns  1st March 2020 through 30th March 2021',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Trebuchet MS',
              color: Colors.black,
              fontSize: 35,
            ),
          ),
        ),

        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: 200,
          color: Colors.black12,
          child: Hero(
            tag: 'net_returns',
            child: MaterialButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) => Theme(
                  data: Theme.of(context).copyWith(
                    scaffoldBackgroundColor: Colors.black,
                    accentColor: Colors.white,
                  ),
                  child: Builder(
                    builder: (context) => Scaffold(
                      appBar: AppBar(
                        title: Text('Net Returns (01/03/2020 - 31/03/2021)', style:TextStyle(fontFamily:'Trebuchet MS',color:Colors.white),),
                        backgroundColor: Colors.black,
                      ),
                      body: SafeArea(
                        child: Hero(
                          tag: 'net_returns',
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: Image.asset('assets/banner/table1.jpg', fit: BoxFit.contain),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )),
              child: Image.asset('assets/banner/table1.jpg', fit: BoxFit.contain,height:MediaQuery.of(context).size.height),
            ),
          ),
        ),

        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Text(
            '\"Opportunities come infrequently. When it rains gold, put out the bucket, not the thimble\" \n~Warren Buffet',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Trebuchet MS',
              color: Colors.black,
              fontStyle: FontStyle.italic,
              fontSize: 27,
              fontWeight: FontWeight.w700,
            ),
          ),
          padding: const EdgeInsets.all(15.0),
        ),

        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(12.0),
          child: Text(
            'Investment Philosophy and Process',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Trebuchet MS',
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 35,
            ),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(5.0),
              ),
              margin: EdgeInsets.all(12.0),
              padding: EdgeInsets.all(15.0),
              child: Text(
                'We have removed the guess work with our systematic data driven proprietary models for top/down, bottom/up market research.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Trebuchet MS',
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),

            Icon(Icons.arrow_forward, color: Colors.black, size: 60.0),

            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(5.0),
              ),
              margin: EdgeInsets.all(12.0),
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Our portfolio construction process emphasizes on wealth preservation through systematic risk quantification and management.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Trebuchet MS',
                    color: Colors.white,
                    fontSize: 25
                ),
              ),
            ),

            Icon(Icons.arrow_forward, color: Colors.black, size: 60.0),

            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(5.0),
              ),
              margin: EdgeInsets.all(12.0),
              padding: EdgeInsets.all(15.0),
              child: Text(
                'We keep our investors fully informed monthly about the status of the market, expectation and mitigation measures, especially in the case of irrational market fear.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Trebuchet MS',
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),

        Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Our Team',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Trebuchet MS',
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontSize: 38,
              ),
            )
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            createTeamMemberCard(context, teamList[0]['name'], teamList[0]['position'], teamList[0]['qualification'], teamList[0]['image']),
            createTeamMemberCard(context, teamList[2]['name'], teamList[2]['position'], teamList[2]['qualification'], teamList[2]['image']),
            createTeamMemberCard(context, teamList[1]['name'], teamList[1]['position'], teamList[1]['qualification'], teamList[1]['image']),
          ],
        ),

        Container(
          color: Colors.black12,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(12.0),
          child: ListTile(
              title: Text(
                'Contact Us',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Trebuchet MS',
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                ),
              )
          ),
        ),

        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 70,
                      margin: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        controller: name,
                        style: TextStyle(
                          fontFamily: 'Trebuchet MS',
                          color: Colors.black,
                        ),
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          hintStyle: TextStyle(
                            fontFamily: 'Trebuchet MS',
                            color: Colors.lightBlue,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.0, color: Colors.lightBlue),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.0, color: Colors.lightBlue),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 70,
                      margin: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        controller: email,
                        style: TextStyle(
                          fontFamily: 'Trebuchet MS',
                          color: Colors.black,
                        ),
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            fontFamily: 'Trebuchet MS',
                            color: Colors.lightBlue,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.0, color: Colors.lightBlue),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.0, color: Colors.lightBlue),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                    ),
                  ]
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                margin: const EdgeInsets.all(15.0),
                padding: EdgeInsets.all(15.0),
                child: TextFormField(
                  maxLines: 10,
                  controller: message,
                  style: TextStyle(
                    fontFamily: 'Trebuchet MS',
                    color: Colors.black,
                  ),
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Message',
                    hintStyle: TextStyle(
                      fontFamily: 'Trebuchet MS',
                      color: Colors.lightBlue,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.0, color: Colors.lightBlue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.0, color: Colors.lightBlue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25,),
              MaterialButton(
                onPressed: () => displayDialog(context, 'Attention', 'Coming soon...'),
                child: Text('Send Message', style:TextStyle(fontFamily: 'Trebuchet Ms', color: Colors.white,),),
                shape: StadiumBorder(),
                color: Colors.lightBlue,
                padding: EdgeInsets.all(20),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ],
    ));
  }

  Future displayDialog(BuildContext context, String name, String content){
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(name, textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Trebuchet MS', color: Colors.black,)),
        content: Text(content),
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