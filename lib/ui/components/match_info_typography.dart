import 'package:flutter/material.dart';
import 'package:getwidget/components/typography/gf_typography.dart';
import 'package:getwidget/types/gf_typography_type.dart';

class MatchInfoTypography extends StatefulWidget {
  const MatchInfoTypography({super.key, required this.matchInfo, required this.icon});
  final String? matchInfo;
  final IconData icon;

  @override
  State<MatchInfoTypography> createState() => _MatchInfoTypographyState();
}

class _MatchInfoTypographyState extends State<MatchInfoTypography> {
  @override
  Widget build(BuildContext context) {
    String? matchData = widget.matchInfo;
    IconData icon = widget.icon;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: GFTypography(
          dividerColor: Colors.lightGreenAccent,
          text: matchData,
          textColor: Colors.white,
          type: GFTypographyType.typo1,
          icon: Icon(icon),
        ),
      ),
    );
  }
}
