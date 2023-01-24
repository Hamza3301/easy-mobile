import 'package:easymobile/Constants/colors.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget appBar({required var title,}){
  return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: primaryClr),
        title: Text("$title",style:  TextStyle(fontWeight: FontWeight.bold,color: primaryClr,fontSize: 16),),
        centerTitle: true,
      );
}
