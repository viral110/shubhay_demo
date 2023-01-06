import 'package:flutter/material.dart';
import 'package:shubhay_demo/Screens/Home/home_page.dart';
import 'package:sms_autofill/sms_autofill.dart';

class LoginOTPPage extends StatelessWidget {
  LoginOTPPage({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: bodyWidget(context),
    );
  }

  // body widget
  Widget bodyWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/8,
            ),
            Image.asset("assets/images/otp_login.jpg"),
            const Text(
              "Welcome back,",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 35,
                top: 35,
                right: 35,
                bottom: 20,
              ),
              child:  PinInputTextFormField(
                pinLength: 4,
                validator: (value) {
                  if(value!.isEmpty || value.length != 4){
                    return "Enter Valid OTP";
                  }
                  return null;
                },

                keyboardType: TextInputType.number,
                decoration: const BoxLooseDecoration(
                  strokeColorBuilder: FixedColorBuilder(Colors.green),
                ),
                onChanged: (value) {
                  if (value.length == 4) {
                    FocusScope.of(context).unfocus();
                  }
                },
              ),
            ),

            loginBtn(context),

          ],
        ),
      ),
    );
  }

  // otp in btn
  Widget loginBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(formKey.currentState!.validate()){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        }

      },
      child: Container(
        height: 50,
        margin: EdgeInsets.all(33),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green,
        ),
        child: const Text(
          "Get OTP",
          style: TextStyle(
            color: Colors.white,
            fontSize: 19,
          ),
        ),
      ),
    );
  }

}
