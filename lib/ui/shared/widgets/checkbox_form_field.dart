import 'package:flutter/material.dart';

class CheckboxFormFieldController {
  CheckboxFormFieldController({
    this.checked = false,
  });

  bool checked;
}

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField({
    super.key,
    Widget? title,
    FormFieldSetter<bool>? onSaved,
    FormFieldValidator<bool>? validator,
    bool autovalidate = false,
    CheckboxFormFieldController? controller,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: controller?.checked ?? false,
          builder: (FormFieldState<bool> state) {
            return CheckboxListTile(
              dense: state.hasError,
              title: title,
              value: state.value,
              onChanged: (checked) {
                controller?.checked = checked!;
                return state.didChange(checked);
              },
              subtitle: state.hasError
                  ? Builder(
                      builder: (BuildContext context) => Text(
                        state.errorText ?? 'Error',
                        style: TextStyle(color: Theme.of(context).errorColor),
                      ),
                    )
                  : null,
              controlAffinity: ListTileControlAffinity.leading,
            );
          },
        );
}
