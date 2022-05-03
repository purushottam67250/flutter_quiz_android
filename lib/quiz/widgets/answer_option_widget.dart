import 'package:flutter/material.dart';
import 'package:quiz_android/common/constants/color_constants.dart';
import 'package:quiz_android/common/widgets/app_container.dart';

class AnswerOptionWidget extends StatelessWidget {
  const AnswerOptionWidget({
    Key? key,
    required this.option,
    required this.selected,
    required this.onSelection,
  }) : super(key: key);

  final String option;
  final bool selected;
  final VoidCallback onSelection;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return AppContainer(
      onPressed: (_) {
        onSelection();
      },
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      width: screenSize.width,
      transparentBackground: true,
      blurRadius: 1,
      spreadRadius: 1,
      radius: 25,
      shadowColor: selected ? ColorConstants.primaryBlue50 : null,
      child: AppContainer(
        margin: const EdgeInsets.all(2),
        noShadow: true,
        radius: 25,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          child: Text(
            option,
            maxLines: 5,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
