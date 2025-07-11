import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialIcon(FontAwesomeIcons.google, Colors.white),
        const SizedBox(width: 18),
        _buildSocialIcon(FontAwesomeIcons.facebookF, Colors.white),
        const SizedBox(width: 18),
        _buildSocialIcon(FontAwesomeIcons.twitter, Colors.white),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, Color color) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Icon(icon, color: color, size: 24),
    );
  }
}
