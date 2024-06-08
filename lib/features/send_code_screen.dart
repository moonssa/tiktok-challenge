import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/features/password_screen.dart';
import 'package:tiktok_challenge/widgets/form_button.dart';

const int CODE_SIZE = 6;

class SendCodeScreen extends StatefulWidget {
  const SendCodeScreen({super.key, required this.emailAdress});
  final String emailAdress;

  @override
  State<SendCodeScreen> createState() => _SendCodeScreenState();
}

class _SendCodeScreenState extends State<SendCodeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<int> _formData = List.filled(CODE_SIZE, 0);
  final List<TextEditingController> _controllers =
      List.generate(CODE_SIZE, (_) => TextEditingController());

  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  bool _isFormValid = false;

  void _checkFormValid() {
    _isFormValid =
        _controllers.every((controller) => controller.text.isNotEmpty);
    setState(() {});
  }

  void _onSubmitTap() {
    _formKey.currentState?.save();
    print(_formData);
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const PasswordScreen(),
      ),
      (Route<dynamic> route) => false, // 이 조건이 false이면 모든 이전 화면을 제거
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Gaps.v36,
            Text(
              "We sent you a code",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Gaps.v24,
            Text(
              "Enter it below to varify\n${widget.emailAdress}",
              style: GoogleFonts.openSans(
                fontSize: Sizes.size20,
                color: Colors.black54,
                fontWeight: FontWeight.w400,
              ),
            ),
            Gaps.v28,
            Form(
              key: _formKey,
              child: Row(
                children: [
                  for (var i = 0; i < 6; i++) ...[
                    Expanded(
                      child: TextFormField(
                        controller: _controllers[i],
                        focusNode: _focusNodes[i],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: Sizes.size24,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 3,
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 3,
                            ),
                          ),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(1),
                        ],
                        onChanged: (value) {
                          if (value.length == 1) {
                            if (i < CODE_SIZE - 1) {
                              FocusScope.of(context)
                                  .requestFocus(_focusNodes[i + 1]);
                            } else {
                              _focusNodes[i].unfocus();
                            }
                          }
                          _checkFormValid();
                        },
                        onSaved: (newValue) {
                          if (newValue != null && newValue.isNotEmpty) {
                            _formData[i] = int.parse(newValue);
                          }
                        },
                      ),
                    ),
                    if (i < 5) Gaps.h12,
                  ],
                ],
              ),
            ),
            Gaps.v32,
            if (_isFormValid)
              Container(
                alignment: Alignment.center,
                child: const FaIcon(
                  FontAwesomeIcons.circleCheck,
                  color: Colors.green,
                ),
              )
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
              child: Text(
                "Din't receive email?",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: Sizes.size18,
                ),
              ),
            ),
            GestureDetector(
                onTap: _onSubmitTap,
                child: Container(
                  margin: const EdgeInsets.only(
                      bottom: Sizes.size20,
                      top: Sizes.size10,
                      left: Sizes.size28,
                      right: Sizes.size28),
                  child: FormButton(
                    text: "Next",
                    disable: !_isFormValid,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
