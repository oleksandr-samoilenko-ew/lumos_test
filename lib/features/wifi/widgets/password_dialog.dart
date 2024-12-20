import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lumos/common/colors/colors.dart';
import 'package:lumos/features/wifi/widgets/password_text_field.dart';

class PasswordDialog extends StatelessWidget {
  final String networkName;

  const PasswordDialog({
    super.key,
    required this.networkName,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mit einem WLAN verbinden",
                    style: GoogleFonts.lato().copyWith(fontSize: 24, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "Das Gerät versucht sich mit zu verbinden mit: $networkName",
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
            const PasswordTextField(),
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
                  child: const Text('Connect'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
