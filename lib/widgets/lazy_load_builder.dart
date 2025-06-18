import 'package:flutter/cupertino.dart';
import 'package:visibility_detector/visibility_detector.dart';

class LazyLoadBuilder extends StatefulWidget {
  final WidgetBuilder builder;
  const LazyLoadBuilder({required this.builder, super.key});

  @override
  State<LazyLoadBuilder> createState() => _LazyLoadBuilderState();
}

class _LazyLoadBuilderState extends State<LazyLoadBuilder> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (info) {
        if (!_isVisible && info.visibleFraction > 0.1) {
          setState(() => _isVisible = true);
        }
      },
      child: _isVisible
          ? widget.builder(context)
          : const SizedBox(height: 200), // Placeholder size until loaded
    );
  }
}
