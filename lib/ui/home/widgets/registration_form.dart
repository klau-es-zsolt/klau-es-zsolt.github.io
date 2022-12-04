import 'package:flutter/material.dart';
import 'package:wedding_page/domain/model/registration_data.dart';

class RegistrationForm extends StatefulWidget {
  final Function(RegistrationData) onSubmit;

  const RegistrationForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  bool _roomValue = true;
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
    return Container(
      width: double.infinity,
      color: Colors.white70,
      child: Form(
        child: Column(
          children: [
            _nameField(context),
            _guestsField(context),
            _roomField(context),
            _foodAllergiesField(context),
            _contactField(context),
            _otherCommentField(context),
            _codeField(context),
            _submit(context),
          ],
        ),
      ),
    );
  }

  Widget _nameField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width * 0.5,
      child: Row(
        children: [
          Flexible(child: Text("Név:")),
          SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: TextFormField(
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
          Flexible(child: Text("Felnőttek:")),
          SizedBox(
            width: 8.0,
          ),
          Expanded(
              child: TextFormField(
            controller: _adultsController,
          )),
          Flexible(child: Text("Gyerekek:")),
          SizedBox(
            width: 8.0,
          ),
          Expanded(
              child: TextFormField(
            controller: _childrenController,
          )),
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
          Flexible(child: Text("Szeretnétek-e szállást?:")),
          SizedBox(
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
          Flexible(child: Text("(A szállás mindenkinek jár alapból.)")),
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
          Flexible(child: Text("Milyen ételérzékenységed / allergiád van?")),
          SizedBox(
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
      child: Row(
        children: [
          Flexible(child: Text("Elérhetőség:")),
          SizedBox(
            width: 8.0,
          ),
          Flexible(child: Text("Email:")),
          SizedBox(
            width: 8.0,
          ),
          Expanded(
              child: TextFormField(
            controller: _emailController,
          )),
          SizedBox(
            width: 8.0,
          ),
          Flexible(child: Text("Vagy telefon:")),
          SizedBox(
            width: 8.0,
          ),
          Expanded(
              child: TextFormField(
            controller: _phoneController,
          )),
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
          Flexible(child: Text("Bármi egyéb megjegyzés:")),
          SizedBox(
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
          Flexible(child: Text("A meghívón található ellenőrző kód:")),
          SizedBox(
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

  Widget _submit(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final data = RegistrationData(
          inviteCode: _inviteCodeController.text,
          timestamp: DateTime.now(),
          name: _nameController.text,
          adults: _adultsController.text,
          children: _childrenController.text,
          needsRoom: _roomValue.toString(),
          foodAllergies: _foodAllergiesController.text,
          email: _emailController.text,
          phone: _phoneController.text,
          otherComments: _otherController.text,
        );
        widget.onSubmit(data);
      },
      child: Text("Beküldés"),
    );
  }
}
