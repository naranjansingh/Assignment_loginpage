import 'dart:convert';

import 'package:nauggets/signup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart';
class ForgotScreen extends StatefulWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  _ForgotScreenState createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email , password) async {

    try{

      Response response = await post(
          Uri.parse('https://reqres.in/api/login'),
          body: {
            'email' : email,
          }
      );

      if(response.statusCode == 200){

        var data = jsonDecode(response.body.toString());
        print(data['password']);

      }else {
        print('failed');
      }
    }catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: AppBar(
        leading: Container(
          child: Image.asset('assets/images/favicon.png'),
        ),
        title: const Text('nauggets', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Forgot Password',
              style: TextStyle(
                fontFamily: 'Signatra',
                fontSize: 50.0,
                color: Colors.white,
              ) ,
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: 'Enter your Email'
              ),
            ),

            SizedBox(height: 40,),
            GestureDetector(
              onTap: (){
                login(emailController.text.toString(), passwordController.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text('Forgot Password', style: TextStyle(color: Colors.blue.shade900, fontSize: 20.0),),),
              ),
            )
          ],
        ),
      ),
    );
  }
}