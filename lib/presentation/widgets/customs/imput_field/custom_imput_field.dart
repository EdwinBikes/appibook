import 'package:flutter/material.dart'
    show
        AutovalidateMode,
        BuildContext,
        Icon,
        IconData,
        InputDecoration,
        Key,
        StatelessWidget,
        TextCapitalization,
        TextFormField,
        TextInputType,
        Widget;

class CustomImputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String formProperty;
  final Map<String, dynamic> formvalues;

  const CustomImputField({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
    required this.formProperty,
    required this.formvalues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autofocus: true,
        autocorrect: true,
        initialValue: '',
        textCapitalization: TextCapitalization.words,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onChanged: (value) {
          formvalues[formProperty] = value;
        },
        validator: (value) {
          if (value == null) return 'Este campo es requerido';
          return value.length < 3 ? 'Mínimo de 3 letras' : null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          counterText: 'minimo 8 caracteres',
          helperText: helperText,
          suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
          icon: icon == null ? null : Icon(icon),
        ));
  }
}
