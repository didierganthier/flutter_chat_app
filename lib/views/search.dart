import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(),
                ),
                CircleAvatar(
                  child: Icon(Icons.search),
                  radius: 30,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
