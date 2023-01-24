import 'package:easymobile/Constants/colors.dart';
import 'package:easymobile/Constants/paths.dart';
import 'package:easymobile/Provider/authProvider.dart';
import 'package:easymobile/Screens/Profile/edit_profile_screen.dart';
import 'package:easymobile/Screens/Settings/settings_screen.dart';
import 'package:easymobile/Widgets/app_bar.dart';
import 'package:easymobile/Widgets/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    Provider.of<AuthProvider>(context,listen: false).mGetUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer<AuthProvider>(
      builder: (context, value, child) =>  Scaffold(
          appBar: appBar(title: "Profile"),
          body: Center(
            child: Column(
              children: [
                Card(
                  margin: EdgeInsets.zero,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Container(
                    height: height * 0.2,
                    width: width * 0.95,
                    decoration: BoxDecoration(
                        color: primaryClr,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 80,
                            width: 80,
                            child: profile,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${value.userModel!.userName}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              Text(
                                "${value.userModel!.email}",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 13),
                              ),
                              Text(
                                "${value.userModel!.phone}",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 13),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.57,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.07,
                          ),
                          profileTile(
                              context: context,
                              leadingImg: Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: edit,
                              ),
                              title: "Edit Profile",
                              subtitle: "Update your profile details",
                              icon: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15,
                                color: Colors.black,
                              ),
                              onTap: () {
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: const EditProfileScreen(),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              }),
                          profileTile(
                              context: context,
                              leadingImg: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: settings),
                              title: "Settiings",
                              subtitle: "See the app settings",
                              icon: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15,
                                color: Colors.black,
                              ),
                              onTap: () {
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: const SettingScreen(),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              }),
                          profileTile(
                              context: context,
                              leadingImg: Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: logOut,
                              ),
                              title: "Log Out",
                              subtitle: "Log out from the app",
                              icon: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15,
                                color: Colors.black,
                              ),
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
                                                      color: Colors.black,
                                                      fontSize: 13),
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
                                                      fontWeight:
                                                          FontWeight.bold),
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
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                          ],
                                        ));
                              }),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
