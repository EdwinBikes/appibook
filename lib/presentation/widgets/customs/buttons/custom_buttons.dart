import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomButton extends StatelessWidget {
  final String? destination;
  final String buttonText;
  final void Function()? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final bool isElevated;

  const CustomButton({
    Key? key,
    this.destination,
    required this.buttonText,
    this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    this.isElevated = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final button = isElevated
        ? ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(8),
                  right: Radius.circular(8),
                ),
              ),
            ),
            onPressed: () {
              if (onPressed != null) {
                onPressed!();
              }
              if (destination != null) {
                context.go(destination!);
              }
            },
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: textColor),
              ),
            ),
          )
        : OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(8),
                  right: Radius.circular(8),
                ),
              ),
              foregroundColor: textColor,
              backgroundColor: backgroundColor,
            ),
            onPressed: () => context.go(destination!),
            child: SizedBox(width: 200, child: Center(child: Text(buttonText))),
          );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: button,
      ),
    );
  }
}
