import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';
// import 'package:email_auth_example/auth.config.dart';

class Email {
   final email;
   Email(this.email);
}

String Textemail = " ";

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final formGlobalKey = GlobalKey < FormState > ();
  final TextEditingController emailController = TextEditingController();



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
    if(i)

    return true;
  }




  void sendOTP() async {
    EmailAuth.sessionName = "Text Session";
    var res = await EmailAuth.sendOtp(receiverMail: emailController.text);
    if(res){
      print("OTP sent");
    }
    else {
      print("We could not print OTP");
    }
  }


  String dropdownValue = "Services Offered";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Sign Up Page"),
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
                 controller: emailController,
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

              Padding(padding: const EdgeInsets.only(left:15.0,right: 15.0,top:10,bottom: 0),),


              // Padding(
              //   padding: const EdgeInsets.only(
              //       left: 15.0, right: 15.0, top: 15, bottom: 0),
              //   //padding: EdgeInsets.symmetric(horizontal: 15),
              //   child: TextFormField(
              //      controller: otpController,
              //      obscureText: true,
              //     decoration: const InputDecoration(
              //         border: OutlineInputBorder(),
              //         labelText: 'OTP',
              //         hintText: 'Enter OTP'),
              //   ),
              // ),


              // Padding(
              //   padding: const EdgeInsets.only(
              //       left: 15.0, right: 15.0, top: 15, bottom: 0),
              //   //padding: EdgeInsets.symmetric(horizontal: 15),
              //   child: TextFormField(
              //
              //     // obscureText: true,
              //     decoration: const InputDecoration(
              //         border: OutlineInputBorder(),
              //         labelText: 'Roll Number',
              //         hintText: 'Enter Your Roll Number'),
              //   ),
              // ),

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
                  left: 15.0, right: 15.0, top: 20, bottom: 0),
              ),



              // Container(
              //   height: 50,
              //   width: 250,
              //   decoration: BoxDecoration(
              //       color: Colors.black, borderRadius: BorderRadius.circular(20)),
              //   child: FlatButton(
              //     onPressed: () {
              //       if (formGlobalKey.currentState!.validate()) {
              //         formGlobalKey.currentState!.save();
              //         // use the email provided here
              //         Navigator.pop(context);
              //       }
              //     },
              //     child: const Text(
              //       'Sign Up',
              //       style: TextStyle(color: Colors.white, fontSize: 25),
              //     ),
              //   ),
              // ),

              const Padding(padding: EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10, bottom: 0),
              ),

              DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.black, fontSize: 25),
                underline: Container(
                  width: 20,
                  height: 2,
                  color: Colors.black,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['Services Offered']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),),

              const Padding(padding: EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10, bottom: 0),
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
                     Navigator.pop(context);
                     sendOTP();
                     setState(() {
                       Textemail = emailController.text;
                     });
                     Navigator.push(context, MaterialPageRoute(
                         builder: (context) => const OTPVerification()));
                  }

                    },
                    child: const Text(
                    'Send OTP',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    ),
                    ),


                    const Padding(padding: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 10, bottom: 0),
                    ),




              //       Container(
              //       height: 50,
              //       width: 250,
              //       decoration: BoxDecoration(
              //       color: Colors.black, borderRadius: BorderRadius.circular(20)),
              //       child: FlatButton(
              //       onPressed: () {verifyOTP();
              //         },
              //     child: const Text(
              //       'Verify OTP',
              //       style: TextStyle(color: Colors.white, fontSize: 25),
              //     ),
              //   ),
              // ),

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

class OTPVerification extends StatefulWidget {
  const OTPVerification({Key? key}) : super(key: key);

  @override
  _OTPVerificationState createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {

  final TextEditingController otpController = TextEditingController();

  void verifyOTP() async {
    var res = await EmailAuth.validate(receiverMail: Textemail, userOTP: otpController.text);
    if(res) {
      print("OTP Verified");
    }
    else {
      print("OTP not matched");
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            const Padding(padding: EdgeInsets.only(
                left: 15.0, right: 15.0, top: 50, bottom: 0),
            ),
            //
            // Container(
            //   child : const Text("OTP Verification",
            //     style: TextStyle(color: Colors.black, fontSize: 25),),
            //
            // ),

            Padding(
              padding: const EdgeInsets.only(left:15.0,right: 15.0,top:10,bottom: 30),
              child: TextFormField(
                controller: otpController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'OTP',
                    hintText: 'Enter valid OTP'),
              ),),

            const Padding(padding: EdgeInsets.only(
                left: 15.0, right: 15.0, top: 10, bottom: 0),
            ),

      Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
              onPressed: () {verifyOTP();
                },
            child: const Text(
              'Verify OTP',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
         ),
          ],
        ),
      ),
    );
  }
}

