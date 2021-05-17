import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  getUserByUsername(String username) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("name", isGreaterThanOrEqualTo: username)
        .get();
  }

   uploadUserInfo(Map userMap) {
    FirebaseFirestore.instance.collection("users").add(userMap).catchError((e) {
      print(e.toString());
    });
  }

  createChatRoom(String chatRoomId, Map chatRoomMap){
    FirebaseFirestore.instance.collection("chatroom")
        .doc(chatRoomId).set(chatRoomMap).catchError((e){
          print(e.toString());
    });
  }
}
