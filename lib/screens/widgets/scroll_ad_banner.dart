import 'dart:async';
import 'package:flutter/material.dart';

class AutoScrollBanner extends StatefulWidget {
  final List<Widget> children;
  final Duration duration;

  const AutoScrollBanner({
    Key? key,
    required this.children,
    required this.duration,
  }) : super(key: key);

  @override
  _AutoScrollBannerState createState() => _AutoScrollBannerState();
}

class _AutoScrollBannerState extends State<AutoScrollBanner> {
  final _pageController = PageController(initialPage: 0);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 15, right: 15),
      child: SizedBox(
        height: 180,
        child: PageView.builder(
          controller: _pageController,
          itemCount: widget.children.length,
          itemBuilder: (context, index) {
            return widget.children[index];
          },
        ),
      ),
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(widget.duration, (_) {
      final nextPage = _pageController.page! + 1;
      if (nextPage >= widget.children.length) {
        _pageController.jumpToPage(0);
      } else {
        _pageController.nextPage(
            duration: Duration(milliseconds: 500), curve: Curves.ease);
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }
}
