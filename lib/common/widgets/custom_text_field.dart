import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputFieldWithLabel extends StatelessWidget {
  const CustomInputFieldWithLabel({
    Key? key,
    required this.hintText,
    required this.label,
    required this.controller,
    this.errorNotifier,
    this.isSecret = false,
  }) : super(key: key);

  final String hintText;
  final String label;
  final bool isSecret;
  final TextEditingController controller;
  final ValueNotifier<String>? errorNotifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.philosopher(
            textStyle: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.grey[800],
            ),
          ),
        ),
        TextFormField(
          controller: controller,
          style: GoogleFonts.philosopher(
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          onChanged: (text) {
            if (errorNotifier?.value.isNotEmpty ?? false) {
              errorNotifier!.value = '';
            }
          },
          obscureText: isSecret,
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
            isDense: true,
            // suffixIcon: isSecret
            //     ? const FaIcon(
            //         FontAwesomeIcons.solidEye,
            //       )
            //     : null,
            hintText: hintText,
            border: const UnderlineInputBorder(),
            enabledBorder: const UnderlineInputBorder(),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.purpleAccent,
              ),
            ),
          ),
        ),
        if (errorNotifier != null)
          ValueListenableBuilder<String>(
            valueListenable: errorNotifier!,
            builder: (context, error, child) {
              if (error.isEmpty) return const SizedBox();
              return Container(
                margin: EdgeInsets.only(
                  top: 10,
                ),
                child: Text(
                  error,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.red[800],
                    ),
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}
