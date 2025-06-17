import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AnimatedOnViewWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;

  const AnimatedOnViewWidget({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeInOut,
  }) : super(key: key);

  @override
  _AnimatedOnViewWidgetState createState() => _AnimatedOnViewWidgetState();
}

class _AnimatedOnViewWidgetState extends State<AnimatedOnViewWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction > 0 && !_isVisible) {
      setState(() {
        _isVisible = true;
      });
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('${widget.key}_visibility'),
      onVisibilityChanged: _onVisibilityChanged,
      child: FadeTransition(
        opacity: _animation,
        child: widget.child,
      ),
    );
  }
}
