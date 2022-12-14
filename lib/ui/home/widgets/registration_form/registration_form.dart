import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_page/domain/model/registration_data.dart';
import 'package:wedding_page/ui/home/widgets/registration_form/form_result.dart';
import 'package:wedding_page/ui/home/widgets/registration_form/registration_form_bloc.dart';
import 'package:wedding_page/ui/home/widgets/registration_form/registration_form_state.dart';
import 'package:wedding_page/ui/widgets/form_label.dart';
import 'package:wedding_page/ui/widgets/section_title.dart';
import 'package:wedding_page/util/extensions/string_extensions.dart';

class RegistrationForm extends StatefulWidget {
  final Function(RegistrationData) onSubmit;

  const RegistrationForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  bool _roomValue = true;
  bool _cookieValue = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _adultsController = TextEditingController();
  final TextEditingController _childrenController = TextEditingController();
  final TextEditingController _foodAllergiesController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otherController = TextEditingController();
  final TextEditingController _inviteCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationFormBloc, RegistrationFormState>(
      listener: (ctx, state) {
        if (state is RegistrationFormClearFields) {
          _clearFields();
        }
      },
      builder: (ctx, state) => state is RegistrationFormWidgetState
          ? Container(
              width: double.infinity,
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      const SectionTitle("Visszajelzés"),
                      _nameField(context),
                      _guestsField(context),
                      _roomField(context),
                      _cookiesField(context),
                      _foodAllergiesField(context),
                      _contactField(context),
                      _otherCommentField(context),
                      _codeField(context),
                      _submit(context, state.isLoading),
                      _result(state),
                    ],
                  ),
                ),
              ),
            )
          : Container(),
    );
  }

  _clearFields() {
    if (!mounted) return;
    setState(() {
      _roomValue = true;
      _nameController.text = "";
      _adultsController.text = "";
      _childrenController.text = "";
      _foodAllergiesController.text = "";
      _emailController.text = "";
      _phoneController.text = "";
      _otherController.text = "";
      _inviteCodeController.text = "";
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _adultsController.dispose();
    _childrenController.dispose();
    _foodAllergiesController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _otherController.dispose();
    _inviteCodeController.dispose();
    super.dispose();
  }

  Widget _nameField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width * 0.5,
      child: Row(
        children: [
          const Flexible(child: FormLabel("Név:")),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "A mező kitöltése kötelező";
                }
                return null;
              },
              controller: _nameController,
            ),
          ),
        ],
      ),
    );
  }

  Widget _guestsField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width * 0.5,
      child: Row(
        children: [
          const Flexible(child: FormLabel("Felnőttek:")),
          const SizedBox(
            width: 8.0,
          ),
          Flexible(
            flex: 2,
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: _adultsController,
              validator: (value) {
                if (value.isNullOrEmpty) {
                  return "A mező kitöltése kötelező";
                } else if ((int.tryParse(value!) ?? 0) < 0) {
                  return "A mező értékének pozitív számnak kell lennie!";
                }
                return null;
              },
            ),
          ),
          const Flexible(child: FormLabel("Gyerekek:")),
          const SizedBox(
            width: 8.0,
          ),
          Flexible(
            flex: 2,
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: _childrenController,
              validator: (value) {
                if (value.isNullOrEmpty) {
                  return "A mező kitöltése kötelező";
                } else if ((int.tryParse(value!) ?? 0) < 0) {
                  return "A mező értékének pozitív számnak kell lennie!";
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _roomField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width * 0.5,
      child: Row(
        children: [
          const Flexible(child: FormLabel("Szeretnétek-e szállást?:")),
          const SizedBox(
            width: 8.0,
          ),
          Flexible(
              child: Checkbox(
            value: _roomValue,
            onChanged: (value) {
              setState(() {
                _roomValue = value ?? false;
              });
            },
          )),
          const Flexible(child: Text("(A szállás mindenkinek jár alapból.)")),
        ],
      ),
    );
  }

  Widget _cookiesField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width * 0.5,
      child: Row(
        children: [
          const Flexible(child: FormLabel("Hoztok-e sütit?:")),
          const SizedBox(
            width: 8.0,
          ),
          Flexible(
              child: Checkbox(
                value: _cookieValue,
                onChanged: (value) {
                  setState(() {
                    _cookieValue = value ?? false;
                  });
                },
              )),
        ],
      ),
    );
  }

  Widget _foodAllergiesField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width * 0.5,
      child: Row(
        children: [
          const Flexible(
            child: FormLabel("Milyen ételérzékenységed / allergiád van?"),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
              child: TextFormField(
            controller: _foodAllergiesController,
          )),
        ],
      ),
    );
  }

  Widget _contactField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FormLabel("Elérhetőség:"),
          Row(
            children: [
              const SizedBox(
                width: 16.0,
              ),
              const Flexible(
                child: FormLabel("Email:"),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Flexible(
                flex: 2,
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if ((value == null || value.isEmpty) && _phoneController.text.isEmpty) {
                      return "Valamelyik elérhetőség kitöltése kötelező!";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              const Flexible(child: FormLabel("Vagy telefon:")),
              const SizedBox(
                width: 8.0,
              ),
              Flexible(
                flex: 2,
                child: TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if ((value == null || value.isEmpty) && _emailController.text.isEmpty) {
                      return "Valamelyik elérhetőség kitöltése kötelező!";
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _otherCommentField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width * 0.5,
      child: Row(
        children: [
          const Flexible(child: FormLabel("Bármi egyéb megjegyzés:")),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
              child: TextFormField(
            controller: _otherController,
          )),
        ],
      ),
    );
  }

  Widget _codeField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width * 0.5,
      child: Row(
        children: [
          const Flexible(child: FormLabel("A meghívón található ellenőrző kód:")),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
              child: TextFormField(
            controller: _inviteCodeController,
          )),
        ],
      ),
    );
  }

  Widget _submit(BuildContext context, bool isLoading) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          final data = RegistrationData(
            inviteCode: _inviteCodeController.text,
            timestamp: DateTime.now(),
            name: _nameController.text,
            adults: _adultsController.text,
            children: _childrenController.text,
            needsRoom: _roomValue.toString(),
            bringsCookie: _cookieValue.toString(),
            foodAllergies: _foodAllergiesController.text,
            email: _emailController.text,
            phone: _phoneController.text,
            otherComments: _otherController.text,
          );
          widget.onSubmit(data);
        }
      },
      child: (isLoading) ? const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircularProgressIndicator(color: Colors.white,),
      ) : const Text("Beküldés"),
    );
  }

  Widget _result(RegistrationFormWidgetState state) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FormResult(state.registrationResult),
    );
  }
}
