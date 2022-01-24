import 'package:duration_button/src/widget/basic_duration_container.dart';
import 'package:duration_button/src/widget/basic_inkwell.dart';
import 'package:flutter/material.dart';

class IconDurationButton extends StatelessWidget {
  /// The [Duration] value of the container.
  final Duration duration;

  /// The callback function that will be called when button is clicked.
  ///
  /// If [onComplete] is null, then [onPressed] will be called when
  /// button is completely covered.
  final VoidCallback onPressed;

  /// The callback function that will be called when the button is completely covered.
  final VoidCallback? onComplete;

  /// the Size value of the icon.
  final double? size;

  /// The color value of the button.
  final Color? backgroundColor;

  /// The color value of the cover.
  final Color? coverColor;

  /// The color value of the icon.
  final Color? iconColor;

  /// the color value of the splash effect.
  final Color? splashColor;

  /// The color value of the cover.
  final Color? hoverColor;

  /// The bool value if cover covers child widget.
  ///
  /// Default value is false.
  final bool? coverChild;

  /// The icon value of the button.
  final IconData? icon;

  /// The splashFactory value of the button.
  final InteractiveInkFeatureFactory? splashFactory;

  const IconDurationButton(
    this.icon, {
    Key? key,
    required this.duration,
    required this.onPressed,
    this.size,
    this.onComplete,
    this.backgroundColor,
    this.coverColor,
    this.iconColor,
    this.splashColor,
    this.hoverColor,
    this.splashFactory,
    this.coverChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      clipper: CircularClipper(),
      child: Stack(
        children: <Widget>[
          BasicDurationContainer(
            duration: duration,
            onComplete: onComplete ?? onPressed,
            coverColor: coverColor,
            color: backgroundColor ?? Colors.transparent,
            coverChild: coverChild ?? false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Icon(
                icon,
                size: size,
                color: iconColor,
              ),
            ),
          ),
          BasicInkwell(
            onPressed: onPressed,
            splashColor: splashColor,
            splashFactory: splashFactory,
            hoverColor: hoverColor,
          ),
        ],
      ),
    );
  }
}

class CircularClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(
      0,
      0,
      size.width > size.height ? size.width : size.height,
      size.width > size.height ? size.width : size.height,
    );
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}
