import 'package:flutter/material.dart';
import 'package:shopnew/utilites/screenconfigration.dart';
import './on_boarding_model.dart';

ScreenConfig screenConfig;
Widgetsize widgetsize;


class SingleScreen extends StatelessWidget {
  @override
  final OnBoardingModel onBoardingModel;

  SingleScreen(this.onBoardingModel);

  Widget build(BuildContext context) {
    screenConfig = ScreenConfig(context);
    widgetsize = Widgetsize(screenConfig);
    var screenHeight = MediaQuery.of(context).size.height;
    return Transform.translate(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: SizedBox(
              height:screenHeight /2.6,
//          width: screenWidth /1.1,

                child: Image(
                  image: ExactAssetImage(onBoardingModel.image),
                  fit: BoxFit.cover,

                )),
          ),
          Text(
            onBoardingModel.title,
            style: TextStyle(fontSize: widgetsize.titleFontSize, color: Colors.white,fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              onBoardingModel.description,
              style: TextStyle(fontSize: widgetsize.descriptionFontSize , color: Colors.white70,height:1.3),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ), offset: Offset(0, -screenHeight*.06),
    );
  }
}
