import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/Commonwidgets/Resolution/screensize.dart';
import 'package:grocery_app/Commonwidgets/Textformfeild/text_formfeild.dart';
import 'package:grocery_app/Screens/Login_Screen/Login/login_screen.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _createAccountKey = GlobalKey<FormState>();
  final name_Controller = TextEditingController();
  final email_Controller = TextEditingController();
  final password_Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockWidth * 6.5,
            ),
            child: Form(
              key: _createAccountKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: SizeConfig.blockHeight * 5),

                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: GoogleFonts.poppins(
                        fontSize: SizeConfig.blockHeight * 3.8,
                        fontWeight: FontWeight.w600,
                      ),
                      children: const [
                        TextSpan(
                          text: "Create ",
                          style: TextStyle(color: Colors.green),
                        ),
                        TextSpan(
                          text: "Account",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: SizeConfig.blockHeight * .55),

                  Text(
                    "Create your account here and enjoy\nThe shopping",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: SizeConfig.blockHeight * 1.8,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: SizeConfig.blockHeight * 3),

                  Row(
                    children: [
                      Text(
                        'Full Name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockHeight * 1.8,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  LoginTextformfield(
                    hinttext: 'Jhone doe',
                    controller: name_Controller,
                    isPassword: false,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: SizeConfig.blockHeight * 2),

                  Row(
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockHeight * 1.8,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  LoginTextformfield(
                    hinttext: 'example@gmail.com',
                    controller: email_Controller,
                    isPassword: false,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: SizeConfig.blockHeight * 2),

                  Row(
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockHeight * 1.8,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  LoginTextformfield(
                    hinttext: '••••••••',
                    controller: password_Controller,
                    isPassword: true,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: SizeConfig.blockHeight * 5),

                  SizedBox(
                    width: SizeConfig.blockWidth * 85,
                    height: SizeConfig.blockHeight * 5.5,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 5, 143, 47),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        if (_createAccountKey.currentState?.validate() ??
                            false) {
                          // Navigator.of(context).pushReplacement(
                          //   MaterialPageRoute(
                          //     builder: (context) => const HomeScreen(),
                          //   ),
                          // );
                        }
                      },
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.poppins(
                          fontSize: SizeConfig.blockHeight * 1.8,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: SizeConfig.blockHeight * 3),

                  SizedBox(
                    width: SizeConfig.blockWidth * 85,
                    height: SizeConfig.blockHeight * 5.5,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade200,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 2,
                      ),
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/login_images/google.png',
                        height: SizeConfig.blockHeight * 3.4,
                        width: SizeConfig.blockWidth * 6,
                      ),
                      label: Text(
                        'Sign In with Google',
                        style: GoogleFonts.poppins(
                          fontSize: SizeConfig.blockHeight * 1.8,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: SizeConfig.blockHeight * 2.2),

                  Image.asset(
                    "assets/login_images/create_screen.png",
                    fit: BoxFit.cover,
                  ),

                  SizedBox(height: SizeConfig.blockHeight * .15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: GoogleFonts.poppins(
                          fontSize: SizeConfig.blockHeight * 1.7,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                            (route) => false,
                          );
                        },
                        child: Text(
                          "Log In",
                          style: GoogleFonts.poppins(
                            color: Colors.green,
                            fontSize: SizeConfig.blockHeight * 1.8,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
