import 'package:flutter/material.dart';

class PrinciplesPage extends StatelessWidget{

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
              title: Text('Principle & Culture', style: TextStyle(fontFamily: 'Trebuchet MS', fontWeight: FontWeight.w600)),
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
                        margin: EdgeInsets.all(10.0),
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          'At SMD Global Investment we have two criteria that enable us to align our objectives with those of our client. A high-water mark provision, meaning we only charge fees after outperforming our highest historic returns performance. We also put emphasis on performance-based compensation meaning we only charge performance fees only when we deliver positive returns. With this we avoid conflict of interest, maintain respect and integrity for our partners and investors.',
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