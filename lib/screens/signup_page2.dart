import 'package:flutter/material.dart';
import 'package:flutter_amplify_test/utils/colors.dart';
import 'package:flutter_amplify_test/utils/toast.dart';
import 'package:flutter_amplify_test/widgets/button_widget.dart';
import 'package:flutter_amplify_test/widgets/textField_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_page.dart';

class SignUpPage2 extends StatefulWidget {
  @override
  _SignUpPage2State createState() => _SignUpPage2State();
}

class _SignUpPage2State extends State<SignUpPage2> {

  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _cnfpasswordController = new TextEditingController();


  FocusNode _passwordFocus = new FocusNode();
  FocusNode _cnfpasswordFocus = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          tooltip: 'Previous choice',
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: Theme(
              data: Theme.of(context).copyWith(accentColor: Colors.white),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  Align(
                      alignment: Alignment(-0.85, 0),
                      child: Text('SIGN UP', style: GoogleFonts.poppins(
                          color: buttonColor, fontSize: 22,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.bold),)),
                  Row(children: <Widget>[
                    Expanded(
                      child: new Container(
                          margin: const EdgeInsets.only(left: 15.0, right: 5.0),
                          child: Divider(
                            color: buttonColor,
                            height: 50,
                            thickness: 4,
                          )),
                    ),
                    Expanded(
                      child: new Container(
                          margin: const EdgeInsets.only(left: 5.0, right: 15.0),
                          child: Divider(
                            color: buttonColor,
                            height: 50,
                            thickness: 4,
                          )),
                    ),
                  ]),

                ],
              )

          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
            Text('Choose a password', style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),

          TextFieldWidget(
            hint: 'password',
            keyboardType: TextInputType.visiblePassword,
            controller: _passwordController,
            focusNode: _passwordFocus,
            nextFocusNode: _cnfpasswordFocus,
            textCapitalization: TextCapitalization.none,
            obscureText: true,
          ),

              TextFieldWidget(
                hint: 'confirm password',
                keyboardType: TextInputType.visiblePassword,
                controller: _cnfpasswordController,
                focusNode: _cnfpasswordFocus,
                nextFocusNode: FocusNode(),
                textCapitalization: TextCapitalization.none,
                obscureText: true,
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: ButtonWidget(
                  buttonName: 'CONTINUE',
                  onPressed: () async{
                    if (_passwordController.text.isEmpty)
                      showErrorToast('Please enter password');
                    else if (_cnfpasswordController.text.isEmpty)
                      showErrorToast('Please enter confirm passwoed');
                    else if (_cnfpasswordController.text !=
                        _passwordController.text)
                      showErrorToast('password not match');
                    else if (_passwordController.text.length < 8)
                    showErrorToast('Minimum of 8 characters');

                    await new Future.delayed(const Duration(seconds: 8));
                    showSuccessToast('');
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));

                  },
                ),
              ),

    ]
        ),
      )
    );
  }
}

