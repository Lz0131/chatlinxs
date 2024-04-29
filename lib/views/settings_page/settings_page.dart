import 'package:chatlinxs/contants/Colors_contants.dart';
import 'package:chatlinxs/contants/person.dart';
import 'package:chatlinxs/models/user.dart';
import 'package:chatlinxs/views/home_page/home_widgets.dart';
import 'package:chatlinxs/views/settings_page/settings_widgets.dart';
import 'package:chatlinxs/widgets/common_widgets.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:line_icons/line_icons.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key, required this.scrollController}) : super(key: key);

  final ScrollController scrollController;

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  bool isSearch = false;
  bool toggle = true;
  User? user;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor(context),
        body: SafeArea(
            child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 35,
              ),
              profileWidget(
                  image: user?.picture ?? "",
                  name: "Yash Makan",
                  onLogoutClick: () {
                    showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return Container(
                            margin: const EdgeInsets.only(
                                left: 25, right: 25, bottom: 70),
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            decoration: BoxDecoration(
                                color: context.isDarkMode()
                                    ? Colors.black26
                                    : Colors.white,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Quieres cerrar sesión?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: blackColor(context).darkShade,
                                      fontSize: 19),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                ButtonBar(
                                  buttonPadding: EdgeInsets.zero,
                                  alignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    ElevatedButton(
                                      child: const Text(
                                        'Si, cerrar sesión!',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      style: ButtonStyle(
                                          fixedSize: MaterialStateProperty.all(
                                              const Size(200, 30)),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  greenColor)),
                                      onPressed: () {},
                                    ),
                                    ElevatedButton(
                                      child: const Text('Cancelar',
                                          style: TextStyle(color: greenColor)),
                                      style: ButtonStyle(
                                          fixedSize: MaterialStateProperty.all(
                                              const Size(200, 30)),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  backgroundColor(context)),
                                          side: MaterialStateProperty.all(
                                              const BorderSide(
                                                  color: greenColor))),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  onTap: () {}),
              const SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 0.3,
                indent: 100,
                endIndent: 100,
                color: grayColor(context).darkShade.withOpacity(0.6),
              ),
              const SizedBox(
                height: 10,
              ),
              settingTile(
                  title: "Notificaciones",
                  settingTrailing: SettingTrailing.toggle,
                  onToggle: (value) {
                    setState(() {
                      toggle = value;
                    });
                  },
                  toggle: toggle,
                  iconData: LineIcons.bell),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22.0, bottom: 10),
                child: Row(
                  children: [
                    Text(
                      "ADMINISTRAR",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: grayColor(context).lightShade),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  settingTile(
                      title: "Ajustes",
                      settingTrailing: SettingTrailing.arrow,
                      iconData: LineIcons.cog),
                  settingTile(
                      title: "Compartir",
                      settingTrailing: SettingTrailing.arrow,
                      iconData: LineIcons.share),
                  settingTile(
                      title: "Actualizar contraseña",
                      settingTrailing: SettingTrailing.arrow,
                      iconData: LineIcons.lock),
                  settingTile(
                      title: "Preguntas frecuentes",
                      settingTrailing: SettingTrailing.arrow,
                      iconData: Icons.question_answer_outlined),
                  settingTile(
                      title: "Ayuda",
                      settingTrailing: SettingTrailing.arrow,
                      iconData: Icons.help_outline),
                  settingTile(
                      title: "Invitar a un amigo",
                      settingTrailing: SettingTrailing.arrow,
                      iconData: LineIcons.users),
                ],
              ),
              Expanded(
                  child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'from',
                      style: TextStyle(
                          color: grayColor(context).lightShade.withOpacity(0.8),
                          fontSize: 13),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          LineIcons.laptopCode,
                          size: 24,
                          color: greenColor,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "ITC",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: backgroundColor(context, invert: true)),
                        )
                      ],
                    )
                  ],
                ),
              ))
            ],
          ),
        )));
  }
}
