import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BankIcon extends StatelessWidget {
  final String text;
  final String asset;
  final Function() onTap;

  const BankIcon({
    required this.text,
    required this.asset,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            asset,
          ),
          const SizedBox(height: 6.0),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
