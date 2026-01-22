import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Utility class for managing authentication bottom sheets
class BottomSheetUtils {
  BottomSheetUtils._();

  /// Shows an authentication bottom sheet with custom content
  static Future<void> showAuthBottomSheet(
    BuildContext context, {
    required Widget content,
    Duration duration = const Duration(milliseconds: 600),
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      isDismissible: false,
      enableDrag: false,
      transitionAnimationController: AnimationController(
        vsync: Navigator.of(context),
        duration: duration,
      )..forward(),
      builder: (_) => _AnimatedBottomSheetContent(
        initialContent: content,
        duration: duration,
      ),
    );
  }
  //======================================================================================
  /// Updates the content of the currently displayed bottom sheet
  //======================================================================================
  static void updateContent(BuildContext context, Widget newContent) {
    final state = context.findAncestorStateOfType<_AnimatedBottomSheetContentState>();
    state?.updateContent(newContent);
  }
}

/// Internal widget that handles the animated bottom sheet content
class _AnimatedBottomSheetContent extends StatefulWidget {
  final Widget initialContent;
  final Duration duration;

  const _AnimatedBottomSheetContent({
    required this.initialContent,
    required this.duration,
  });

  @override
  State<_AnimatedBottomSheetContent> createState() =>
      _AnimatedBottomSheetContentState();
}

class _AnimatedBottomSheetContentState extends State<_AnimatedBottomSheetContent>
    with SingleTickerProviderStateMixin {
  // State
  late Widget _currentContent;
  bool _isAnimating = false;

  // Animation
  late AnimationController _controller;
  late Animation<double> _slideAnimation;
  late Animation<double> _opacityAnimation;

  // Constants
  static const _transitionDuration = Duration(milliseconds: 400);
  static const _slideOffset = 100.0;

  @override
  void initState() {
    super.initState();
    _currentContent = widget.initialContent;
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _controller = AnimationController(
      vsync: this,
      duration: _transitionDuration,
    );

    _slideAnimation = Tween<double>(
      begin: 0.0,
      end: _slideOffset,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInCubic),
    );

    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInCubic),
    );
  }

  /// Updates the bottom sheet content with animation
  Future<void> updateContent(Widget newContent) async {
    if (_isAnimating) return;

    setState(() => _isAnimating = true);

    // Slide down and fade out
    await _controller.forward();

    // Update content
    if (mounted) {
      setState(() => _currentContent = newContent);
    }

    // Slide up and fade in
    await _controller.reverse();

    if (mounted) {
      setState(() => _isAnimating = false);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _InitialSlideTransition(
      duration: widget.duration,
      child: _ContentTransition(
        controller: _controller,
        slideAnimation: _slideAnimation,
        opacityAnimation: _opacityAnimation,
        child: _BottomSheetContainer(
          child: _currentContent,
        ),
      ),
    );
  }
}

/// Handles the initial slide-up animation when bottom sheet appears
class _InitialSlideTransition extends StatelessWidget {
  final Duration duration;
  final Widget child;

  const _InitialSlideTransition({
    required this.duration,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration,
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, (1 - value) * 100),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

/// Handles the content transition animation
class _ContentTransition extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> slideAnimation;
  final Animation<double> opacityAnimation;
  final Widget child;

  const _ContentTransition({
    required this.controller,
    required this.slideAnimation,
    required this.opacityAnimation,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, slideAnimation.value),
          child: Opacity(
            opacity: opacityAnimation.value,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

/// Container that wraps the bottom sheet content
class _BottomSheetContainer extends StatelessWidget {
  final Widget child;

  const _BottomSheetContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 1.9,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: child,
    );
  }
}