import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/services/database.dart';
import 'package:flutter_chat_app/widgets/widgets.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  TextEditingController searchTextEditingController = TextEditingController();

  DatabaseMethods databaseMethods = DatabaseMethods();

  QuerySnapshot searchSnapshot;

  initiateSearch(){
    databaseMethods.getUserByUsername(searchTextEditingController.text).then((value){
      setState(() {
        searchSnapshot = value;
      });
    });
  }

  Widget searchList(){
    return searchSnapshot != null? ListView.builder(
      itemCount: searchSnapshot.docs.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return SearchTile(
          userName: searchSnapshot.docs[index].data()["name"],
          userEmail: searchSnapshot.docs[index].data()["email"],
        );
      },
    ) :
    Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initiateSearch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Container(
              color: Color(0x54FFFFFF),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchTextEditingController,
                      decoration: InputDecoration(
                        hintText: "Search username...",
                        hintStyle: TextStyle(
                          color: Colors.white54,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      initiateSearch();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0x36FFFFFF),
                            Color(0x0FFFFFFF),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            searchList(),
          ],
        ),
      ),
    );
  }
}

class SearchTile extends StatelessWidget {
  final String userName;
  final String userEmail;

  const SearchTile({this.userName, this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName, style: simpleTextFieldStyle(),),
              Text(userEmail, style: simpleTextFieldStyle().copyWith(fontSize: 14),),
            ],
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(30)
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text("Message"),
          ),
        ],
      ),
    );
  }
}

