import 'dart:async';
import 'package:easymobile/Constants/colors.dart';
import 'package:easymobile/Provider/authProvider.dart';
import 'package:easymobile/Screens/Auth/signup_screen.dart';
import 'package:easymobile/Screens/Bottom%20Navbar/navigation_bar.dart';
import 'package:easymobile/Screens/Home/home_screen.dart';
import 'package:easymobile/Widgets/app_bar.dart';
import 'package:easymobile/Widgets/buttons.dart';
import 'package:easymobile/Widgets/flush_bar.dart';
import 'package:easymobile/Widgets/text_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // TextEditingController email = TextEditingController();
  // TextEditingController username = TextEditingController();
  // TextEditingController phone = TextEditingController();
  void initState() {
    Provider.of<AuthProvider>(context, listen: false).mGetUser();
    super.initState();
  }

  bool isTermsConditions = false;
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer<AuthProvider>(
      builder: (context, value, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBar(title: "Edit Profile"),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.05,
                  ),
                  textField(
                    context: context,
                    lable: "Username",
                    hint: "Username",
                    icon: CupertinoIcons.person,
                    controller: value.username,
                    inputType: TextInputType.emailAddress,
                  ),
                  textField(
                    context: context,
                    lable: "Email",
                    hint: "Email",
                    icon: CupertinoIcons.mail,
                    controller: value.useremail,
                    inputType: TextInputType.emailAddress,
                  ),
                  textField(
                    context: context,
                    lable: "Phone",
                    hint: "Phone",
                    icon: CupertinoIcons.phone,
                    controller: value.phone,
                    inputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: height * 0.08,
                  ),
                  loadingButton(
                      context: context,
                      onPressed: () {
                        if(value.isUserUpdated){
                          value
                            .updateUser(value.username.text,
                                value.useremail.text, value.phone.text)
                            .then((value) {
                          SuccessFlushbar(context, "Success",
                              "Profile Updated Successfully!");
                          _btnController.success();
                          Timer(const Duration(milliseconds: 700), () {
                            _btnController.reset();
                          });
                        });
                        }
                        else{
                           _btnController.error();
                          Timer(const Duration(milliseconds: 700), () {
                            _btnController.reset();
                          });
                        }
                        
                      },
                      text: "Update",
                      width: width,
                      btnController: _btnController),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
