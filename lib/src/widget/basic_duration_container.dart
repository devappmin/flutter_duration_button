import 'package:flutter/material.dart';

class BasicDurationContainer extends StatefulWidget {
  /// The [Duration] value of the container.
  final Duration duration;

  /// The width value of the container.
  final double? width;

  /// The height value of the container.
  final double? height;

  /// The child widget value.
  final Widget? child;

  /// The background color value of the container.
  ///
  /// [Theme]'s Primary Color will be used if color is null.
  final Color? color;

  /// The covered color value of the container.
  ///
  /// Default value is [Colors.black] with opacity(0.2).
  final Color? coverColor;

  /// The callback function that will be called when container is fully covered.
  final VoidCallback? onComplete;

  /// The bool value if cover covers child widget.
  final bool coverChild;

  /// The [Border] value of the container.
  final Border? border;

  /// Basic Duration Container
  ///
  /// Basic Duration Container is [duration] based filled container.
  const BasicDurationContainer({
    Key? key,
    required this.duration,
    required this.onComplete,
    this.coverChild = false,
    this.width,
    this.color,
    this.coverColor,
    this.height,
    this.child,
    this.border,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BasicDurationContainerState();
}

class _BasicDurationContainerState extends State<BasicDurationContainer> {
  /// the [GlobalKey] for [_childContainer]
  final GlobalKey _containerKey = GlobalKey();

  /// [_childContainer]'s [Size] value.
  Size? _size;

  /// The bool value if animation started.
  bool _start = false;

  /// Check if container is completed.
  bool _completed = false;

  /// The duration value of the container.
  Duration? _duration;

  @override
  void initState() {
    super.initState();

    _duration = widget.duration;

    // Get size value after widgets are created.
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _start = true;
      setState(() {
        _size = _getSize();
      });
    });
  }

  /// Get [Size] value using [_containerKey]
  Size? _getSize() {
    if (_containerKey.currentContext != null) {
      final RenderBox renderBox =
          _containerKey.currentContext!.findRenderObject() as RenderBox;
      Size size = renderBox.size;
      return size;
    }
  }

  /// The Container with its child.
  ///
  /// [_size] value will be calculated by its child value, using [_getSize].
  Container _childContainer() {
    return Container(
      key: _containerKey,
      width: widget.width,
      height: widget.height,
      child: widget.child,
    );
  }

  /// The cover Container from left.
  Container _coverContainer() {
    return Container(
      width: widget.width ?? _size?.width ?? 0,
      height: widget.height ?? _size?.height ?? 0,
      alignment: Alignment.centerLeft,
      child: AnimatedContainer(
        duration: _duration!,
        curve: Curves.easeInOut,
        width: widget.width == null
            ? _size?.width ?? 0
            : _start
                ? widget.width
                : 0,
        height: double.infinity,
        color: widget.coverColor ?? Colors.black.withOpacity(0.2),
        onEnd: () async {
          if (!_completed) {
            widget.onComplete!();
            _completed = true;
          }

          await Future.delayed(const Duration(milliseconds: 1));

          _duration = Duration.zero;
          setState(() => _size = _getSize());
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: widget.width ?? _size?.width ?? 0,
          height: widget.height ?? _size?.height ?? 0,
          decoration: BoxDecoration(
            color: widget.color ?? Theme.of(context).primaryColor,
            border: widget.border,
          ),
        ),

        // Makes _coverContainer() front if coverChild is true.
        widget.coverChild ? _childContainer() : _coverContainer(),
        widget.coverChild ? _coverContainer() : _childContainer(),
      ],
    );
  }
}
