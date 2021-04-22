import 'package:flutter/material.dart';
import 'package:flutter_chat_app/services/auth.dart';
import 'package:flutter_chat_app/views/signin.dart';
import 'package:flutter_chat_app/widgets/widgets.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool isLoading = false;

  AuthMethods _authMethods = AuthMethods();

  final formKey = GlobalKey<FormState>();
  TextEditingController usernameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  signMeUp()
  {
    if(formKey.currentState.validate())
    {
      setState(() {
        isLoading = true;
      });

      _authMethods.signUpWithEmailAndPassword(emailTextEditingController.text, passwordTextEditingController.text).then((value) => print(value)).catchError((error)=> print(error));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Chat App"),
      ),
      body: isLoading? Center(child: Container(child: CircularProgressIndicator(),)) : SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 50,
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) => value.isEmpty || value.length < 2? "Please provide a valid username" : null,
                        controller: usernameTextEditingController,
                        style: simpleTextFieldStyle(),
                        decoration: textFieldInputDecoration("username"),
                      ),
                      TextFormField(
                        validator: (value) => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value) ? null : "Enter correct email",
                        controller: emailTextEditingController,
                        style: simpleTextFieldStyle(),
                        decoration: textFieldInputDecoration("email"),
                      ),
                      TextFormField(
                        obscureText: true,
                        validator: (value) => value.isEmpty || value.length < 6? "Please provide a password 6+ characters" : null,
                        controller: passwordTextEditingController,
                        style: simpleTextFieldStyle(),
                        decoration: textFieldInputDecoration("password"),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {

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
                            "Sign Up",
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
                          "Sign Up with Google",
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
                            "Already have account? ",
                            style: simpleTextFieldStyle().copyWith(fontSize: 17),
                          ),
                          GestureDetector(
                            onTap: ()=> Navigator.pop(context),
                            child: Text(
                              "signIn now",
                              style: simpleTextFieldStyle().copyWith(
                                fontSize: 17,
                                decoration: TextDecoration.underline,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}