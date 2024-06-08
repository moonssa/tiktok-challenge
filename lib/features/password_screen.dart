import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/features/onBoarding/interests_screen.dart';
import 'package:tiktok_challenge/widgets/form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  String _password = "";

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length > 8;
  }

  void _onSubmitTap() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const InterestsScreen(),
      ),
      (Route<dynamic> route) => false, // 이 조건이 false이면 모든 이전 화면을 제거
    );
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      print(_passwordController.text);
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: FaIcon(
            FontAwesomeIcons.twitter,
            color: Theme.of(context).primaryColor,
            size: Sizes.size32,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size40,
            vertical: Sizes.size20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "You'll need a password",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -1,
                ),
              ),
              Gaps.v24,
              Text(
                "Make sure it's 8 characters ot more.",
                style: GoogleFonts.openSans(
                  fontSize: Sizes.size18,
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.5,
                ),
              ),
              Gaps.v48,
              TextField(
                controller: _passwordController,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: "Password",
                  labelStyle: TextStyle(
                    fontSize: Sizes.size18,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade400,
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  )),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _toggleObscureText,
                        child: FaIcon(
                          _obscureText
                              ? FontAwesomeIcons.eyeSlash
                              : FontAwesomeIcons.eye,
                          color: Colors.grey.shade500,
                          size: Sizes.size18,
                        ),
                      ),
                      Gaps.h6,
                      FaIcon(
                        FontAwesomeIcons.circleCheck,
                        color: _isPasswordValid()
                            ? Colors.green
                            : Colors.grey.shade500,
                        size: Sizes.size20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: Sizes.size20),
          child: GestureDetector(
            onTap: _onSubmitTap,
            child: Container(
              margin: const EdgeInsets.only(
                  bottom: Sizes.size20,
                  top: Sizes.size10,
                  left: Sizes.size28,
                  right: Sizes.size28),
              child: FormButton(
                text: "Next",
                disable: !_isPasswordValid(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
