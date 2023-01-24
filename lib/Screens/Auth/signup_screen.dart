import 'dart:async';
import 'package:easymobile/Constants/colors.dart';
import 'package:easymobile/Provider/authProvider.dart';
import 'package:easymobile/Screens/Auth/login_screen.dart';
import 'package:easymobile/Widgets/app_bar.dart';
import 'package:easymobile/Widgets/buttons.dart';
import 'package:easymobile/Widgets/flush_bar.dart';
import 'package:easymobile/Widgets/text_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();

  bool isTermsConditions = false;
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer<AuthProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: appBar(title: "SignUp"),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // imagePicker(
                      //   context: context,
                      //   onTap: () async {
                      //     final ImagePicker _picker = ImagePicker();
                      //     image = await _picker.pickImage(
                      //         source: ImageSource.gallery);
                      //     imageBytes = await image!.readAsBytes();

                      //     setState(() {});
                      //   },
                      //   onPressed: () async {
                      //     final ImagePicker _picker = ImagePicker();
                      //     image = await _picker.pickImage(
                      //         source: ImageSource.gallery);
                      //     imageBytes = await image!.readAsBytes();

                      //     setState(() {});
                      //   },
                      // ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      textField(
                        context: context,
                        lable: "Username",
                        hint: "Username",
                        icon: CupertinoIcons.person,
                        controller: username,
                      ),
                      textField(
                        context: context,
                        lable: "Email",
                        hint: "Email",
                        icon: CupertinoIcons.mail,
                        controller: email,
                        inputType: TextInputType.emailAddress,
                      ),
                      textField(
                        context: context,
                        lable: "Phone",
                        hint: "Phone",
                        icon: CupertinoIcons.phone,
                        controller: phone,
                        inputType: TextInputType.number,
                      ),
                      passwordfield(
                          controller: password,
                          hint: "Password",
                          lable: "Password"),
                      cpasswordfield(controller: cpassword),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: width * 0.88,
                        child: Row(
                          children: [
                            Checkbox(
                              value: isTermsConditions,
                              activeColor: primaryClr,
                              focusColor: primaryClr,
                              hoverColor: primaryClr,
                              side: BorderSide(color: primaryClr, width: 2),
                              onChanged: (bool? value) {
                                setState(() {
                                  isTermsConditions = value!;
                                });
                              },
                            ),
                            Text(
                              "By continuing you accept our privacy\npolicy and terms and conditions",
                              maxLines: 2,
                              style: TextStyle(color: primaryClr, fontSize: 13),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      loadingButton(
                          context: context,
                          onPressed: ()async {
                            if (_formKey.currentState!.validate()) {
                           await   value
                                  .createUser(
                                email: email.text,
                                userName: username.text,
                                phone: phone.text,
                                password: password.text,
                              )
                                  .then((value12) {
                                if (value.isUserCreated) {
                                  _btnController.success();
                                  SuccessFlushbar(context, "Sign Up",
                                      "${value.userRegisterationMessage}");
                                  Timer(const Duration(seconds: 2), () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen()));
                                    _btnController.reset();
                                  });
                                } else {
                                  _btnController.error();
                                  ErrorFlushbar(context, "Sign Up",
                                      "${value.userRegisterationMessage}");

                                  Timer(const Duration(seconds: 2), () {
                                    _btnController.reset();
                                  });
                                }
                              });
                            } else {
                              _btnController.error();
                              Timer(const Duration(seconds: 2), () {
                                _btnController.reset();
                              });
                            }
                          },
                          text: "SignUp",
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
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(color: Colors.grey, fontSize: 13)),
                  TextSpan(
                      text: "Login",
                      style: TextStyle(
                          color: primaryClr,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
