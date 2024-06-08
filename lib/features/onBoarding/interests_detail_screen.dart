import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/features/onBoarding/interests_data.dart';
import 'package:tiktok_challenge/widgets/next_button.dart';

class InterestsDetailScreen extends StatefulWidget {
  const InterestsDetailScreen({super.key, required this.selectedCategories});
  final List<String> selectedCategories;

  @override
  State<InterestsDetailScreen> createState() => _InterestsDetailScreenState();
}

class _InterestsDetailScreenState extends State<InterestsDetailScreen> {
  final Set<String> _selectedInterests = {};

  bool _isSelected(String interest) {
    if (_selectedInterests.contains(interest)) {
      return true;
    }
    return false;
  }

  void _toggleSelected(String interest) {
    if (_selectedInterests.contains(interest)) {
      _selectedInterests.remove(interest);
    } else {
      _selectedInterests.add(interest);
    }

    setState(() {});
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size20,
              horizontal: Sizes.size40,
            ),
            child: Column(
              children: [
                Text(
                  "What do you want to see on Twitter?",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Gaps.v24,
                Text(
                  "Interests are used to personalize your experience and will be visible on your profile",
                  style: GoogleFonts.openSans(
                    fontSize: Sizes.size16,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
          ),
          Gaps.v24,
          Divider(
            height: Sizes.size1,
            color: Colors.grey.shade300,
            thickness: 1,
          ),
          Gaps.v10,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 40,
              ),
              child: ListView.builder(
                itemCount: widget.selectedCategories.length,
                itemBuilder: (context, index) {
                  final category = widget.selectedCategories[index];
                  final interestCategory = interestCategories
                      .firstWhere((element) => element.category == category);
                  final subcategories = interestCategory.subcategories;
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: Sizes.size20,
                      bottom: Sizes.size10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(interestCategory.formattedCategory,
                            style: const TextStyle(
                              fontSize: Sizes.size20,
                              fontWeight: FontWeight.bold,
                            )),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width * 1.5,
                            padding: const EdgeInsets.symmetric(
                                vertical: Sizes.size20),
                            child: Wrap(
                              runSpacing: 15,
                              spacing: 15,
                              // verticalDirection: VerticalDirection.down,
                              // direction: Axis.vertical,
                              children: [
                                for (var subcategory in subcategories)
                                  GestureDetector(
                                    onTap: () => _toggleSelected(
                                        "${interestCategory.formattedCategory} $subcategory"),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: Sizes.size20,
                                        vertical: Sizes.size10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: _isSelected(
                                                "${interestCategory.formattedCategory} $subcategory")
                                            ? Theme.of(context).primaryColor
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(Sizes.size24),
                                        border: Border.all(
                                          color: Colors.grey.shade400,
                                          width: Sizes.size2,
                                        ),
                                      ),
                                      child: Text(subcategory,
                                          style: TextStyle(
                                            fontSize: Sizes.size14,
                                            color: _isSelected(
                                                    "${interestCategory.formattedCategory} $subcategory")
                                                ? Colors.white
                                                : Colors.black,
                                          )),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: Sizes.size1,
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        color: Colors.white,
        child: GestureDetector(
          // onTap: _onTap,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              NextButton(disable: false),
            ],
          ),
        ),
      ),
    );
  }
}
