import 'package:easymobile/Constants/colors.dart';
import 'package:flutter/material.dart';


Widget dropDown ({required BuildContext context,required var title,required void Function(String?)? onChanged, required var val,required List<DropdownMenuItem<String>>? items}){
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return    Container(
                  width: width * 0.8,
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border.all(color: primaryClr),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: DropdownButton<String>(
                      value: val,
                      iconDisabledColor: primaryClr,
                      iconEnabledColor: primaryClr,
                      hint: Text(
                        "$title",
                        style: TextStyle(color: primaryClr),
                      ),
                      style: TextStyle(
                          color: primaryClr,
                          fontFamily: 'Poppins',
                          // fontWeight: FontWeight.bold,
                          fontSize: 14),
                      underline: const SizedBox.shrink(),
                      // isExpanded: true,
                      onChanged: onChanged,
                      items: items!.toList(),
                    ),
                  ),
                );
}