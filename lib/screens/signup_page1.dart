import 'package:flutter/material.dart';
import 'package:flutter_amplify_test/screens/signup_page2.dart';
import 'package:flutter_amplify_test/utils/colors.dart';
import 'package:flutter_amplify_test/widgets/button_widget.dart';
import 'package:flutter_amplify_test/widgets/dropdown_widget.dart';
import 'package:flutter_amplify_test/widgets/textField_widget.dart';
import 'package:google_fonts/google_fonts.dart';


class SignUpPage1 extends StatefulWidget {
  @override
  _SignUpPage1State createState() => _SignUpPage1State();
}

class _SignUpPage1State extends State<SignUpPage1> {
  TextEditingController _emailController = new TextEditingController();


  FocusNode _emailFocus = new FocusNode();
  List gender=["Male","Female","N/A"];

  String select;

  radioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(title),
        Radio(
          activeColor: Colors.green,
          value: gender[btnValue],
          groupValue: select,
          onChanged: (value){
            setState(() {
              print(value);
              select=value;
            });
          },
        )
      ],
    );
  }

  List<String> timings = [
    'Once a week',
    'Twice a week',
    'Once a month'
        'Twice a Month',
    'Once in a year',
  ];

  String selectedTime;


  List<DropdownMenuItem<String>> timingsMenu;
  List<DropdownMenuItem<String>> getTimingsDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String time in timings) {
      items.add(
        new DropdownMenuItem(
          value: time,
          child: Text(
            time,
          ),
        ),
      );
    }
    return items;
  }

  @override
  void initState() {
    super.initState();
    timingsMenu = getTimingsDropDownMenuItems();
  }


  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
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
                   // Flex(mainAxisSize: MainAxisSize.min,),

                    Align(
                        alignment: Alignment(-0.85, 0),
                        child: Text('SIGN UP', style: GoogleFonts.poppins(
                            color: buttonColor, fontSize: 22,
                            fontWeight: FontWeight.bold, letterSpacing: 2.0),)),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

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
                              color: Colors.white,
                              height: 50,
                              thickness: 1,
                            )),
                      ),
                    ]),

                  ],
                )

            ),
          ),
        ),

        body: Container(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(' What is your email address?', style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
              TextFieldWidget(
                hint: 'Email',
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                focusNode: _emailFocus,
                nextFocusNode: FocusNode(),
                textCapitalization: TextCapitalization.none,
              ),
              SizedBox(height: 10.0),
              Text('What is your gender?', style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
              Row(
                children: <Widget>[
                  radioButton(0, 'Male'),
                  radioButton(1, 'Female'),
                  radioButton(2, 'Others'),
                ],
              ),
              SizedBox(height: 10.0),
              Text('How much do you train?', style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
              DropdownList(
                text: '',
                items: timingsMenu,
                onChanged: (value) {
                  setState(() {
                    selectedTime = value;
                  });
                },
                value: selectedTime,
                hint: 'Time',
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                 child: ButtonWidget(
                  buttonName: 'NEXT',
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage2()));
                  },
                ),
              ), 
            ],
          ),
        ),
        
      );
  }
}
bool validateEmail(String email) {
  return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}
