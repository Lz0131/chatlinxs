import 'dart:async';
import 'dart:math';
import 'package:chatlinxs/contants/Colors_contants.dart';
import 'package:chatlinxs/helper/size_config.dart';
import 'package:chatlinxs/views/root_page.dart';
import 'package:chatlinxs/widgets/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  double top = 0, left = 0;
  late Timer timer;
  late PageController pageController;
  int selectedPageIndex = 0;
  bool showForm = false;
  bool onOTPage = false;

  OnBoardingPageModel get page => pages[selectedPageIndex];

  List<OnBoardingPageModel> pages = [
    OnBoardingPageModel(
        "https://cdn-icons-png.flaticon.com/512/2103/2103620.png",
        "Conectate con tus\nCompañeros",
        "Para facilitar la comunicación y organización entre alumnos y profesores."),
    OnBoardingPageModel(
        "https://cdn-icons-png.flaticon.com/512/77/77087.png",
        "Seguridad\ny Privacidad",
        "Priorizamos tu seguridad y privacidad. Conversaciones protegidas con altos estándares."),
    OnBoardingPageModel(
        "https://cdn-icons-png.flaticon.com/512/1189/1189175.png",
        "Comparte con tus\nCompañeros",
        "¡Comparte tus momentos al instante. ¡Expresa y conecta fácilmente!"),
  ];

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    startFloatingAnimation();
    pageController = PageController(initialPage: selectedPageIndex);
    super.initState();
  }

  startFloatingAnimation() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      int threshold = 20;
      top = Random().nextInt(threshold).toDouble(); // 0-20
      left = Random().nextInt(threshold).toDouble(); // 0-20
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          showForm
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: onOTPage
                              ? SizeConfig.screenHeight * 0.15
                              : SizeConfig.screenHeight * 0.05,
                        ),
                        onOTPage
                            ? Lottie.asset("assets/lock.json",
                                height: 150.0, width: 150, repeat: false)
                            : ShaderMask(
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (bounds) => LinearGradient(
                                    colors: [
                                      greenGradient.darkShade,
                                      greenGradient.lightShade
                                    ]).createShader(
                                  Rect.fromLTWH(
                                      0, 0, bounds.width, bounds.height),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Lottie.asset("assets/wave.json",
                                      height: 300.0, repeat: false),
                                ),
                              ),
                      ],
                    ),
                  ],
                )
              : const SizedBox(),
          showForm
              ? SizedBox(
                  width: SizeConfig.screenWidth,
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GradientText(
                            onOTPage ? "Enter the OTP" : "Bienvenido!",
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                            gradient: LinearGradient(colors: [
                              greenGradient.lightShade,
                              greenGradient.darkShade,
                            ]),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              : const SizedBox(),
          Column(
            children: [
              !showForm
                  ? Expanded(
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (value) {},
                        itemCount: pages.length,
                        controller: pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          OnBoardingPageModel page = pages[index];
                          return Column(
                            children: [
                              SizedBox(height: SizeConfig.screenHeight * 0.3),
                              AnimatedPadding(
                                  padding:
                                      EdgeInsets.only(top: top, left: left),
                                  duration: const Duration(seconds: 1),
                                  child: ShaderMask(
                                    blendMode: BlendMode.srcATop,
                                    shaderCallback: (Rect bounds) {
                                      return LinearGradient(colors: [
                                        greenGradient.lightShade,
                                        greenGradient.darkShade,
                                      ]).createShader(bounds);
                                    },
                                    child: Image.network(
                                      page.image,
                                      width: 100,
                                    ),
                                  ))
                            ],
                          );
                        },
                      ),
                    )
                  : const SizedBox(),
//              showForm
//                  ? SizedBox(
//                      width: SizeConfig.screenWidth,
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: [
//                          SizedBox(
//                            height: SizeConfig.screenHeight -
//                                SizeConfig.screenHeight * 0.35,
//                            child: Column(
//                              mainAxisAlignment: MainAxisAlignment.center,
//                              children: [
//                                const SizedBox(
//                                  height: 10,
//                                ),
//                                ClipRRect(
//                                  borderRadius: BorderRadius.circular(8.0),
//                                  child: Image.asset(
//                                    "assets/images/logo.png",
//                                    height: 80.0,
//                                    width: 80.0,
//                                    fit: BoxFit.cover,
//                                  ),
//                                ),
//                                const SizedBox(
//                                  height: 10,
//                                ),
//                                GradientText(
//                                  "WhatsApp",
//                                  style: const TextStyle(
//                                    fontSize: 18,
//                                  ),
//                                  gradient: LinearGradient(colors: [
//                                    greenGradient.lightShade,
//                                    greenGradient.darkShade,
//                                  ]),
//                                ),
//                              ],
//                            ),
//                          ),
//                        ],
//                      ),
//                    )
//                  : const SizedBox()
            ],
          ),
          Align(
            alignment: const Alignment(0, 0.7),
            child: AnimatedContainer(
              curve: Curves.fastLinearToSlowEaseIn,
              duration: const Duration(milliseconds: 800),
              width: SizeConfig.screenWidth * 0.9,
              height: showForm
                  ? SizeConfig.screenHeight * 0.5
                  : SizeConfig.screenHeight * 0.43,
              child: Card(
                elevation: 3,
                child: !showForm
                    ? Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            page.heading,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 9.0, vertical: 16),
                            child: Text(
                              page.text,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (selectedPageIndex != 0) {
                                      if (pages.length - 1 ==
                                          selectedPageIndex) {
                                        selectedPageIndex = 0;
                                        showForm = false;
                                        setState(() {});
                                      } else {
                                        setState(() {});
                                        pageController.animateToPage(
                                            selectedPageIndex - 1,
                                            curve:
                                                Curves.fastLinearToSlowEaseIn,
                                            duration:
                                                const Duration(seconds: 2));
                                        selectedPageIndex--;
                                      }
                                    }
                                  },
                                  child: gradientIconButton(
                                      size: 40,
                                      iconData: LineIcons.arrowLeft,
                                      isEnabled: selectedPageIndex != 0),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (selectedPageIndex != pages.length) {
                                      if (pages.length - 1 ==
                                          selectedPageIndex) {
                                        showForm = true;
                                        setState(() {});
                                      } else {
                                        setState(() {});
                                        pageController.animateToPage(
                                            selectedPageIndex + 1,
                                            curve:
                                                Curves.fastLinearToSlowEaseIn,
                                            duration:
                                                const Duration(seconds: 2));
                                        selectedPageIndex++;
                                      }
                                    }
                                  },
                                  child: gradientIconButton(
                                      size: 40, iconData: LineIcons.arrowRight),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    : !onOTPage
                        ? Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              if (onOTPage) {
                                                onOTPage = false;
                                              } else if (showForm) {
                                                showForm = false;
                                                selectedPageIndex = 0;
                                              }
                                              setState(() {});
                                            },
                                            icon: const Icon(
                                                LineIcons.arrowLeft)),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        const Text(
                                          "Iniciar Sesión",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        const Text(
                                          "Hola, configuremos todo.",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      child: Row(
                                        children: const [
                                          CircleAvatar(
                                            radius: 16.0,
                                            backgroundImage: NetworkImage(
                                                "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Flag_of_Mexico.svg/1200px-Flag_of_Mexico.svg.png"),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black54,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: const [
                                          Text(
                                            "Numero de telefono",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Container(
                                        padding: EdgeInsets.zero,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                            border: Border.all(
                                                color: Colors.black38,
                                                width: 1.5)),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: SizedBox(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: const [
                                                    CircleAvatar(
                                                      radius: 14.0,
                                                      backgroundImage: NetworkImage(
                                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Flag_of_Mexico.svg/1200px-Flag_of_Mexico.svg.png"),
                                                    ),
                                                    Icon(
                                                      Icons.arrow_drop_down,
                                                      color: Colors.black45,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4, right: 8),
                                              child: Container(
                                                width: 1.5,
                                                height: 46,
                                                color: Colors.black38,
                                              ),
                                            ),
                                            const Flexible(
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    disabledBorder:
                                                        InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                    hintStyle: TextStyle(
                                                        color: Colors.black38),
                                                    hintText:
                                                        "Numero de telefono"),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(4)),
                                      gradient: LinearGradient(colors: [
                                        greenGradient.darkShade,
                                        greenGradient.lightShade,
                                      ])),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        onOTPage = true;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    child: Container(
                                      height: 45.0,
                                      padding: EdgeInsets.zero,
                                      alignment: Alignment.center,
                                      child: const Text(
                                        "Iniciar",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              if (onOTPage) {
                                                onOTPage = false;
                                              } else if (showForm) {
                                                showForm = false;
                                                selectedPageIndex = 0;
                                              }
                                              setState(() {});
                                            },
                                            icon: const Icon(
                                                LineIcons.arrowLeft)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    const Text(
                                      "Codigo de verificación",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const Text(
                                      "Hemos enviado el código de verificación a\nTu número de telefono",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "+524611234567",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          gradientIconButton(
                                              size: 30,
                                              iconData: Icons.edit_outlined,
                                              iconSize: 15)
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: List.generate(
                                              4,
                                              (index) => Container(
                                                    width: 45,
                                                    height: 45,
                                                    decoration:
                                                        const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Color(
                                                                0xFFF8F7FB)),
                                                  )),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(4)),
                                      gradient: LinearGradient(colors: [
                                        greenGradient.darkShade,
                                        greenGradient.lightShade,
                                      ])),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                  const RootPage()));
//                                      Navigator.of(context).push(CupertinoPageRoute(
//                                          builder: (context) => const ProfilePage()));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    child: Container(
                                      height: 45.0,
                                      padding: EdgeInsets.zero,
                                      alignment: Alignment.center,
                                      child: const Text(
                                        "Submit",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class OnBoardingPageModel {
  final String image;
  final String heading;
  final String text;

  OnBoardingPageModel(this.image, this.heading, this.text);
}
