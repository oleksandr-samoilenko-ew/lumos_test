import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lumos/common/colors/colors.dart';

class PasswordDialog extends StatefulWidget {
  final String networkName;

  const PasswordDialog({
    super.key,
    required this.networkName,
  });

  @override
  State<PasswordDialog> createState() => _PasswordDialogState();
}

class _PasswordDialogState extends State<PasswordDialog> {
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mit einem WLAN verbinden",
                    style: GoogleFonts.lato().copyWith(fontSize: 24, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "Das Gerät versucht sich mit zu verbinden mit: ${widget.networkName}",
                    style: GoogleFonts.lato().copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "Bitte gib dein Passwort für das Netzwerk hier ein: ",
                    style: GoogleFonts.lato().copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 30.0),
                  Text(
                    "Passwort",
                    style: GoogleFonts.lato().copyWith(fontSize: 24, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 5.0),
                ],
              ),
            ),
            _buildTextField(),
            const SizedBox(height: 16.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        elevation: 0,
                        content: Text('Success', textAlign: TextAlign.center),
                        backgroundColor: Colors.green,
                        duration: Duration(milliseconds: 1500),
                        behavior: SnackBarBehavior.floating,
                        padding: EdgeInsets.all(8),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: primaryButtonColor, foregroundColor: Colors.white),
                  child: const Text('Abbrechen'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField() {
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
