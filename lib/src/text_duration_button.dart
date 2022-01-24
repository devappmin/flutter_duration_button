import 'package:duration_button/duration_button.dart';
import 'package:flutter/material.dart';

class TextDurationButton extends DurationButton {
  const TextDurationButton({
    Key? key,
    required final Text text,
    required final Duration duration,
    required final VoidCallback onPressed,
    final BorderRadius? borderRadius,
    final VoidCallback? onComplete,
    final Color? splashColor,
    final InteractiveInkFeatureFactory? splashFactory,
    final double? width,
    final double? height,
    final bool? coverChild,
    final Color? coverColor,
    final Color? hoverColor,
  }) : super(
          key: key,
          duration: duration,
          onPressed: onPressed,
          onComplete: onComplete,
          width: width,
          height: height,
          splashColor: splashColor,
          splashFactory: splashFactory,
          backgroundColor: Colors.transparent,
          child: text,
          borderRadius: borderRadius ?? BorderRadius.zero,
          coverChild: coverChild,
          coverColor: coverColor,
          hoverColor: hoverColor,
        );
}
