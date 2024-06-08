import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/features/onBoarding/interests_detail_screen.dart';
import 'package:tiktok_challenge/features/onBoarding/interests_data.dart';
import 'package:tiktok_challenge/widgets/next_button.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({
    super.key,
  });

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final Set<String> _selectedInterests = {};
  final ScrollController _scrollController = ScrollController();
  bool _isSelected = false;

  void _toggleSelected(String interest) {
    if (_selectedInterests.contains(interest)) {
      _selectedInterests.remove(interest);
    } else {
      _selectedInterests.add(interest);
    }
    if (_selectedInterests.length >= 3) {
      _isSelected = true;
    } else {
      _isSelected = false;
    }
    setState(() {});
  }

  void _onTap() {
    print(_selectedInterests);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => InterestsDetailScreen(
          selectedCategories: _selectedInterests.toList()),
    ));
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
        padding: const EdgeInsets.only(
          bottom: Sizes.size80,
        ),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size40,
                  ),
                  child: Text(
                    "What do you want to see on Twitter?",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Gaps.v24,
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size40,
                  ),
                  child: Text(
                    "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile",
                    style: GoogleFonts.openSans(
                      fontSize: Sizes.size18,
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
                Gaps.v24,
                Divider(
                  height: Sizes.size1,
                  color: Colors.grey.shade300,
                  thickness: 1,
                ),
                Gaps.v24,
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size24,
                  ),
                  child: Wrap(
                    runSpacing: 15,
                    spacing: 20,
                    children: [
                      for (var category in interestCategories)
                        GestureDetector(
                          onTap: () => _toggleSelected(category.category),
                          child: Stack(
                            children: [
                              Container(
                                width: 160,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: _selectedInterests
                                          .contains(category.category)
                                      ? Theme.of(context).primaryColor
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(
                                    Sizes.size10,
                                  ),
                                  border: Border.all(color: Colors.black26),
                                ),
                                child: Container(
                                  alignment: Alignment.bottomLeft,
                                  padding: const EdgeInsets.only(
                                    bottom: Sizes.size10,
                                    left: Sizes.size10,
                                  ),
                                  child: Text(
                                    category.category,
                                    style: TextStyle(
                                      fontSize: Sizes.size16,
                                      color: _selectedInterests
                                              .contains(category.category)
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              if (_selectedInterests
                                  .contains(category.category))
                                Positioned(
                                  right: 10,
                                  top: 10,
                                  child: Container(
                                    padding: const EdgeInsets.all(Sizes.size4),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: FaIcon(
                                      FontAwesomeIcons.check,
                                      color: Theme.of(context).primaryColor,
                                      size: Sizes.size10,
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.only(
          left: Sizes.size28,
        ),
        color: Colors.white,
        child: GestureDetector(
          onTap: _isSelected ? _onTap : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _isSelected
                  ? const Text("Greate Work")
                  : Text("${_selectedInterests.length} of 3 selected"),
              NextButton(disable: !_isSelected),
            ],
          ),
        ),
      ),
    );
  }
}
