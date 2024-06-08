import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/features/send_code_screen.dart';
import 'package:tiktok_challenge/widgets/form_button.dart';

class TermsAgreementScreen extends StatefulWidget {
  const TermsAgreementScreen({
    super.key,
    this.initialFormData,
    this.isReturning = false,
  });

  final Map<String, String>? initialFormData;
  final bool isReturning;

  @override
  State<TermsAgreementScreen> createState() => _TermsAgreementScreenState();
}

class _TermsAgreementScreenState extends State<TermsAgreementScreen> {
  final Map<String, String> _formData = {};

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();

  void _onCancelTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onSubmitTap() {
    print(_formData);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>
          SendCodeScreen(emailAdress: _formData["email"] ?? ''),
    ));
  }

  void _initializeFormData() {
    if (widget.initialFormData != null) {
      _formData.addAll(widget.initialFormData!);
      _usernameController.text = _formData["username"] ?? '';
      _emailController.text = _formData["email"] ?? '';
      _birthdayController.text = _formData["birthday"] ?? '';
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _initializeFormData();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () => _onCancelTap(context),
            child: const Text(
              "Cancel",
            ),
          ),
        ),
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
              "Create your account",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Gaps.v32,
            TextField(
              controller: _usernameController,
              cursorColor: Theme.of(context).primaryColor,
              keyboardType: TextInputType.emailAddress,
              decoration: customInputDecoration(
                hintText: "Name",
                suffixIcon: const FaIcon(FontAwesomeIcons.circleCheck,
                    color: Colors.green),
              ),
            ),
            TextField(
              controller: _emailController,
              cursorColor: Theme.of(context).primaryColor,
              keyboardType: TextInputType.emailAddress,
              decoration: customInputDecoration(
                hintText: "Email",
                suffixIcon: const FaIcon(FontAwesomeIcons.circleCheck,
                    color: Colors.green),
              ),
            ),
            TextField(
              controller: _birthdayController,
              readOnly: true,
              // onTap: _showDatePicker,
              cursorColor: Theme.of(context).primaryColor,
              keyboardType: TextInputType.none,
              decoration: customInputDecoration(
                hintText: "Date of Birth ",
                suffixIcon: const FaIcon(
                  FontAwesomeIcons.circleCheck,
                  color: Colors.green,
                ),
              ),
            ),
            termsForSignup(context),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        child: GestureDetector(
            onTap: _onSubmitTap,
            child: Container(
              margin: const EdgeInsets.all(Sizes.size20),
              child: const FormButton(
                text: "Sign Up",
                disable: true,
              ),
            )),
      ),
    );
  }

  Column termsForSignup(BuildContext context) {
    return Column(
      children: [
        Gaps.v96,
        Gaps.v32,
        RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: Sizes.size18,
              color: Colors.black54,
            ),
            children: [
              const TextSpan(text: "By signing up, you agree to our "),
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
              const TextSpan(
                text:
                    "Twitter may use your contact information, including your email adress and phone number for purpose outlined in our Privacy Policy.",
              ),
              TextSpan(
                text: " Learn more",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const TextSpan(
                text:
                    " Others will be able to find you by email or phone number, when provided, unless you choose otherwise ",
              ),
              TextSpan(
                text: " here",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  InputDecoration customInputDecoration({
    String? hintText,
    FaIcon? suffixIcon,
    String? errorText,
  }) {
    return InputDecoration(
      suffix: suffixIcon,
      labelText: hintText,
      hintText: hintText,
      hintStyle: TextStyle(
        fontSize: Sizes.size14,
        fontWeight: FontWeight.normal,
        color: Colors.grey.shade400,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade400,
        ),
      ),
      errorText: errorText,
      errorMaxLines: 4,
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade400,
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade400,
        ),
      ),
    );
  }
}
