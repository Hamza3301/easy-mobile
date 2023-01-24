import 'package:easymobile/Constants/colors.dart';
import 'package:easymobile/Widgets/app_bar.dart';
import 'package:easymobile/Widgets/list_tile.dart';
import 'package:flutter/material.dart';
class InstagramDetailScreen extends StatefulWidget {
  const InstagramDetailScreen({Key? key}) : super(key: key);

  @override
  State<InstagramDetailScreen> createState() => _InstagramDetailScreenState();
}

class _InstagramDetailScreenState extends State<InstagramDetailScreen> {
  @override
  Widget build(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar(title: "User Details"),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            userTile(context: context, title: "Username", onTap: (){}),
            userTile(context: context, title: "Followers", onTap: (){}),
            userTile(context: context, title: "Following", onTap: (){}),
            userTile(context: context, title: "Posts", onTap: (){}),


          ],
        ),
      ),
    );
  }
}