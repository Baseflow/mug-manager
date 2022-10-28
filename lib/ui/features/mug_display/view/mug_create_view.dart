import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mug_manager/ui/features/mug_display/cubit/mug_display_cubit.dart';
import 'package:mug_manager/ui/shared/widgets/checkbox_form_field.dart';

import '../../../../core/models/mug.dart';

class MugCreateView extends StatefulWidget {
  const MugCreateView({super.key});

  @override
  MugCreateViewState createState() {
    return MugCreateViewState();
  }
}

class MugCreateViewState extends State<MugCreateView> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _nickNameController = TextEditingController();
  final _brokenController = CheckboxFormFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create new mug',
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
                key: const Key('FIRST_NAME'),
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
                key: const Key('LAST_NAME'),
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
                key: const Key('NICKNAME'),
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
                  onPressed: () => _createMug(context),
                  child: const Text('Create mug'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createMug(BuildContext context) {
    bool isFormValid = _formKey.currentState?.validate() ?? false;

    if (isFormValid) {
      context.read<MugCubit>().createMug(
            mug: Mug(
              id: -1, // IDs are assigned by the server
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
