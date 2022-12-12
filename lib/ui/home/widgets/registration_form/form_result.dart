import 'package:flutter/material.dart';
import 'package:wedding_page/ui/home/widgets/registration_form/registration_result.dart';

class FormResult extends StatelessWidget {
  final RegistrationResult registrationResult;

  const FormResult(this.registrationResult, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (registrationResult) {
      case RegistrationResult.success:
        return _resultBar(
          context,
          Colors.green,
          "Sikeres visszajelzés!",
        );
      case RegistrationResult.error:
        return _resultBar(
          context,
          Colors.redAccent,
          "Sikertelen visszajelzés!",
        );
      case RegistrationResult.inProgress:
        return Container();
    }
  }

  Widget _resultBar(
    BuildContext context,
    Color color,
    String label,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: color,
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
