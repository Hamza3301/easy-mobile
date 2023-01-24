import 'package:easymobile/Constants/colors.dart';
import 'package:easymobile/Provider/authProvider.dart';
import 'package:easymobile/Screens/Profile/profile_screen.dart';
import 'package:easymobile/Widgets/app_bar.dart';
import 'package:easymobile/Widgets/list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer<AuthProvider>(
      builder: (context, value, child) => Scaffold(
          appBar: appBar(title: "Settings"),
          body: SingleChildScrollView(
            child: Column(
              children: [
                settingTile(
                    icon: CupertinoIcons.person_crop_circle,
                    title: "My Profile",
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const ProfileScreen(),
                        withNavBar: false,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    }),
                settingTile(
                    icon: Icons.policy_outlined,
                    title: "Privacy Policy",
                    onTap: () {}),
                settingTile(
                    icon: Icons.article_outlined,
                    title: "Terms & Conditions",
                    onTap: () {}),
                settingTile(
                    icon: Icons.logout,
                    title: "Log Out",
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Row(
                                  children: [
                                    Text(
                                      "Log Out",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                content: SizedBox(
                                  height: height * 0.03,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Are you sure you want to logout?",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(
                                            color: primaryClr,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  TextButton(
                                      onPressed: () async {
                                        value.mlogoutUser(context);
                                      },
                                      child: Text(
                                        "Logout",
                                        style: TextStyle(
                                            color: primaryClr,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                              ));
                    }),
              ],
            ),
          )),
    );
  }
}
