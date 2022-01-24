import 'package:duration_button/duration_button.dart';
import 'package:flutter/material.dart';

class OutlinedDurationButton extends DurationButton {
  OutlinedDurationButton({
    Key? key,
    required final Widget child,
    required final Duration duration,
    required final VoidCallback onPressed,
    final VoidCallback? onComplete,
    final double? width,
    final double? height,
    final bool? coverChild,
    final BorderRadius? borderRadius,
    final Color? coverColor,
    final Color? splashColor,
    final Color? hoverColor,
    final InteractiveInkFeatureFactory? splashFactory,
    final Border? border,
  }) : super(
          key: key,
          child: child,
          duration: duration,
          onPressed: onPressed,
          onComplete: onComplete,
          width: width,
          height: height,
          coverChild: coverChild,
          borderRadius: borderRadius ?? BorderRadius.zero,
          coverColor: coverColor,
          hoverColor: hoverColor,
          backgroundColor: Colors.transparent,
          splashColor: splashColor,
          splashFactory: splashFactory,
          border: border ?? Border.all(color: Colors.black12, width: 1.5),
        );
}
