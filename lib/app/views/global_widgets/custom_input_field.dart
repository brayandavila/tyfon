import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomInputField extends StatefulWidget {
  final void Function(String)? onChanged;
  final String hintText;
  final TextInputType? inputType;
  final bool passwordActive;
  final String? Function(String?)? validator;
  const CustomInputField(
      {Key? key,
      this.onChanged,
      required this.hintText,
      this.inputType,
      this.validator,
      this.passwordActive = false})
      : super(key: key);

  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.passwordActive;
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    SizedBox(
      height: height * 0.2,
    );
    return FormField<String>(
        autovalidateMode: AutovalidateMode.always,
        validator: widget.validator,
        builder: (state) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  obscureText: _obscureText,
                  onChanged: (text) {
                    if (widget.validator != null) {
                      // ignore: invalid_use_of_protected_member
                      state.setValue(text);
                      state.validate();
                    }
                    if (widget.onChanged != null) {
                      widget.onChanged!(text);
                    }
                  },
                  autofocus: true,
                  keyboardType: widget.inputType,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      suffixIcon: widget.passwordActive
                          ? CupertinoButton(
                              child: Icon(
                                _obscureText
                                    ? Icons.remove_red_eye_outlined
                                    : Icons.remove_red_eye,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                _obscureText = !_obscureText;
                                setState(() {});
                              },
                            )
                          : Container(
                              width: 0,
                            ),
                      hintText: widget.hintText,
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black87, width: 1.5))),
                  cursorColor: Colors.black87,
                  style:
                      const TextStyle(fontFamily: 'Silka Medium', fontSize: 13),
                ),
                if (state.hasError)
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        state.errorText!,
                        style: const TextStyle(
                            fontFamily: 'Silka Medium',
                            fontSize: 12,
                            color: Colors.black87),
                      )),
              ],
            ));
  }
}
