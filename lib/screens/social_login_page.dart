import 'package:flutter/material.dart';
import 'package:flutter_amplify_test/screens/login_page.dart';
import 'package:flutter_amplify_test/screens/signup_page1.dart';
import 'package:flutter_amplify_test/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';


class SocialLoginPage extends StatefulWidget {
  @override
  _SocialLoginPageState createState() => _SocialLoginPageState();
}

class _SocialLoginPageState extends State<SocialLoginPage> {

  
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
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 20.0),
            Image.asset('assets/images/amplify.PNG', height: 100,),
            Text('GAIN BACK CONTROL', style: TextStyle(color: Colors.white, letterSpacing: 2.0), textAlign: TextAlign.center,),
            SizedBox(height: 5.0),
            Text('OF YOUR LIFE', style: TextStyle(color: Colors.white, letterSpacing: 2.0),textAlign: TextAlign.center,),
            SizedBox(height: 35.0),
            SizedBox(
             height: 42,
             width: 325,
             child: RaisedButton(
               color: Colors.blue,
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
               onPressed: () async {
                  const url = 'https://www.facebook.com/';
// here we have to configure using facebook authentication,
                   if (await canLaunch(url)) {
                   await launch(url, forceSafariVC: false);
                     } else {
                    throw 'Could not launch $url';
                   }
               },
               child: Row(
                 mainAxisSize: MainAxisSize.min,
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: <Widget>[
                   Image.asset('assets/images/fb.png', height: 20,width: 20),
                   SizedBox(width: 5.0),
                   Text("SIGN UP WITH FACEBOOK", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500),)
                 ],
               )
             ),
              ),
            SizedBox(height: 25.0),
            SizedBox(
              height: 42,
              width: 325,
              child: RaisedButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  onPressed: () async {
                    const url = 'https://accounts.google.com/login';
// here we have to configure using google authentication,
                    if (await canLaunch(url)) {
                      await launch(url, forceSafariVC: false);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/google.png', height: 20,width: 20),
                      SizedBox(width: 5.0),
                      Text("SIGN UP WITH GOOGLE", style: GoogleFonts.poppins(color: Colors.black, fontWeight:FontWeight.w500),)
                    ],
                  )
              ),
            ),
            SizedBox(height: 20.0),
            FlatButton(
                onPressed: () {
                  Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SignUpPage1()));
                },
                child: Text(
                  'Sign up with Email address',
                  style: GoogleFonts.poppins(color: buttonColor, fontSize: 14),
                ),
              ),
            SizedBox(height: 10.0),
            Divider(color: buttonColor, thickness: 1,),
            SizedBox(height: 10.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Already have an account?",
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginPage()));
                  },
                  child: Text(
                    'Sign in',
                    style: GoogleFonts.poppins(color: buttonColor, fontSize: 14),
                  ),
                ),
              ],
            ),
          ],
        ),

      ),
    );
  }
}
