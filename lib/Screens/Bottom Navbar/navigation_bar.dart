import 'package:easymobile/Constants/colors.dart';
import 'package:easymobile/Provider/authProvider.dart';
import 'package:easymobile/Screens/Home/home_screen.dart';
import 'package:easymobile/Screens/Profile/profile_screen.dart';
import 'package:easymobile/Screens/Settings/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  @override
  void initState() {
    Provider.of<AuthProvider>(context,listen: false).mGetUser();
    super.initState();
  }
  // Color mainColor = const Color(0xFF2631C1);
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        items: _navBarsItems(),
        hideNavigationBarWhenKeyboardShows: true,
        screens: const [
          HomeScreen(),
          ProfileScreen(),
          SettingScreen(),
        ],
        navBarStyle: NavBarStyle.style3,
      ),
    );
  }
}


List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
   
    PersistentBottomNavBarItem(
      // icon: ImageIcon(home,size: 100,),
      icon: const Icon(Icons.home_outlined,size: 27,),
      title: ("Home"),
      // textStyle: const TextStyle(fontSize: 11),
      activeColorPrimary: primaryClr.withOpacity(0.5),
      activeColorSecondary: primaryClr,
      inactiveColorPrimary: secondryClr,
    ),
     PersistentBottomNavBarItem(
      icon: const Icon(Icons.person_outline_rounded,size: 25,),
      title: ("Profile"),
      // textStyle: const TextStyle(fontSize: 11),
      activeColorPrimary: primaryClr.withOpacity(0.5),
      activeColorSecondary: primaryClr,
      inactiveColorPrimary: secondryClr,
      contentPadding: 0,
    ),
     PersistentBottomNavBarItem(
      icon: const Icon(Icons.settings,size: 25,),
      title: ("Settings"),
      // textStyle: const TextStyle(fontSize: 11),
      activeColorPrimary: primaryClr.withOpacity(0.5),
      activeColorSecondary: primaryClr,
      inactiveColorPrimary: secondryClr,
      contentPadding: 0,
    ),
   
  
  ];
}

