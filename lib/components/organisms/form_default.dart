import 'package:flutter/material.dart';
import 'package:learflutter/components/atoms/primary_button.dart';
import 'package:learflutter/components/molecules/default_form_field.dart';
import 'package:learflutter/utils/validate_email.dart';

class FormDefault extends StatefulWidget {
  final List<String> field;
  final List<Widget> icons;
  final List<String> obscureField;
  final String submitButtonLabel;
  final List<String> notRequiredfield;

  final Function(
    Map<String, String> result,
  ) onSubmit;

  const FormDefault(
      {Key key,
      this.field = const [],
      this.obscureField = const [],
      this.notRequiredfield = const [],
      this.onSubmit,
      this.icons = const [],
      this.submitButtonLabel = "Submit"})
      : super(key: key);
  @override
  _FormDefaultState createState() => _FormDefaultState();
}

class _FormDefaultState extends State<FormDefault> {
  final Map<String, TextEditingController> _controllers = {};
  @override
  void initState() {
    widget.field.forEach((element) {
      _controllers[element] = TextEditingController();
    });
    super.initState();
  }

  @override
  void dispose() {
    _controllers.forEach((key, value) {
      value.dispose();
    });
    super.dispose();
  }

  GlobalKey<FormState> _fKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _fKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _generateFields(),
        ),
      ),
    );
  }

  List<Widget> _generateFields() {
    var fields = <Widget>[];

    for (var i = 0; i < widget.field.length; i++) {
      var wFields = widget.field;
      var _icon = (i < widget.icons.length) ? widget.icons[i] : SizedBox();
      fields.add(
        Row(
          children: [
            Expanded(
              child: DefaultFormField(
                icon: _icon,
                isObscure: widget.obscureField.contains(wFields[i]),
                validation: (value) {
                  if (widget.notRequiredfield.contains(wFields[i])) {
                    return null;
                  } else if (value.isEmpty) {
                    return 'this fields is required';
                  } else if (wFields[i] == 'password') {
                  } else if (wFields[i] == 'email' && !value.isEmail()) {
                    return 'please input a valid email';
                  }
                  return null;
                },
                labelText: wFields[i],
                textEditingController: _controllers[wFields[i]],
              ),
            )
          ],
        ),
      );
    }
    fields.add(Container(
      margin: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PrimaryButton(
              onPressed: () {
                if (_fKey.currentState.validate()) {
                  widget.onSubmit(getResultForm());
                }
              },
              text: widget.submitButtonLabel),
        ],
      ),
    ));
    return fields;
  }

  Map<String, String> getResultForm() {
    return _controllers.map<String, String>(
      (key, value) => MapEntry(
        key,
        value.text.trim(),
      ),
    );
  }
}
