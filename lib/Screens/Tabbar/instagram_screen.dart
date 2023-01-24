import 'dart:async';

import 'package:easymobile/Constants/paths.dart';
import 'package:easymobile/Screens/Tabbar/instagram_detail_screen.dart';
import 'package:easymobile/Widgets/buttons.dart';
import 'package:easymobile/Widgets/text_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
class InstagramScreen extends StatefulWidget {
  const InstagramScreen({Key? key}) : super(key: key);

  @override
  State<InstagramScreen> createState() => _InstagramScreenState();
}

class _InstagramScreenState extends State<InstagramScreen> {
   TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
      double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
      child: Column(
        children: [
          const SizedBox(height: 20,),
          SizedBox(height: 60,width: 60,child: instagram,),
          const SizedBox(height: 30,),
          textField(
            context: context,
            lable: "Email",
            hint: "Email",
            icon: CupertinoIcons.mail,
            controller: email,
            inputType: TextInputType.emailAddress,
          ),
          passwordfield(
              controller: password, hint: "Password", lable: "Password"),
          const SizedBox(height: 20,),
          loadingButton(context: context, onPressed: (){
            Timer(const Duration(milliseconds: 700), () {
                  _btnController.reset();
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: const InstagramDetailScreen(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                });
          }, text: "Continue", width: width * 0.8, btnController: _btnController)    
        ],
      ),
    ),
    );
  }
}