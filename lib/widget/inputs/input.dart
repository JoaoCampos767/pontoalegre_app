
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String _title;
  final TextInputType _inputType;
  final FormFieldValidator _validator;
  final ValueChanged<String> _onChanged;
  final bool _obscureText;
  final Icon? _prefixIcon;

  const InputField({super.key,
    required title,
    required inputType,
    required validator,
    required onChanged,
    required obscureText,
    prefixIcon})
      : _title = title,
        _inputType = inputType,
        _validator = validator,
        _onChanged = onChanged,
        _obscureText = obscureText,
        _prefixIcon = prefixIcon;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget._obscureText,
      keyboardType: widget._inputType,
      decoration: InputDecoration(
        label: Text(widget._title),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        prefixIcon: widget._prefixIcon,
      ),
      validator: (value) => widget._validator(value),
      onChanged: (value) => widget._onChanged(value),
    );
  }
}
