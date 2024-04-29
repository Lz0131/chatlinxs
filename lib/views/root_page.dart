import 'package:chatlinxs/views/settings_page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:hidable/hidable.dart';
import 'package:line_icons/line_icons.dart';
import 'package:chatlinxs/helper/size_config.dart';
import 'package:chatlinxs/views/call_phone/call_page.dart';
import 'package:chatlinxs/contants/Colors_contants.dart';
import 'package:chatlinxs/contants/person.dart';
import 'package:chatlinxs/views/home_page/home_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int selectedIndex = 1;
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    print(SizeConfig.cntxt);
    return Scaffold(
      backgroundColor: backgroundColor(context, invert: true),
      body: getBody(),
      bottomNavigationBar: Hidable(
        child: bottomNavigationBar(),
        controller: scrollController,
      ),
    );
  }

  Widget getBody() {
    switch (selectedIndex) {
      case 0:
        return CallPage(
          scrollController: scrollController,
        );
      case 1:
        return HomePage(
          scrollController: scrollController,
        );
      case 2:
        return UserPage(
          scrollController: scrollController,
        );
      default:
        return HomePage(
          scrollController: scrollController,
        );
    }
  }

  Widget bottomNavigationBar() {
    return CustomNavigationBar(
      iconSize: 30.0,
      selectedColor: Colors.white,
      strokeColor: Colors.white,
      unSelectedColor: const Color(0xff6c788a),
      backgroundColor: backgroundColor(context),
      items: [
        CustomNavigationBarItem(
          icon: Icon(
            LineIcons.phone,
            size: 30,
          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(
            LineIcons.sms,
            size: 30,
          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(
            LineIcons.user,
            size: 30,
          ),
        ),
      ],
      currentIndex: selectedIndex,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
    );
  }
}
