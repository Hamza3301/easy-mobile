import 'package:easymobile/Constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';


Widget button(
    {required BuildContext context,
    required var title,
    required var btnClr,
    required void Function()? onPressed}) {
  return SizedBox(
    // width: 100,
    height: 25,
    child: ElevatedButton(
      child: Text(
        '$title',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
      ),
      style: ElevatedButton.styleFrom(
        primary: btnClr,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: onPressed,
    ),
  );
}

Widget loadingButton({
  required BuildContext context,
  required void Function()? onPressed,
  required var text,
  required var width,
  required RoundedLoadingButtonController btnController,
}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return SizedBox(
    width: width * 0.8,
    height: 50,
    child: RoundedLoadingButton(
      color: primaryClr,
      borderRadius: 10,
      successColor: Colors.green,
      errorColor: Colors.red,
      width: width * 0.8,
      elevation: 3,
      height: 50,
      onPressed: onPressed,
      child: Text(
        "$text",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
      controller: btnController,
    ),
  );
}

Widget loadingButton2({
  required BuildContext context,
  required void Function()? onPressed,
  required var price,
  //  required var width,
  required RoundedLoadingButtonController btnController,
}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return SizedBox(
    width: width * 0.8,
    height: 50,
    child: RoundedLoadingButton(
      color: primaryClr,
      borderRadius: 10,
      successColor: Colors.green,
      errorColor: Colors.red,
      width: width * 0.8,
      elevation: 3,
      height: 50,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Continue',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            SizedBox(
                height: 20,
                child: VerticalDivider(
                  color: Colors.white,
                )),
            const Spacer(),
            Text(
              '$price',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      controller: btnController,
    ),
  );
}
