import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final formGlobalKey = GlobalKey < FormState > ();

  bool isEmailValid(String? email) {
    String? pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if(email != null){
      if(regex.hasMatch(email)){return true;}
    }
    return false;
  }

  bool isValidPhoneNumber(String? string) {
    // Null or empty string is invalid phone number
    if (string == null || string.isEmpty) {
      return false;
    }

    // You may need to change this pattern to fit your requirement.
    // I just copied the pattern from here: https://regexr.com/3c53v
    String pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    RegExp regExp = new RegExp(pattern);

    if (!regExp.hasMatch(string)) {
      return false;
    }
    return true;
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Sign In Page"),
        backgroundColor: Colors.black,
      ),

      body: SingleChildScrollView(
          child: Form(
            key: formGlobalKey,
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: SizedBox(
                        width: 200,
                        height: 130,
                        /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                        child: Image(
                          image: NetworkImage('https://www.vyrazu.com/wp-content/uploads/2020/12/flutter-logo-5086DD11C5-seeklogo.com_.png'),
                        )),

                  ),
                ),

                // padding: EdgeInsets.symmetric(horizontal: 15),
                Padding(
                  padding: const EdgeInsets.only(left:15.0,right: 15.0,top:50,bottom: 0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter valid email id as abc@gmail.com'),

                    validator: (email) {

                      if (isEmailValid(email)) return null;
                      else
                        return 'Enter a valid email address';
                    },
                  ),),


                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(

                    // obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone Number',
                        hintText: 'Enter your Phone Number'),

                    validator: (phone) {

                      if (isValidPhoneNumber(phone)) {return null;}
                      else
                      {return 'Enter a valid Phone Number';}
                    },
                  ),
                ),

                // FlatButton(
                //   onPressed: (){
                //     //TODO FORGOT PASSWORD SCREEN GOES HERE
                //   },
                //   child: const Text(
                //     'Forgot Password',
                //     style: TextStyle(color: Colors.black38, fontSize: 15),
                //   ),
                // ),

                const Padding(padding: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 30, bottom: 0),
                ),


                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.black, borderRadius: BorderRadius.circular(20)),
                  child: FlatButton(
                    onPressed: () {
                      if (formGlobalKey.currentState!.validate()) {
                        formGlobalKey.currentState!.save();
                        // use the email provided here
                        Navigator.pop(context);
                      }
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 130,
                // ),
                //
                //
                // FlatButton(
                //   onPressed: () {
                //     Navigator.pop(context);
                //   },
                //   child: const Text('New User? Create Account',
                //     style: TextStyle(
                //         color: Colors.black38
                //     ),),
                // ),

              ],
            ),
          )
      ),
    );
  }
}
