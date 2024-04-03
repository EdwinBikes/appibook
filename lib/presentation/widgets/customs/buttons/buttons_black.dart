import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomButtonBlack extends StatelessWidget {
  final String destination;
  final String buttonText;

  const CustomButtonBlack({
    Key? key,
    required this.destination,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: Colors.black,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(8),
                right: Radius.circular(8),
              ),
            ),
          ),
          child: Center(child: Text(buttonText)),
          onPressed: () => context.go(destination),
        ),
      ),
    );
  }
}

class CustomButtonWhite extends StatelessWidget {
  final String destination;
  final String buttonText;

  const CustomButtonWhite({
    Key? key,
    required this.destination,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 48,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(8),
                  right: Radius.circular(8),
                ),
              ),
              foregroundColor: Colors.black,
              backgroundColor: Colors.white),
          child: SizedBox(width: 200, child: Center(child: Text(buttonText))),
          onPressed: () => context.go(destination),
        ),
      ),
    );
  }
}
