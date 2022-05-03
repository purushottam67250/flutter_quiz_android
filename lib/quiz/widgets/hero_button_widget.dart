import 'package:flutter/material.dart';
import 'package:quiz_android/common/constants/color_constants.dart';

class HeroButtonWidget extends StatelessWidget {
  const HeroButtonWidget({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.iconData,
    required this.color,
  }) : super(key: key);

  final String label;
  final VoidCallback onPressed;
  final IconData iconData;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final buttonSize = screenSize.width / 8;
    return Column(
      children: [
        Hero(
          tag: 'review',
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(
                buttonSize / 2,
              ),
              onTap: onPressed,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  buttonSize / 2,
                ),
                child: Container(
                  width: buttonSize,
                  height: buttonSize,
                  color: color,
                  child: Icon(
                    iconData,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: TextStyle(
            color: ColorConstants.backgroundColorWhite,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.iconData,
    required this.color,
  }) : super(key: key);

  final String label;
  final Function() onPressed;
  final IconData iconData;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final buttonSize = screenSize.width / 8;
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              buttonSize / 2,
            ),
            child: Container(
              width: buttonSize,
              height: buttonSize,
              color: color,
              child: Icon(
                iconData,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: TextStyle(
            color: ColorConstants.backgroundColorWhite,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
