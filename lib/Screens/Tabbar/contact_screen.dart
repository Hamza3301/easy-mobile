import 'dart:typed_data';
import 'package:easymobile/Constants/colors.dart';
import 'package:easymobile/Constants/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:url_launcher/url_launcher.dart';
class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<Contact>? contacts;
  @override
  void initState() {
    super.initState();
    getContact();
  }
  void getContact() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      print(contacts);
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: (contacts) == null
            ? Center(child: CircularProgressIndicator(color: primaryClr,))
            : ListView.builder(
                itemCount: contacts!.length,
                itemBuilder: (BuildContext context, int index) {
                  Uint8List? image = contacts![index].photo;
                  String num = (contacts![index].phones.isNotEmpty) ? (contacts![index].phones.first.number) : "--";
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                    child: Card(
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                          leading: (contacts![index].photo == null)
                              ? CircleAvatar(backgroundColor: Colors.white,child: contactImg)
                              : CircleAvatar(backgroundImage: MemoryImage(image!)),
                          title: Text(
                              "${contacts![index].name.first} ${contacts![index].name.last}",style: TextStyle(fontSize: 14),),
                          subtitle: Text(num,style: TextStyle(fontSize: 12),),
                          onTap: () {
                            if (contacts![index].phones.isNotEmpty) {
                              launch('tel: $num');
                            }
                          }),
                    ),
                  );
                },
              ));
  }
}