import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/Commonwidgets/Resolution/screensize.dart';
import 'package:grocery_app/Commonwidgets/Textformfeild/text_formfeild.dart';
import 'package:grocery_app/Screens/Login_Screen/Login/login_screen.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/login_images/front.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockWidth * 6.5,
                vertical: SizeConfig.blockHeight * 2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: SizeConfig.blockHeight * 3.5,
                      ),
                    ),
                  ),

                  SizedBox(height: SizeConfig.blockHeight * 2),

                  Image.asset(
                    'assets/login_images/lock.png',
                    height: SizeConfig.blockHeight * 25,
                    width: SizeConfig.blockWidth * 60,
                  ),

                  SizedBox(height: SizeConfig.blockHeight * 2),

                  Text(
                    "Your password must be atleast contain\na special character and 8 digit long",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: SizeConfig.blockHeight * 1.7,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: SizeConfig.blockHeight * 1.5),

                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: GoogleFonts.poppins(
                        fontSize: SizeConfig.blockHeight * 3,
                        fontWeight: FontWeight.w600,
                      ),
                      children: const [
                        TextSpan(
                          text: "Forgot ",
                          style: TextStyle(
                            color: Color.fromARGB(255, 5, 143, 47),
                          ),
                        ),
                        TextSpan(
                          text: "Password?",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: SizeConfig.blockHeight * 5),

                  // Form
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Password
                        Text(
                          'Password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.blockHeight * 1.8,
                            color: Colors.black,
                          ),
                        ),
                        LoginTextformfield(
                          hinttext: '••••••••',
                          controller: passwordController,
                          isPassword: true,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
                            } else if (value.length < 4) {
                              return 'Password must be at least 4 characters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: SizeConfig.blockHeight * 2),

                        Text(
                          'Confirm Password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.blockHeight * 1.8,
                            color: Colors.black,
                          ),
                        ),
                        LoginTextformfield(
                          hinttext: '••••••••',
                          controller: confirmPasswordController,

                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm password';
                            } else if (value != passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: SizeConfig.blockHeight * 4),

                        SizedBox(
                          width: double.infinity,
                          height: SizeConfig.blockHeight * 5.5,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                255,
                                5,
                                143,
                                47,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Password reset successful!"),
                                  ),
                                );
                                Future.delayed(const Duration(seconds: 2), () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ),
                                  );
                                });
                              }
                            },
                            child: Text(
                              "Submit",
                              style: GoogleFonts.poppins(
                                fontSize: SizeConfig.blockHeight * 1.8,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
