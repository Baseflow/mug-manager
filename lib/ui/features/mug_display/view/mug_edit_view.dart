import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mug_manager/ui/features/mug_display/cubit/mug_display_cubit.dart';
import 'package:mug_manager/ui/shared/widgets/checkbox_form_field.dart';

import '../../../../core/models/mug.dart';

class MugEditView extends StatefulWidget {
  const MugEditView({
    super.key,
    required this.mug,
  });

  final Mug mug;

  @override
  MugEditViewState createState() {
    return MugEditViewState();
  }
}

class MugEditViewState extends State<MugEditView> {
  @override
  void initState() {
    _firstNameController.text = widget.mug.firstName;
    _lastNameController.text = widget.mug.lastName;
    _nickNameController.text = widget.mug.nickName ?? '';
    _brokenController.checked = widget.mug.isBroken;
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _nickNameController = TextEditingController();
  final CheckboxFormFieldController _brokenController =
      CheckboxFormFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update mug',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(labelText: 'First name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'First name cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(labelText: 'Last name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Last name cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _nickNameController,
                decoration: const InputDecoration(labelText: 'Nickname'),
              ),
              const SizedBox(height: 24),
              CheckboxFormField(
                title: const Text('Broken'),
                controller: _brokenController,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _updateMug(context),
                  child: const Text('Update mug'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateMug(BuildContext context) {
    bool isFormValid = _formKey.currentState?.validate() ?? false;

    if (isFormValid) {
      context.read<MugCubit>().updateMug(
            mug: Mug(
              id: widget.mug.id,
              firstName: _firstNameController.text,
              lastName: _lastNameController.text,
              nickName: _nickNameController.text.isEmpty
                  ? null
                  : _nickNameController.text,
              isBroken: _brokenController.checked,
            ),
          );
      Navigator.pop(context);
    }
  }
}
