import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopnew/screen/home_page.dart';
import 'package:shopnew/utilites/screenconfigration.dart';
import './on_boarding_model.dart';
import './on_boarding_single_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

ScreenConfig screenConfig;
Widgetsize widgetsize;

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool lastPage = false;
  int currentPage = 0;
  PageController _pageController;
  OnBoardingModel onBoardingModel;
  List<OnBoardingModel> screen = [
    OnBoardingModel(
        image: 'assets/images/onboarding0.png',
        title: 'wellcomes',
        description:
            'con to see what are we doingcon to see what are we doingcon to see what are we doing'),
    OnBoardingModel(
        image: 'assets/images/onboarding1.png',
        title: 'wellcomes',
        description: 'con to see what are we doing'),
    OnBoardingModel(
        image: 'assets/images/onboarding2.png',
        title: 'wellcomes',
        description: 'con to see what are we doing'),
    OnBoardingModel(
        image: 'assets/images/onboarding3.png',
        title: 'wellcomes',
        description: 'con to see what are we doing'),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var ScreenWidth = MediaQuery.of(context).size.width;
    var ScreenHeight = MediaQuery.of(context).size.height;
    screenConfig = ScreenConfig(context);
    widgetsize = Widgetsize(screenConfig);
    return Scaffold(
      body: Container(
        width: ScreenWidth,
        height: ScreenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.4, 0.7, 0.9],
            colors: [
              Color(0xFF3594DD),
              Color(0xFF4563DB),
              Color(0xFF5036D5),
              Color(0xFF5B16D0),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SafeArea(
              child: Container(
                width: double.infinity,
                  child: FlatButton(
                      onPressed: () async {
                        var pref = await SharedPreferences.getInstance();
                        pref.setBool('isSeen', true);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return HomePage();
                        }));
                        print('xxxxx');
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: widgetsize.titleFontSize),
                      ))),
            ),
            Expanded(
              child: Container(
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  itemBuilder: (BuildContext context, int index) {
                    return SingleScreen(screen[index]);
                  },
                  itemCount: screen.length,
                  onPageChanged: (int index) {
                    setState(() {
                      currentPage = index;
                      if (currentPage == (screen.length - 1)) {
                        lastPage = true;
                      } else
                        lastPage = false;
                    });
                  },
                ),
              ),
            ),
            Transform.translate(
              child: Container(
                alignment: Alignment.center,
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: screen.length,
                  effect: ExpandingDotsEffect(
                    expansionFactor: (widgetsize.screenDotsHeight + 1.5) -
                        widgetsize.screenDotsHeight,
                    dotHeight: widgetsize.screenDotsHeight,
                    spacing: 6,
                    activeDotColor: Colors.white,
                    dotWidth: widgetsize.screenDotsWeight,
                    dotColor: Colors.blue,
                  ),
                ),
              ),
              offset: Offset(ScreenWidth * .0, -ScreenHeight * .07),
            ),
            (lastPage)
                ? SizedBox(
                    width: widgetsize.bottomWidth,
                    height: widgetsize.bottomHeight,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        color: Color(0xffffc700),
                        onPressed: () async {
                          var pref = await SharedPreferences.getInstance();
                          pref.setBool('isSeen', true);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return HomePage();
                          }));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('START'),
                            Icon(Icons.arrow_forward)
                          ],
                        )))
                : Container(),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
