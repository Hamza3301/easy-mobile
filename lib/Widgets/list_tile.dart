import 'package:easymobile/Constants/colors.dart';
import 'package:flutter/material.dart';

Widget tile(
    {required IconData leadingIcon,
    required var title,
    required var subtitle,
    required void Function()? onTap}) {
  return Column(
    children: [
      ListTile(
        onTap: onTap,
        leading: Padding(
          padding: const EdgeInsets.only(top: 7),
          child: Icon(
            leadingIcon,
            size: 28,
            color: Colors.grey,
          ),
        ),
        title: Text(
          "$title",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        subtitle: Text(
          "$subtitle",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.grey,
          size: 20,
        ),
      ),
      Divider(
        color: Colors.grey.withOpacity(0.5),
      ),
    ],
  );
}


Widget profileTile(
    {required BuildContext context,
    required var leadingImg,
    required var title,
    required var subtitle,
    required var icon,
    required void Function()? onTap}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Column(
    children: [
      ListTile(
        leading: leadingImg,
        title: Text(
          "$title",
          style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),
        ),
        subtitle: SizedBox(
          width: width,
          child: Text(
            "$subtitle",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 11, color: Colors.grey,fontWeight: FontWeight.bold),
          ),
        ),
        trailing: SizedBox(
          height: 25,
          width: 25,
          child: icon,
        ),
        onTap: onTap,
      ),
      SizedBox(
        height: 0,
        width: width,
        child: Divider(
          color: Colors.grey.withOpacity(0.8),
        ),
      )
    ],
  );
}


Widget settingTile(
    {required IconData icon, required var title, required void Function()? onTap}) {
  return ListTile(
    onTap: onTap,
    leading: Icon(icon,size: 28,color: Colors.black,),
    title: Text(
      "$title",
      style: TextStyle(
        fontSize: 14,
      ),
    ),
  );
}

Widget userTile ({required BuildContext context, required var title, required void Function()? onTap}){
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return  Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Card(
                margin: EdgeInsets.zero,
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Container(
                  width: width * 0.9,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: primaryClr.withOpacity(0.07)),
                  child: ListTile(
                    onTap: onTap,
                    leading: Text("$title",style: TextStyle(color: primaryClr,fontSize: 14,fontWeight: FontWeight.bold),),
                    trailing: Icon(Icons.arrow_forward_ios_rounded,color: primaryClr,size: 18,),
                  ),
                ),
              ),
  );
}
