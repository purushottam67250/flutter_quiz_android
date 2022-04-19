import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_android/common/constants/color_constants.dart';
import 'package:quiz_android/common/widgets/app_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
    this.showSplash = false,
  }) : super(key: key);

  final bool showSplash;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white.withOpacity(0.85),
      body: Stack(
        children: [
          Column(
            children: [
              Flexible(
                child: Center(
                  child: Image.network(
                    'https://imgs.search.brave.com/dL1E962gmuzuTpEqARW7Wi9L3eFfUiJTmFZWoe0ADBQ/rs:fit:450:450:1/g:ce/aHR0cHM6Ly9jZG5p/Lmljb25zY291dC5j/b20vaWxsdXN0cmF0/aW9uL3ByZW1pdW0v/dGh1bWIvdXNlci1z/aG93aW5nLXVzZXIt/bG9naW4tcGFnZS1p/bi13ZWJzaXRlLW9y/LWFwcGxpY2F0aW9u/LTE4ODY1MjctMTU5/NzkzOC5wbmc',
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // white card starts here
                  AppContainer(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomInputFieldWithLabel(
                                hintText: 'Your email id',
                                label: 'Email',
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const CustomInputFieldWithLabel(
                                hintText: 'Password',
                                label: 'Password',
                                isSecret: true,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Forget password?',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Colors.black.withAlpha(150),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextButton(
                                onPressed: () {
                                  //
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    ColorConstants.backgroundColor,
                                  ),
                                  padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                      horizontal: 25,
                                      vertical: 12,
                                    ),
                                  ),
                                  shape: MaterialStateProperty.all(
                                    const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                    ),
                                  ),
                                  elevation: MaterialStateProperty.all(2),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Log In'.toUpperCase(),
                                      style: GoogleFonts.adventPro(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account? Sign-up",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Colors.black.withAlpha(150),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (widget.showSplash)
            Material(
              color: Colors.black54,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AppContainer(
                  color: Colors.white,
                  margin: const EdgeInsets.only(
                    bottom: 40,
                  ),
                  height: 150,
                  width: screenSize.width - 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator(
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Verifying user data...'.toUpperCase(),
                        style: GoogleFonts.adventPro(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
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

class CustomInputFieldWithLabel extends StatelessWidget {
  const CustomInputFieldWithLabel({
    Key? key,
    required this.hintText,
    required this.label,
    this.isSecret = false,
  }) : super(key: key);

  final String hintText;
  final String label;
  final bool isSecret;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.philosopher(
            textStyle: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Colors.grey[800],
            ),
          ),
        ),
        TextField(
          style: GoogleFonts.philosopher(
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          obscureText: isSecret,
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
            suffixIcon: isSecret
                ? const FaIcon(
                    FontAwesomeIcons.solidEye,
                  )
                : null,
            hintText: hintText,
            border: const UnderlineInputBorder(),
            enabledBorder: const UnderlineInputBorder(),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.purpleAccent,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
