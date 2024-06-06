import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/features/create_user_screen.dart';
import 'package:tiktok_challenge/widgets/auth_button.dart';
import 'package:tiktok_challenge/widgets/form_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  _onSignupTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const CreateUserScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size40,
          ),
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.only(top: Sizes.size10),
                  alignment: Alignment.topCenter,
                  child: FaIcon(
                    FontAwesomeIcons.twitter,
                    color: Theme.of(context).primaryColor,
                    size: Sizes.size32,
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.only(top: Sizes.size32),
                  alignment: Alignment.topCenter,
                  child: Text(
                    "See What's happening in the world right now.",
                    style: Theme.of(context).textTheme.headlineSmall,
                    // style: TextStyle(
                    //   fontSize: Sizes.size32,
                    // ),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      const AuthButton(
                        icon: FaIcon(
                          FontAwesomeIcons.google,
                        ),
                        text: "Continue with Google",
                      ),
                      Gaps.v12,
                      const AuthButton(
                        icon:
                            FaIcon(FontAwesomeIcons.apple, size: Sizes.size28),
                        text: "Continue with Appple",
                      ),
                      Gaps.v12,
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin:
                                  const EdgeInsets.only(right: Sizes.size10),
                              child: Divider(
                                height: Sizes.size1,
                                color: Colors.grey.shade300,
                                thickness: 1,
                              ),
                            ),
                          ),
                          const Text("Or"),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: Sizes.size10),
                              child: Divider(
                                height: Sizes.size1,
                                color: Colors.grey.shade200,
                                thickness: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gaps.v12,
                      GestureDetector(
                        onTap: () => _onSignupTap(context),
                        child: const FormButton(
                          text: "Create Account",
                          reverse: false,
                        ),
                      ),
                      Gaps.v32,
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: Sizes.size16,
                            color: Colors.black54,
                          ),
                          children: [
                            const TextSpan(
                                text: "By signing up, you agree to our "),
                            TextSpan(
                              text: "Terms",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            const TextSpan(text: ", "),
                            TextSpan(
                              text: " Privacy Policy",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            const TextSpan(text: ", and"),
                            TextSpan(
                              text: " Cookie Use",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            const TextSpan(text: "."),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.only(
          bottom: Sizes.size52,
          left: Sizes.size40,
          right: Sizes.size40,
        ),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Have an Account already?",
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.black26,
              ),
            ),
            Gaps.h10,
            GestureDetector(
              onTap: () => _onSignupTap(context),
              child: Text(
                "Log in",
                style: TextStyle(
                    fontSize: Sizes.size16,
                    color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
