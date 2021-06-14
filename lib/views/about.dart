  import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Theme(
      data: Theme.of(context).copyWith(
        scaffoldBackgroundColor: Colors.white,
        accentColor: Colors.white,
      ),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
              title: Text('About Us', style: TextStyle(fontFamily: 'Trebuchet MS', fontWeight: FontWeight.w600)),
              backgroundColor: Color(0xffd22b2b)
          ),
          drawer: Drawer(
            child: ListView(
                children: [
                  MaterialButton(
                    child: Text('Home'),
                    color: Colors.white,
                    textColor: Colors.black,
                    onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
                    padding: EdgeInsets.all(35.0),
                  ),
                  MaterialButton(
                    child: Text('About Us'),
                    color: Colors.white,
                    textColor: Colors.black,
                    onPressed: () => Navigator.pushReplacementNamed(context, '/about'),
                    padding: EdgeInsets.all(35.0),
                  ),
                  MaterialButton(
                    child: Text('Principles & Culture'),
                    color: Colors.white,
                    textColor: Colors.black,
                    onPressed: () => Navigator.pushReplacementNamed(context, '/principles'),
                    padding: EdgeInsets.all(35.0),
                  ),
                ]
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/banner/banner_image.jpg'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        padding: EdgeInsets.all(15.0),
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          'Incorporated in Swaziland but with footprints in Africa and globally. At SMD Global Investment our core market approach is systemic with a business owner mindset with zero tolerance to stock price addiction. We value business according to their earnings, dividends, competitiveness(moats) and their future value creation (either through expansion or innovation). We believe in the concept of compounding wealth gradually through acquisition of high-quality low risk assets with a big margin of safety. We apply thoroughly tested principles using robust data driven quantitative analysis. As a Hedge fund we seek exposure to quality distressed assets,Emerging trends, emerging markets, macro trends, risk parity, volatility risk premium,sector rotation, trend following and exchange rates. We are data driven in formulating our market investment strategies and cash deployment. We have skin in the game, our interest is aligned with those of our clients. We make money when they do and share a larger portion of the downside. This makes use excellent stewards to our client’s wealth.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Trebuchet MS',
                            fontSize: 25,
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                    ]
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}