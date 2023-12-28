import 'package:flutter/material.dart';

class IndividualScreen extends StatelessWidget {
  const IndividualScreen({super.key, required this.body});
  final String body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFB495),
      appBar: AppBar(
        backgroundColor: Color(0xffEFB495),
        title: Text(
          "Individual Posts",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(25),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xffEF9595),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              "Body",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            SizedBox(height: 20),
            Text("$body"),
          ],
        ),
      ),
    );
  }
}
