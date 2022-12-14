import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_page/domain/model/registration_data.dart';
import 'package:wedding_page/ui/home/widgets/registration_form/form_result.dart';
import 'package:wedding_page/ui/home/widgets/registration_form/registration_form_bloc.dart';
import 'package:wedding_page/ui/home/widgets/registration_form/registration_form_event.dart';
import 'package:wedding_page/ui/home/widgets/registration_form/registration_form_state.dart';
import 'package:wedding_page/ui/theme/breakpoints.dart';
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
                      const SectionTitle("Visszajelz??s"),
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
    var size = MediaQuery.of(context).size;
    var width = size.width;

    const nameLabel = FormLabel("K??rlek, add meg a neved");
    var nameField = TextFormField(
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "E n??lk??l nem fogjuk tudni, ki vagy ;)";
        }
        return null;
      },
      controller: _nameController,
    );

    return Container(
      padding: const EdgeInsets.all(8.0),
      width: width > WeddingBreakpoints.mobileView ? width * 0.5 : width * 0.75,
      child: width > WeddingBreakpoints.mobileView
          ? Row(
              children: [
                nameLabel,
                const SizedBox(width: 8.0),
                Expanded(child: nameField),
              ],
            )
          : Column(
              children: [
                nameLabel,
                nameField,
              ],
            ),
    );
  }

  Widget _guestsField(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    const adultLabel =
        FormLabel("Veled egy??tt h??ny feln??tt vend??gre sz??m??tsunk?");

    var adultField = TextFormField(
      keyboardType: TextInputType.number,
      controller: _adultsController,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return "Csak akkor tudunk ??telt ??s italt biztos??tani, ha elmondod ;)";
        } else if ((int.tryParse(value!) ?? 0) < 0) {
          return "Rem??lem nem elvinni akarsz vend??geket, gondoljuk ??t ??jra ezt a sz??mot.";
        } else if ((int.tryParse(value!) ?? 0) > 5) {
          return "Kicsit soknak t??nik, biztosan csak egy megh??v??t adtunk nektek?";
        }

        return null;
      },
    );

    const childLabel = FormLabel("H??ny gyereket hozol magaddal?");

    var childField = TextFormField(
      keyboardType: TextInputType.number,
      controller: _childrenController,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return "Ha nincs egy se, ??rj be 0-t.";
        } else if ((int.tryParse(value!) ?? 0) < 0) {
          return "H??ha, ez nagyon kev??snek t??nik.";
        }
        return null;
      },
    );

    return Container(
      padding: const EdgeInsets.all(8.0),
      width: width > WeddingBreakpoints.mobileView ? width * 0.5 : width * 0.75,
      child: width > WeddingBreakpoints.mobileView
          ? Column(
              children: [
                Row(
                  children: [
                    const Expanded(flex: 2, child: adultLabel),
                    const SizedBox(width: 8.0),
                    Flexible(child: adultField),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    const Expanded(flex: 2, child: childLabel),
                    const SizedBox(width: 8.0),
                    Flexible(child: childField),
                  ],
                ),
              ],
            )
          : Column(
              children: [
                const SizedBox(height: 16.0),
                adultLabel,
                adultField,
                const SizedBox(height: 16.0),
                childLabel,
                childField,
              ],
            ),
    );
  }

  Widget _roomField(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return Container(
      padding: const EdgeInsets.all(8.0),
      width: width > WeddingBreakpoints.mobileView ? width * 0.5 : width * 0.75,
      child: Row(
        children: [
          Flexible(
            child: Row(
              children: const [
                Flexible(
                  child: FormLabel("Szeretn??tek-e sz??ll??st?"),
                ),
                SizedBox(width: 8.0),
                Tooltip(
                  message: "A sz??ll??st mi biztos??tjuk mindenkinek",
                  child: Icon(Icons.info_outline),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8.0),
          Checkbox(
            value: _roomValue,
            onChanged: (value) {
              setState(() {
                _roomValue = value ?? false;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _cookiesField(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return Container(
      padding: const EdgeInsets.all(8.0),
      width: width > WeddingBreakpoints.mobileView ? width * 0.5 : width * 0.75,
      child: Row(
        children: [
          Flexible(
            child: Row(
              children: const [
                Flexible(
                  child: FormLabel("Fogtok-e s??tit k??sz??teni?"),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8.0),
          Checkbox(
            value: _cookieValue,
            onChanged: (value) {
              setState(() {
                _cookieValue = value ?? false;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _foodAllergiesField(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return Container(
      padding: const EdgeInsets.all(8.0),
      width: width > WeddingBreakpoints.mobileView ? width * 0.5 : width * 0.75,
      child: Column(
        children: [
          const FormLabel(
              "Van-e olyan ??tel vagy ital ??rz??kenys??ged, amir??l ??rdemes tudnunk?"),
          const SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: _foodAllergiesController,
          ),
        ],
      ),
    );
  }

  Widget _contactField(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    const emailLabel = FormLabel("Email");

    var emailField = TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if ((value == null || value.isEmpty) && _phoneController.text.isEmpty) {
          return "??gy nehezen tudunk sz??lni, ha v??ltozik valami. Megadsz esetleg egy email c??met?";
        }
        return null;
      },
    );

    const phoneLabel = FormLabel("Telefon");

    var phoneField = TextFormField(
      controller: _phoneController,
      keyboardType: TextInputType.phone,
      validator: (value) {
        if ((value == null || value.isEmpty) && _emailController.text.isEmpty) {
          return "??gy nehezen tudunk sz??lni, ha v??ltozik valami. Nincs v??letlen??l egy telefonsz??mod?";
        }
        return null;
      },
    );

    return Container(
      padding: const EdgeInsets.all(8.0),
      width: width > WeddingBreakpoints.mobileView ? width * 0.5 : width * 0.75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FormLabel(
              "Sz??ks??g eset??n milyen m??don tudunk veled kapcsolatba l??pni?"),
          width > WeddingBreakpoints.mobileView
              ? Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(child: emailLabel),
                        const SizedBox(width: 8.0),
                        Flexible(flex: 2, child: emailField)
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(child: phoneLabel),
                        const SizedBox(width: 8.0),
                        Flexible(flex: 2, child: phoneField),
                      ],
                    ),
                  ],
                )
              : Column(
                  children: [
                    const SizedBox(height: 16.0),
                    emailLabel,
                    emailField,
                    const SizedBox(height: 16.0),
                    phoneLabel,
                    phoneField,
                  ],
                ),
        ],
      ),
    );
  }

  Widget _otherCommentField(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    const otherLabel = FormLabel(
        "Ha van b??rmi olyasmi, amit nem k??rdezt??nk meg, de sz??vesen v??laszoln?? r??, ??rd le ide nek??nk.");
    var otherField = TextFormField(
      minLines: 1,
      maxLines: 3,
      controller: _otherController,
    );

    return Container(
      padding: const EdgeInsets.all(8.0),
      width: width > WeddingBreakpoints.mobileView ? width * 0.5 : width * 0.75,
      child: Column(
        children: [
          const SizedBox(height: 16.0),
          otherLabel,
          const SizedBox(height: 16.0),
          otherField,
        ],
      ),
    );
  }

  Widget _codeField(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    var codeRow = Row(
      children: const [
        FormLabel("Ellen??rz?? k??d"),
        SizedBox(width: 8.0),
        Tooltip(
          message: "A megh??v??n tal??lhat??",
          child: Icon(Icons.info_outline),
        ),
      ],
    );

    var codeField = TextFormField(
      controller: _inviteCodeController,
    );

    return Container(
      padding: const EdgeInsets.all(8.0),
      width: width > WeddingBreakpoints.mobileView ? width * 0.5 : width * 0.75,
      child: width > WeddingBreakpoints.mobileView
          ? Row(
              children: [
                Flexible(
                  child: codeRow,
                ),
                const SizedBox(width: 8.0),
                Flexible(
                  child: codeField,
                ),
              ],
            )
          : Column(
              children: [
                const SizedBox(height: 16.0),
                codeRow,
                const SizedBox(height: 16.0),
                codeField,
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
      child: (isLoading)
          ? const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : const Text("Bek??ld??s"),
    );
  }

  Widget _result(RegistrationFormWidgetState state) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FormResult(
        state.registrationResult,
        () {
          context.read<RegistrationFormBloc>().add(RegistrationResultClosed());
        },
      ),
    );
  }
}
