
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shubhay_demo/Screens/Auth/login_otp_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  TextEditingController numberController = TextEditingController();

  final maskForPhoneFormatter = MaskTextInputFormatter(mask: "#####-#####");
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
            Image.asset("assets/images/login_number.jpg"),
            const Text(
              "Welcome,",
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
              child: txtFieldNumber(context),
            ),

            loginBtn(context),

          ],
        ),
      ),
    );
  }

  // textfield for enter number
  Widget txtFieldNumber(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: numberController,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        letterSpacing: 1,
      ),
      validator: (value) {
        if(value!.isEmpty || value.length != 11){
          return "Enter Valid Number";
        }
        return null;
      },
      onChanged: (value) {
        if (value.length == 11) {
          FocusScope.of(context).unfocus();
        }
      },
      inputFormatters: [maskForPhoneFormatter],
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          left: 15,
        ),
        hintText: "00000-00000",
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Colors.green,
            width: 1.3,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.green, width: 1.3),
        ),
      ),
    );
  }

  // login btn
  Widget loginBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(formKey.currentState!.validate()){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginOTPPage(),
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
