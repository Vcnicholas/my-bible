import 'package:flutter/material.dart';

class AppBottomSheets extends StatelessWidget {
  final double initialSize;
  final double minSize;
  final double maxSize;
  final Widget child;
  final VoidCallback? onInit;

  const AppBottomSheets({
    super.key,
    required this.child,
    this.initialSize = 0.5,
    this.minSize = 0.25,
    this.maxSize = 0.85,
    this.onInit,
  });

  static void showBottomSheet({
    required BuildContext context,
    required Widget child,
    double initialSize = 0.5,
    double minSize = 0.25,
    double maxSize = 0.85,
    VoidCallback? onInit,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => AppBottomSheets(
        initialSize: initialSize,
        minSize: minSize,
        maxSize: maxSize,
        onInit: onInit,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Trigger onInit after build
    if (onInit != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => onInit!());
    }

    return DraggableScrollableSheet(
      initialChildSize: initialSize,
      minChildSize: minSize,
      maxChildSize: maxSize,
      snap: true,
      builder: (_, scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: child,
          ),
        );
      },
    );
  }
}
