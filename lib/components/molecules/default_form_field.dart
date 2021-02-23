import 'package:flutter/material.dart';

class DefaultFormField extends StatefulWidget {
  final String labelText;
  final TextEditingController textEditingController;
  final String hint;
  final Widget icon;
  final bool isObscure;
  final FormFieldValidator<String> validation;
  const DefaultFormField({
    Key key,
    @required this.labelText,
    @required this.textEditingController,
    this.hint,
    @required this.icon,
    this.isObscure = false,
    this.validation,
  }) : super(key: key);

  @override
  _DefaultFormFieldState createState() => _DefaultFormFieldState();
}

class _DefaultFormFieldState extends State<DefaultFormField> {
  @override
  void initState() {
    isObscure = widget.isObscure;
    super.initState();
  }

  bool isObscure;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: widget.textEditingController,
              obscureText: isObscure,
              validator: widget.validation,
              decoration: InputDecoration(
                labelText: widget.labelText ?? "",
                hintText:
                    widget.hint ?? "please input your ${widget.labelText}",
                prefixIcon: widget.icon,
                border: OutlineInputBorder(),
                suffixIcon:  widget.isObscure
                    ? IconButton(
                        icon: AnimatedSwitcher(
                          duration: Duration(milliseconds: 350),
                          
                          child: isObscure
                              ? Icon(Icons.visibility_outlined,key: UniqueKey(),)
                              : Icon(Icons.visibility_off_outlined,key: UniqueKey(),),
                          transitionBuilder: (child, animation) {
                            return RotationTransition(
                              turns: animation,
                              child: child,
                            );
                          },
                        ),
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
