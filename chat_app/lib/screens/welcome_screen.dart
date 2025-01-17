import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app/components/rounded_button.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  static const String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: animation.value,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: child,
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: [
              Hero(
                tag: 'logo',
                child: SizedBox(
                  height: 60,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Flash Chat',
                    textStyle: const TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                    ),
                    speed: const Duration(milliseconds: 150),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 48.0,
          ),
          RoundedButton(
            color: Colors.lightBlueAccent,
            title: 'Log In',
            onPressed: () {
              Navigator.pushNamed(context, LoginScreen.id);
            },
          ),
          RoundedButton(
            color: Colors.blueAccent,
            title: 'Register',
            onPressed: () {
              Navigator.pushNamed(context, RegistrationScreen.id);
            },
          ),
        ],
      ),
    );
  }
}
