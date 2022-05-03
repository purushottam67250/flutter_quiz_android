import 'package:flutter/material.dart';
import 'package:quiz_android/common/constants/color_constants.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
    required this.isNextEnabled,
    required this.onNext,
    required this.onQuit,
    required this.isLast,
  }) : super(key: key);

  final bool isNextEnabled;
  final Function() onNext;
  final Function() onQuit;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 20,
          top: 20,
        ),
        child: Row(
          mainAxisAlignment: (isLast && isNextEnabled)
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceBetween,
          children: [
            if (!(isLast && isNextEnabled))
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: TextButton.icon(
                  icon: const Icon(
                    Icons.power_settings_new_rounded,
                    color: Colors.white,
                    size: 25,
                  ),
                  onPressed: onQuit,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            20,
                          ),
                        ),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      ColorConstants.pink,
                    ),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                  ),
                  label: const Text(
                    'Quit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: MaterialButton(
                  color: ColorConstants.primaryBlue,
                  disabledColor: ColorConstants.primaryBlue50,
                  elevation: 5,
                  disabledElevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  textColor: Colors.white,
                  disabledTextColor: Colors.black38,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        20,
                      ),
                    ),
                  ),
                  onPressed: isNextEnabled ? onNext : null,
                  child: Row(
                    children: [
                      Text(
                        isLast ? 'Score' : 'Next',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: isNextEnabled ? Colors.white : Colors.white70,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.next_plan_outlined,
                        color: isNextEnabled ? Colors.white : Colors.white70,
                        size: 25,
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
