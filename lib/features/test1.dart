import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/features/customize_screen.dart';
import 'package:tiktok_challenge/widgets/form_button.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({
    super.key,
    this.initialFormData,
    this.isReturning = false,
  });

  final Map<String, String>? initialFormData;
  final bool isReturning;

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  final Map<String, String> _formData = {};
  bool _isNameValid = false;
  bool _isEmailValid = false;
  bool _isBirthdayValid = false;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();

  DateTime initialDate = DateTime.now();
  late DateTime twelveYearsAgo =
      DateTime(initialDate.year - 12, initialDate.month, initialDate.day);

  void _onCancelTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onSubmitTap() {
    print(_formData);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CustomizeExperienceScreen(
        formData: _formData,
      ),
    ));
  }

  String? _validateName(String value) {
    final nameRegex = RegExp(r'^[a-zA-Z0-9]{5,}$');
    if (value.isEmpty) {
      return "";
    }
    if (!nameRegex.hasMatch(value)) {
      return "Name 필드는 적어도 5자 이상 이어야 합니다.";
    }
    return null;
  }

  String? _validateEmail(String value) {
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value.isEmpty) {
      return "";
    }
    if (!regExp.hasMatch(value)) {
      return "유효한 이메일 어드레스를 적어주세요.";
    }
    return null;
  }

  String? _validateBirthday(String value) {
    if (value.isEmpty) {
      return "";
    }
    final DateTime birthDate = DateTime.parse(value);
    if (birthDate.isAfter(twelveYearsAgo)) {
      return "회원가입은 12세 이상만 가능합니다.\n This will not be shown publicly. Comfirm your own age, even if this account is for a business, a pet, or something else";
    }
    return null;
  }

  bool _validateForm() {
    return _isNameValid && _isEmailValid && _isBirthdayValid;
  }

  void _showDatePicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            SizedBox(
              height: 250,
              child: CupertinoDatePicker(
                maximumDate: initialDate,
                initialDateTime: initialDate,
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: _setTextFieldDate,
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: GestureDetector(
                onTap: _validateForm() ? _onSubmitTap : null,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.size12,
                    horizontal: Sizes.size24,
                  ),
                  decoration: BoxDecoration(
                    color:
                        _validateForm() ? Colors.black : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(Sizes.size24),
                    border: Border.all(
                      color: Colors.grey.shade200,
                      width: Sizes.size1,
                    ),
                  ),
                  child: const Text(
                    "Next",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.text = textDate;
    setState(() {
      _formData["birthday"] = textDate;
      _isBirthdayValid = _validateBirthday(textDate) == null;
      _validateForm();
    });
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
                suffixIcon: FaIcon(
                  FontAwesomeIcons.circleCheck,
                  color: _isNameValid ? Colors.green : Colors.grey.shade400,
                ),
                errorText: _isNameValid
                    ? null
                    : _validateName(_usernameController.text),
              ),
              onChanged: (value) {
                setState(() {
                  _isNameValid = _validateName(value) == null;
                  _formData["username"] = value;
                });
              },
            ),
            TextField(
              controller: _emailController,
              cursorColor: Theme.of(context).primaryColor,
              keyboardType: TextInputType.emailAddress,
              decoration: customInputDecoration(
                hintText: "Email",
                suffixIcon: FaIcon(
                  FontAwesomeIcons.circleCheck,
                  color: _isEmailValid ? Colors.green : Colors.grey.shade400,
                ),
                errorText: _isEmailValid
                    ? null
                    : _validateEmail(_emailController.text),
              ),
              onChanged: (value) {
                setState(() {
                  _isEmailValid = _validateEmail(value) == null;
                  _formData["email"] = value;
                });
              },
            ),
            TextField(
              controller: _birthdayController,
              readOnly: true,
              onTap: _showDatePicker,
              cursorColor: Theme.of(context).primaryColor,
              keyboardType: TextInputType.none,
              decoration: customInputDecoration(
                hintText: "Date of Birth ",
                suffixIcon: FaIcon(
                  FontAwesomeIcons.circleCheck,
                  color: _isBirthdayValid ? Colors.green : Colors.grey.shade400,
                ),
                errorText: _isBirthdayValid
                    ? null
                    : _validateBirthday(_birthdayController.text),
              ),
              onChanged: (value) {
                setState(() {
                  _isBirthdayValid = _validateBirthday(value) == null;
                  _formData["birthday"] = value;
                });
              },
            ),
            widget.isReturning ? sign(context) : const Text(""),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        child: GestureDetector(
          onTap: _validateForm() ? _onSubmitTap : null,
          child: widget.isReturning
              ? Container(
                  margin: const EdgeInsets.all(Sizes.size20),
                  child: const FormButton(
                    text: "Sign Up",
                    btnSize: 1,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(Sizes.size24),
                      padding: const EdgeInsets.symmetric(
                        vertical: Sizes.size12,
                        horizontal: Sizes.size24,
                      ),
                      decoration: BoxDecoration(
                        color: _validateForm()
                            ? Colors.black
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(Sizes.size24),
                        border: Border.all(
                          color: Colors.grey.shade200,
                          width: Sizes.size1,
                        ),
                      ),
                      child: const Text(
                        "Next",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Column sign(BuildContext context) {
    return Column(
      children: [
        Gaps.v96,
        Gaps.v96,
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

  InputDecoration customInputDecoration(
      {String? hintText, FaIcon? suffixIcon, String? errorText}) {
    return InputDecoration(
      suffix: suffixIcon,
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
