import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/Commonwidgets/Resolution/screensize.dart';
import 'package:grocery_app/Commonwidgets/Textformfeild/text_formfeild.dart';
import 'package:grocery_app/Screens/Login_Screen/Forgotscreen/reset_password.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final resetEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 8, 172, 68),

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
                      child: Container(
                        padding: EdgeInsets.all(SizeConfig.blockHeight * 1),

                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: SizeConfig.blockHeight * 3.5,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: SizeConfig.blockHeight * 2),

                  Image.asset(
                    'assets/login_images/forgot.png',
                    height: SizeConfig.blockHeight * 28,
                    width: SizeConfig.blockWidth * 60,
                  ),

                  SizedBox(height: SizeConfig.blockHeight * 8),

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

                  SizedBox(height: SizeConfig.blockHeight * 2),

                  Text(
                    "Enter your email to receive a password\n reset link",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: SizeConfig.blockHeight * 1.7,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: SizeConfig.blockHeight * 10),

                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.blockHeight * 1.8,
                            color: Colors.black,
                          ),
                        ),
                        LoginTextformfield(
                          hinttext: 'example@gmail.com',
                          controller: resetEmailController,
                          isPassword: false,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the email address';
                            } else if (!RegExp(
                              r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
                            ).hasMatch(value)) {
                              return 'Please enter a valid email address';
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
                                    backgroundColor: Colors.green,
                                    content: Text(
                                      "Password reset link sent to your email",
                                    ),
                                  ),
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ResetPassword(),
                                  ),
                                );
                              }
                            },
                            child: Text(
                              "Reset Password",
                              style: GoogleFonts.poppins(
                                fontSize: SizeConfig.blockHeight * 1.8,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.blockHeight * 3),
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
