import 'package:easymobile/Provider/authProvider.dart';
import 'package:easymobile/Screens/Splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Widgets/sharedperference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Shared.pref = await SharedPreferences.getInstance();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
    
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          fontFamily: "Poppins",
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
