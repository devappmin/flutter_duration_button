import 'package:flutter/material.dart';

class BasicInkwell extends StatelessWidget {
  /// The callback function that will be called when [BasicInkwell] is clicked.
  final VoidCallback onPressed;

  /// The spalshFactory of the inkwell.
  final InteractiveInkFeatureFactory? splashFactory;

  /// The color value of splash effect.
  final Color? splashColor;

  /// The color value of hover effect.
  final Color? hoverColor;

  const BasicInkwell({
    Key? key,
    required this.onPressed,
    this.splashFactory,
    this.splashColor,
    this.hoverColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: splashColor,
          hoverColor: hoverColor,
          splashFactory: splashFactory,
          onTap: onPressed,
        ),
      ),
    );
  }
}
