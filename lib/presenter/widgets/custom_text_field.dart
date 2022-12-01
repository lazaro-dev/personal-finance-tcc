import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool? disabledAutovalidate;
  final bool? obscureText;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onSaved;

  const CustomTextField({
    super.key,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.validator,
    this.onSaved,
    this.disabledAutovalidate,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Theme.of(context).primaryColor,
      autovalidateMode: disabledAutovalidate == true
          ? null
          : AutovalidateMode.onUserInteraction,
      obscureText: obscureText ?? false,
      onSaved: onSaved,
      validator: validator,
      decoration: InputDecoration(
        floatingLabelStyle: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
        labelText: label,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        // enabled: true,
        prefixIcon: Icon(
          prefixIcon == null ? null : (prefixIcon),
          color: Theme.of(context).primaryColor,
        ),
        suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
        hintText: hintText,
      ),
      textAlignVertical: TextAlignVertical.center,
    );
    // return Container(
    //   // decoration: BoxDecoration(
    //   //   shape: BoxShape.rectangle,
    //   //   color: Colors.grey[200],
    //   //   borderRadius: BorderRadius.circular(32),
    //   // ),
    //   child: TextFormField(
    //     autovalidateMode: disabledAutovalidate == true
    //         ? null
    //         : AutovalidateMode.onUserInteraction,
    //     obscureText: obscureText ?? false,
    //     onSaved: onSaved,
    //     validator: validator,
    //     decoration: InputDecoration(
    //       // contentPadding:
    //       //     const EdgeInsets.only(left: 11, right: 3, top: 5, bottom: 1),
    //       // errorBorder: const OutlineInputBorder(),
    //       // errorStyle: const TextStyle(
    //       //   height: 2,
    //       //   // fontSize: 9,
    //       // ),
    //       labelText: label,
    //       // border: InputBorder.none,
    //       border: const UnderlineInputBorder(),
    //       // enabled: true,
    //       prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
    //       suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
    //       hintText: hintText,
    //     ),
    //     textAlignVertical: TextAlignVertical.center,
    //   ),
    // );
  }
}
