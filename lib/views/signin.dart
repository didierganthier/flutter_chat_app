import 'package:flutter/material.dart';
import 'package:flutter_chat_app/services/auth.dart';
import 'package:flutter_chat_app/views/signup.dart';
import 'package:flutter_chat_app/widgets/widgets.dart';

import 'chatRoomScreen.dart';

class SignIn extends StatefulWidget {

  final Function toggle;

  SignIn({this.toggle});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  bool isLoading = false;

  AuthMethods _authMethods = AuthMethods();

  final formKey = GlobalKey<FormState>();

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  signMeIn()
  {
    if(formKey.currentState.validate())
    {
      setState(() {
        isLoading = true;
      });

      _authMethods.signInWithEmailAndPassword(emailTextEditingController.text, passwordTextEditingController.text)
          .then((value){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatRoomScreen(),));
      }).catchError((error)=> print(error));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Chat App"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 50,
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: emailTextEditingController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    style: simpleTextFieldStyle(),
                    decoration: textFieldInputDecoration("email"),
                  ),
                  TextFormField(
                    controller: passwordTextEditingController,
                    style: simpleTextFieldStyle(),
                    obscureText: true,
                    onFieldSubmitted: (value){
                      signMeIn();
                    },
                    decoration: textFieldInputDecoration("password"),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        "Forgot Password",
                        style: simpleTextFieldStyle(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      signMeIn();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue,
                            Colors.blueAccent,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Text(
                        "Sign In",
                        style: simpleTextFieldStyle().copyWith(fontSize: 17),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Text(
                      "Sign In with Google",
                      style: simpleTextFieldStyle()
                          .copyWith(color: Colors.black87, fontSize: 17),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have account? ",
                        style: simpleTextFieldStyle().copyWith(fontSize: 17),
                      ),
                      GestureDetector(
                        onTap: ()=> widget.toggle(),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            "Register now",
                            style: simpleTextFieldStyle().copyWith(
                              fontSize: 17,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
