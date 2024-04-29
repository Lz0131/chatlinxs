import 'package:chatlinxs/contants/Colors_contants.dart';
import 'package:chatlinxs/helper/size_config.dart';
import 'package:chatlinxs/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 200.0,
                    width: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GradientText(
                  "ChatLinxs",
                  style: const TextStyle(
                    fontSize: 28,
                  ),
                  gradient: LinearGradient(colors: [
                    greenGradient.lightShade,
                    greenGradient.darkShade,
                  ]),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'from',
                style: TextStyle(
                    color: grayColor(context).lightShade.withOpacity(0.4),
                    fontSize: 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    LineIcons.laptopCode,
                    size: 32,
                    color: greenColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "ITC",
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w800,
                        color: grayColor(context).lightShade),
                  )
                ],
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.12,
              )
            ],
          )
        ],
      ),
    );
  }
}
