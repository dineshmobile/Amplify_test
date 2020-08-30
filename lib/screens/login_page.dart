import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amplify_test/screens/social_login_page.dart';
import 'package:flutter_amplify_test/utils/colors.dart';
import 'package:flutter_amplify_test/utils/toast.dart';
import 'package:flutter_amplify_test/widgets/button_widget.dart';
import 'package:flutter_amplify_test/widgets/textField_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  FocusNode _emailFocus = new FocusNode();
  FocusNode _passwordFocus = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body:ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.fromLTRB(12,100, 12, 12),
        children: <Widget>[
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.asset('assets/images/amplify.PNG', height: 60,),
                SizedBox(height: 20.0),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextFieldWidget(
                      hint: 'Username or Email address',
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      focusNode: _emailFocus,
                      nextFocusNode: _passwordFocus,
                      textCapitalization: TextCapitalization.none,
                    ),

                    TextFieldWidget(
                      hint: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      focusNode: _passwordFocus,
                      nextFocusNode: FocusNode(),
                      obscureText: true,
                      textCapitalization: TextCapitalization.none,
                    ),

                  ],
                ),
                SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.topRight,
                  child: Text('Forgotten Passwod?', style: GoogleFonts.poppins(color: buttonColor, fontSize: 14)),),
                SizedBox(height: 10.0),
                ButtonWidget(
                  buttonName: 'LOG IN',
                  onPressed: ()async{

                    FocusScope.of(context).requestFocus(FocusNode());
                    if(!validateEmail(_emailController.text))
                      showErrorToast('Please Enter valid Email ID!');
                    else if (_passwordController.text.isEmpty)
                      showErrorToast('Enter Passowrd');
                    await new Future.delayed(const Duration(seconds: 5));
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SocialLoginPage()));

                  },
                ),
                SizedBox(height: 25.0),

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/fb.png', width: 24, height:24,colorBlendMode: BlendMode.clear,),
                        SizedBox(width: 5),
                        Text('Continue with Facebook', style: GoogleFonts.poppins(color: Colors.white,fontSize: 14),)
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/google.png', width: 24, height:24,colorBlendMode: BlendMode.clear,),
                        SizedBox(width: 5),
                        Text('Continue with Google', style: GoogleFonts.poppins(color: Colors.white,fontSize: 14),)
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Divider(color: buttonColor, thickness: 1,),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Don't have an account?",
                          style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SocialLoginPage()));
                          },
                          child: Text(
                            'Sign up',
                            style: GoogleFonts.poppins(color: buttonColor, fontSize: 16),
                          ),
                        ),
                      ],
                    ),

                  ],
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}

bool validateEmail(String email) {
  return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}