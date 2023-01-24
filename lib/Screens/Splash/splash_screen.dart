import 'package:easymobile/Constants/colors.dart';
import 'package:easymobile/Constants/paths.dart';
import 'package:easymobile/Screens/Auth/login_screen.dart';
import 'package:easymobile/Screens/Bottom%20Navbar/navigation_bar.dart';
import 'package:easymobile/Widgets/sharedperference.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   void initState() {
    super.initState();

    String? email = Shared.pref.getString("email");

    if (email == null) {
      Future.delayed(const Duration(seconds: 4), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      });
    } else {
      Future.delayed(const Duration(seconds: 4), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) =>  const NavigationBarScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primaryClr,
      body: Center(
        child: Card(
          margin: EdgeInsets.zero,
          elevation: 20,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(150)),
          child: Container(
              height: 150,
              width: 150,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: splashLogo),
        ),
      ),
    );
  }
}
