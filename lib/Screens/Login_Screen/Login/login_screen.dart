import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/Commonwidgets/Resolution/screensize.dart';
import 'package:grocery_app/Commonwidgets/Textformfeild/text_formfeild.dart';
import 'package:grocery_app/Screens/Home_screens/botttom_nav.dart';
import 'package:grocery_app/Screens/Login_Screen/CreateAccount/Create_account.dart';
import 'package:grocery_app/Screens/Login_Screen/Forgotscreen/forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isFieldsReadOnly = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
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
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockWidth * 6.5,
              ),
              child: Form(
                key: _loginKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: SizeConfig.blockHeight * 3.4),
                    SizedBox(
                      height: SizeConfig.blockHeight * 28,
                      width: SizeConfig.blockWidth * 90,
                      child: Image.asset(
                        'assets/login_images/create_screen.png',
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: GoogleFonts.poppins(
                          fontSize: SizeConfig.blockHeight * 3.8,
                          fontWeight: FontWeight.w600,
                        ),
                        children: const [
                          TextSpan(
                            text: "Hello ",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 5, 143, 47),
                            ),
                          ),
                          TextSpan(
                            text: "Again!",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      " Log In and enjoy your Shopping",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: SizeConfig.blockHeight * 1.8,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: SizeConfig.blockHeight * 4.5),

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
                      hinttext: 'Example@gmail.com',
                      controller: emailController,
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
                    SizedBox(height: SizeConfig.blockHeight * 3),
                    Row(
                      children: [
                        Text(
                          'Password',
                          style: TextStyle(
                            fontSize: SizeConfig.blockHeight * 1.8,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    LoginTextformfield(
                      controller: passwordController,
                      hinttext: '@123456',
                      isPassword: true,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: SizeConfig.blockHeight * .8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Forgot password?",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: SizeConfig.blockHeight * 1.7,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.blockHeight * 2),
                    Center(
                      child: SizedBox(
                        width: SizeConfig.blockWidth * 85,
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
                            if (_loginKey.currentState?.validate() ?? false) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            }
                          },
                          child: Text(
                            "Log In",
                            style: GoogleFonts.poppins(
                              fontSize: SizeConfig.blockHeight * 1.8,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
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
                        SizedBox(height: SizeConfig.blockHeight * 1.5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'New User?',
                              style: GoogleFonts.poppins(
                                fontSize: SizeConfig.blockHeight * 1.7,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => const CreateAccount(),
                                  ),
                                  (route) => false,
                                );
                              },
                              child: Text(
                                'Create Account',
                                style: GoogleFonts.poppins(
                                  fontSize: SizeConfig.blockHeight * 1.8,
                                  color: const Color.fromARGB(255, 5, 143, 47),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//  onPressed: () async {
//                             if (_loginKey.currentState?.validate() ?? false) {
//                               final authProvider = Provider.of<AuthProvider>(
//                                 context,
//                                 listen: false,
//                               );

//                               final success = await authProvider.login(
//                                 emailController.text.trim(),
//                                 passwordController.text.trim(),
//                               );

//                               if (success) {
//                                 Navigator.of(context).pushReplacement(
//                                   MaterialPageRoute(
//                                     builder: (context) => HomeScreen(),
//                                   ),
//                                 );
//                               } else {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(
//                                     content: Text(
//                                       authProvider.errorMessage ??
//                                           "Login failed",
//                                     ),
//                                   ),
//                                 );
//                               }
//                             }
//                           },
