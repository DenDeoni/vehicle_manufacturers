import 'package:flutter/material.dart';
import 'package:vehicle_manufacturers/@core/app_colors.dart';
import 'package:vehicle_manufacturers/utils/constants.dart';

class ErrorWidgetWithButton extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const ErrorWidgetWithButton({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 10,
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            message,
            style: TextStyle(fontSize: 20, color: AppColors.fonts.grey),
          ),
          ElevatedButton(
            key: const Key(retryButtonKey),
            onPressed: onRetry,
            child: const Text(tryAgain),
          ),
        ],
      ),
    );
  }
}
