import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lumos/common/colors/colors.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
  });

  @override
  PasswordTextFieldState createState() => PasswordTextFieldState();
}

class PasswordTextFieldState extends State<PasswordTextField> {
  bool _isObscure = true;
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _passwordController,
      decoration: InputDecoration(
        hintStyle: GoogleFonts.lato().copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: regularBlackColor.withOpacity(0.3)),
        hintText: 'Passwort...',
        filled: true,
        fillColor: inputBgColor,
        suffixIcon: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.0), color: secondaryButtonColor),
          child: InkWell(
            borderRadius: BorderRadius.circular(25.0),
            onTap: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Icon(
                _isObscure ? Icons.visibility_sharp : Icons.visibility_off_sharp,
                size: 40,
              ),
            ),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide.none,
        ),
      ),
      obscureText: _isObscure,
    );
  }
}
