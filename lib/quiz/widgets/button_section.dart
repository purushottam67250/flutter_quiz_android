import 'package:flutter/material.dart';

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
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 236, 230, 230),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 15,
          top: 15,
        ),
        child: Row(
          mainAxisAlignment: (isLast && isNextEnabled)
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceBetween,
          children: [
            if (!(isLast && isNextEnabled))
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: TextButton.icon(
                  icon: const Icon(
                    Icons.power_settings_new_rounded,
                    color: Colors.black38,
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
                      Color.fromARGB(218, 201, 200, 200),
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
                      color: Colors.black38,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            Container(
              margin: const EdgeInsets.only(right: 15),
              child: MaterialButton(
                  color: const Color(0xff107FEB),
                  disabledColor: const Color(0xff107FEB).withOpacity(0.25),
                  elevation: 5,
                  disabledElevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  textColor: Colors.black87,
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
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.next_plan_outlined,
                        color: isNextEnabled ? Colors.black87 : Colors.black26,
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
