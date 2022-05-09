import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_android/app/app_controller.dart';
import 'package:quiz_android/app/entities/app_entities.dart';
import 'package:quiz_android/app/entities/base_state.dart';
import 'package:quiz_android/app_setup/firebase/auth_controller.dart';
import 'package:quiz_android/app_setup/routes/navigator_routes.dart'
    as app_route;
import 'package:quiz_android/common/constants/color_constants.dart';
import 'package:quiz_android/common/widgets/app_container.dart';
import 'package:quiz_android/common/widgets/custom_text_field.dart';
import 'package:quiz_android/util.dart';

final loginController =
    StateNotifierProvider<AuthController, BaseState>(authController);

final signupController =
    StateNotifierProvider<AuthController, BaseState>(authController);

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool onLogin = true;

  void _toogle() {
    setState(() {
      onLogin = !onLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AppStateNotifier>(appController('session'), (prev, next) {
      if (next.state is Authenticated) {
        handleNavigation(ref, app_route.homeRoute);
      }
    });
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white.withOpacity(0.85),
      body: Column(
        children: [
          Flexible(
            child: Center(
              child: onLogin
                  ? Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Image.asset('assets/images/login.png'),
                    )
                  : Image.asset('assets/images/signup.png'),
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
                child: onLogin
                    ? LoginView(
                        onToogle: _toogle,
                      )
                    : SignupView(
                        onToogle: _toogle,
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SignupView extends ConsumerStatefulWidget {
  const SignupView({
    Key? key,
    required this.onToogle,
  }) : super(key: key);

  final Function() onToogle;

  @override
  ConsumerState createState() => _SignupViewState();
}

class _SignupViewState extends ConsumerState<SignupView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final nameErrorNotifier = ValueNotifier('');
  final passwordErrorNotifier = ValueNotifier('');
  final emailErrorNotifier = ValueNotifier('');

  bool _validate() {
    bool isValid = true;
    if (nameController.value.text.isEmpty) {
      nameErrorNotifier.value = 'Enter full name to register.';
      isValid = false;
    }
    if (emailController.value.text.isEmpty) {
      emailErrorNotifier.value = 'Email field is required.';
      isValid = false;
    }
    if (passwordController.value.text.isEmpty) {
      passwordErrorNotifier.value = 'Password must not be empty.';
      isValid = false;
    }
    if (passwordController.value.text.length < 8) {
      passwordErrorNotifier.value = 'Password must be at least 8 characters.';
      isValid = false;
    }
    return isValid;
  }

  void _signUp() {
    if (!_validate()) return;
    ref.read(signupController.notifier).signUp(
          email: 'email@gmail.com',
          password: 'password',
        );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
              CustomInputFieldWithLabel(
                hintText: 'Your full name',
                label: 'Full Name',
                controller: nameController,
                errorNotifier: nameErrorNotifier,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomInputFieldWithLabel(
                hintText: 'Your email id',
                label: 'Email',
                controller: emailController,
                errorNotifier: emailErrorNotifier,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomInputFieldWithLabel(
                hintText: 'Password',
                label: 'Password',
                controller: passwordController,
                errorNotifier: passwordErrorNotifier,
                isSecret: true,
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: _signUp,
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
                      'Sign Up'.toUpperCase(),
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
                height: 10,
              ),
              TextButton(
                onPressed: widget.onToogle,
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 12,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? Sign-in',
                      style: GoogleFonts.adventPro(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black.withAlpha(150),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class LoginView extends ConsumerStatefulWidget {
  const LoginView({
    Key? key,
    required this.onToogle,
  }) : super(key: key);

  final Function() onToogle;

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordErrorNotifier = ValueNotifier('');
  final emailErrorNotifier = ValueNotifier('');

  bool _validate() {
    bool isValid = true;
    if (emailController.value.text.isEmpty) {
      emailErrorNotifier.value = 'Email field is required.';
      isValid = false;
    }
    if (passwordController.value.text.isEmpty) {
      passwordErrorNotifier.value = 'Password must not be empty.';
      isValid = false;
    }
    return isValid;
  }

  void _signIn() {
    if (!_validate()) return;
    ref.read(loginController.notifier).signIn(
          email: 'email@gmail.com',
          password: 'password',
        );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginController);
    final isLoading = state == BaseState<bool>.loading();
    return Column(
      mainAxisSize: MainAxisSize.min,
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
              CustomInputFieldWithLabel(
                hintText: 'Your email id',
                label: 'Email',
                controller: emailController,
                errorNotifier: emailErrorNotifier,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomInputFieldWithLabel(
                hintText: 'Password',
                label: 'Password',
                controller: passwordController,
                errorNotifier: passwordErrorNotifier,
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
                onPressed: _signIn,
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
                child: isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Row(
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
                height: 10,
              ),
              TextButton(
                onPressed: widget.onToogle,
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 12,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? Sign-up',
                      style: GoogleFonts.adventPro(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black.withAlpha(150),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
