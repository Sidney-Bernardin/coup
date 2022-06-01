import 'dart:ui';

import 'package:flutter/material.dart';

import '../../utils/theme.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final void Function() onClick;

  const PrimaryButton(
    this.text, {
    Key? key,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Ink.image(
        image: const AssetImage('assets/images/contessa.png'),
        colorFilter: const ColorFilter.matrix(ColorFilters.greyScale),
        fit: BoxFit.cover,
        width: 145 * 1.7,
        height: 174 * 1.7,
        child: InkWell(
          onTap: onClick,
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.grey.withOpacity(0.1),
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
