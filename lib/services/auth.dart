import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_app/models/user.dart' as ModelUser;

class AuthMethods {
  final _auth = FirebaseAuth.instance;

  ModelUser.User _userFromFirebase(User user)
  {
    return user != null ? ModelUser.User(userId: user.uid) : null;
  }

  Future signInWithEmailAndPassword(String email, String password) async
  {
    try
    {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User firebaseUser = _authResult.user;
      return _userFromFirebase(firebaseUser);
    }
    catch(e)
    {
      print(e.toString());
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async
  {
    try
    {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User firebaseUser = _authResult.user;
      return _userFromFirebase(firebaseUser);
    }
    catch(e)
    {
      print(e.toString());
    }
  }

  Future resetPass(String email) async
  {
    try
    {
      return await _auth.sendPasswordResetEmail(email: email);
    }
    catch(e)
    {
      print(e.toString());
    }
  }

  Future signOut() async
  {
    try
    {
      return await _auth.signOut();
    }
    catch(e)
    {
      print(e.toString());
    }
  }
}