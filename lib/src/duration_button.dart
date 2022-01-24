import 'package:duration_button/src/widget/basic_inkwell.dart';

import 'widget/basic_duration_container.dart';
import 'package:flutter/material.dart';

class DurationButton extends StatelessWidget {
  /// The [Duration] value of the button.
  final Duration duration;

  /// The width value of the button.
  final double? width;

  /// The height value of the button.
  final double? height;

  /// The child widget of the button.
  final Widget? child;

  /// The bool value if cover covers child widget.
  ///
  /// Default value is false.
  final bool? coverChild;

  /// The [BorderRadius] value of teh button.
  ///
  /// Default value is [Radius.circular] with 5.
  final BorderRadius borderRadius;

  /// The callback function that will be called when button is clicked.
  ///
  /// If [onComplete] is null, then [onPressed] will be called when
  /// button is completely covered.
  final VoidCallback onPressed;

  /// The callback function that will be called when the button is completely covered.
  final VoidCallback? onComplete;

  /// The color value of the cover.
  final Color? coverColor;

  /// The color value of the button.
  final Color? backgroundColor;

  /// the color value of the hover effect.
  final Color? hoverColor;

  /// the color value of the splash effect.
  final Color? splashColor;

  /// The splashFactory value of the button.
  final InteractiveInkFeatureFactory? splashFactory;

  /// The border value of the button.
  final Border? border;

  const DurationButton({
    Key? key,
    required this.onPressed,
    required this.child,
    required this.duration,
    this.width,
    this.height,
    this.coverColor,
    this.hoverColor,
    this.splashColor,
    this.splashFactory,
    this.borderRadius = const BorderRadius.all(Radius.circular(5)),
    this.onComplete,
    this.coverChild,
    this.backgroundColor,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Stack(
        children: [
          BasicDurationContainer(
            duration: duration,
            width: width,
            height: height,
            onComplete: onComplete ?? onPressed,
            coverColor: coverColor,
            color: backgroundColor,
            coverChild: coverChild ?? false,
            border: border,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: child is Text && (child as Text).style == null
                  ? Text(
                      (child as Text).data!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : child,
            ),
          ),
          BasicInkwell(
            onPressed: onPressed,
            splashFactory: splashFactory,
            splashColor: splashColor,
            hoverColor: hoverColor,
          ),
        ],
      ),
    );
  }
}
