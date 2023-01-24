import 'dart:async';
import 'dart:convert' as convert;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easymobile/Screens/Auth/login_screen.dart';
import 'package:easymobile/Screens/Bottom%20Navbar/navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/UserModel.dart';
import '../Widgets/sharedperference.dart';

class AuthProvider extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  bool isUserCreated = false;
  String userRegisterationMessage = "";
  bool isUserLoggedIn = false;
  bool isUserUpdated = false;
  String userLoginMessage = "";
  Future<void> createUser({
    required String email,
    required String userName,
    required String phone,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel model = UserModel(
        email: email,
        userName: userName,
        phone: phone,
        timestamp: DateTime.now().millisecondsSinceEpoch,
      );

      await firestore.collection("Users").doc(email).set(model.SignupToMap());
      isUserCreated = true;
      userRegisterationMessage = "Sign up Successfull";
      notifyListeners();
      print(userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        userRegisterationMessage = "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        userRegisterationMessage = "The account already exists for that email.";
      }
      isUserCreated = false;
      notifyListeners();
    } catch (e) {
      isUserCreated = false;
      userRegisterationMessage = "Something went wrong";
      notifyListeners();
      print(e);
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(userCredential.user!.uid);
      Shared.pref.setString("email", email);
      isUserLoggedIn = true;
      userLoginMessage = "Welcome.! Sign in Successfull";
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        userLoginMessage = "No user found for that email..!";
        isUserLoggedIn = false;
        notifyListeners();
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        userLoginMessage = "Wrong password provided for that user..!";
        isUserLoggedIn = false;
        notifyListeners();
      } else {
        userLoginMessage = "Something went wrong..!";
        isUserLoggedIn = false;
        notifyListeners();
      }
    }
  }

  UserModel? userModel;
  TextEditingController username = TextEditingController();
  TextEditingController useremail = TextEditingController();
  TextEditingController phone = TextEditingController();
  mGetUser() async {
    UserModel? userModel;
    String? email = Shared.pref.getString("email");
    await firestore
        .collection("Users")
        .doc(email)
        .get()
        .then((value) => userModel = UserModel.fromJson(value.data()!));
    username = TextEditingController(text: userModel!.userName);
    useremail = TextEditingController(text: userModel!.email!);
    phone = TextEditingController(text: userModel!.phone!);
    this.userModel = userModel;
    notifyListeners();
  }

    Future<void> updateUser(String userName, String email, String phone,) async {
    try {
      UserModel model = UserModel(
        userName: userName,
        email: email,
        phone: phone,
      );
      print('1');
      print(email);
      await firestore.collection("Users").doc(email).update(model.userUpdateToMap());
      print('2');
      isUserUpdated = true;
      mGetUser();
      notifyListeners();
    }
    catch (e) {
      print(e);
      isUserUpdated = false;
      notifyListeners();
    }
  }

  fetchResponse() async {
    final url = "https://www.instagram.com/atifmunir/?__a=1";

    final res = await http.get(Uri.parse(url));
    String body = res.body;
    var json = convert.jsonDecode(body);
    print("${json["graphql"]["user"]}");
  }

  //=================================== Logout Function ================================

  mlogoutUser(BuildContext context) {
    Shared.pref.remove("email");
    Shared.pref.clear();
    Timer(const Duration(milliseconds: 500), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const LoginScreen()),
          ModalRoute.withName('/'));
    });
  }
}
