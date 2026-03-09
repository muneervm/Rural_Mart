import 'package:flutter/material.dart';

class LoginTextformfield extends StatefulWidget {
  final TextEditingController controller;
  final String hinttext;

  final bool isPassword;
  final bool readonly;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const LoginTextformfield({
    Key? key,
    required this.controller,
    required this.hinttext,
    this.isPassword = false,
    this.validator,
    this.readonly = false,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  State<LoginTextformfield> createState() => _LoginTextformfieldState();
}

class _LoginTextformfieldState extends State<LoginTextformfield> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      readOnly: widget.readonly,
      keyboardType: widget.keyboardType,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Colors.black87,
      ),
      decoration: InputDecoration(
        isDense: true,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 2),
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: widget.hinttext,
        hintStyle: TextStyle(
          fontSize: 15,
          color: Colors.grey.shade400,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                  size: 24,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
      ),
      validator: widget.validator,
    );
  }
}
