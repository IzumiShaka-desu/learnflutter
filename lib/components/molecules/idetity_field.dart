import 'package:flutter/material.dart';

class IdentityField extends StatefulWidget {
  final Function(String text) onPressed;
  final String labelText;
  final String value;
  final String hint;
  final TextInputType type;
  final Widget icon;
  const IdentityField(
      {Key key,
      this.onPressed,
      this.labelText,
      this.hint,
      this.icon,
      this.value,
      this.type})
      : super(key: key);
  @override
  _IdentityFieldState createState() => _IdentityFieldState();
}

class _IdentityFieldState extends State<IdentityField> {
  bool isEditMode = false;
  TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController(text: widget.value ?? "");
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _controller,
              readOnly: !isEditMode,
              keyboardType: widget.type??TextInputType.text,
              decoration: InputDecoration(
                labelText: widget.labelText ?? "",
                hintText:
                    widget.hint ?? "please input your ${widget.labelText}",
                prefixIcon: widget.icon ?? SizedBox(),
                border: OutlineInputBorder(),
                suffixIcon: AnimatedSwitcher(
                  duration: Duration(milliseconds: 350),
                  child: isEditMode ?? false
                      ? IconButton(
                          key: UniqueKey(),
                          icon: Icon(
                            Icons.check_box_outlined,
                            color: Colors.greenAccent,
                          ),
                          onPressed: () {
                            widget.onPressed(_controller.text);
                            setState(() {
                              isEditMode = false;
                            });
                          },
                        )
                      : IconButton(
                          key: UniqueKey(),
                          icon: Icon(Icons.edit_outlined),
                          onPressed: () async {
                            setState(() {
                              isEditMode = true;
                            });
                          },
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
