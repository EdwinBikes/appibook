import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TextBottomScreens extends StatelessWidget {
  final String textPrimary;
  final String textSecund;
  final String textDestination;
  final bool showDialogOption;

  const TextBottomScreens({
    super.key,
    required this.textPrimary,
    required this.textSecund,
    required this.textDestination,
    this.showDialogOption = false,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: GestureDetector(
          onTap: () {
            if (showDialogOption) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Crear cuenta"),
                    content: const Text("¿Deseas crear una cuenta?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancelar"),
                      ),
                      TextButton(
                        onPressed: () => context.go(textDestination),
                        child: const Text("Aceptar"),
                      ),
                    ],
                  );
                },
              );
            } else {
              context.go(textDestination);
            }
          },
          child: RichText(
            text: TextSpan(
              text: textPrimary,
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                  text: textSecund,
                  style: TextStyle(color: Colors.cyan[600]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
