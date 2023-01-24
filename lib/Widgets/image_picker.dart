import 'dart:typed_data';
import 'package:easymobile/Constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

XFile? image;
Uint8List? imageBytes;

Widget imagePicker(
    {required BuildContext context,
    required void Function()? onTap,
    required,
    required void Function()? onPressed}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return SizedBox(
    height: height * 0.13,
    child: Center(
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 120,
          width: 120,
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              image != null
                  ? CircleAvatar(
                      backgroundColor: primaryClr,
                      backgroundImage: MemoryImage(imageBytes!))
                  : CircleAvatar(
                      backgroundColor: primaryClr.withOpacity(0.5),
                      child: Icon(
                        CupertinoIcons.person,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
              Positioned(
                right: -2,
                bottom: 0,
                child: SizedBox(
                  height: 35,
                  width: 35,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      primary: Colors.white,
                      backgroundColor: const Color(0xFFF5F6F9),
                    ),
                    onPressed: onPressed,
                    // child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
                    child: Icon(
                      Icons.photo_camera,
                      size: 20,
                      color: primaryClr,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
