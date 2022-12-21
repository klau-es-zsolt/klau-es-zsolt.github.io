import 'package:flutter/material.dart';
import 'package:wedding_page/ui/home/widgets/registration_form/registration_result.dart';

class FormResult extends StatelessWidget {
  final RegistrationResult registrationResult;
  final Function onClose;

  const FormResult(this.registrationResult, this.onClose, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (registrationResult) {
      case RegistrationResult.success:
        return _resultBar(
          context,
          Colors.green,
          "Köszünjük a visszajelzést, várunk a nagy napon!",
        );
      case RegistrationResult.error:
        return _resultBar(
          context,
          Colors.redAccent,
          "Valami nem sikerült :'( Ha újabb próbálkozásra se megy, keress meg minket!",
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
      width: MediaQuery.of(context).size.width * 0.4,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: color,
      ),
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          onClose();
        },
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const Icon(Icons.close),
          ],
        ),
      ),
    );
  }
}
