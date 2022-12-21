import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wedding_page/ui/home/home_bloc.dart';
import 'package:wedding_page/ui/home/home_event.dart';
import 'package:wedding_page/ui/home/home_state.dart';
import 'package:wedding_page/ui/home/widgets/place_card.dart';
import 'package:wedding_page/ui/home/widgets/program_card.dart';
import 'package:wedding_page/ui/home/widgets/registration_form/registration_form.dart';
import 'package:wedding_page/ui/home/widgets/registration_form/registration_form_bloc.dart';
import 'package:wedding_page/ui/home/widgets/registration_form/registration_form_event.dart';
import 'package:wedding_page/ui/home/widgets/welcome_card.dart';
import 'package:wedding_page/ui/theme/breakpoints.dart';
import 'package:wedding_page/ui/theme/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => GetIt.I.get<HomeBloc>()..add(HomeCreated()),
        ),
        BlocProvider(
          create: (ctx) => GetIt.I.get<RegistrationFormBloc>()..add(RegistrationCreatedEvent()),
        ),
      ],
      child: const HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: BlocConsumer<HomeBloc, HomeState>(
              listenWhen: (previous, current) => current.isListenable(),
              buildWhen: (previous, current) => !current.isListenable(),
              listener: (ctx, state) {
                final registrationFormBloc = ctx.read<RegistrationFormBloc>();
                if (state is HomeFormSuccessState) {
                  registrationFormBloc.add(RegistrationSuccessEvent());
                } else if (state is HomeFormErrorState) {
                  registrationFormBloc
                      .add(RegistrationErrorEvent(state.errorType));
                }
              },
              builder: (ctx, state) => Center(
                child: Container(
                  color: WeddingColors.backgroundWhite,
                  width: width > WeddingBreakpoints.mobileView ? width * 0.8 : width,
                  child: Column(
                    children: [
                      const WelcomeCard(),
                      const PlaceCard(),
                      ProgramCard(),
                      // MenuCard(),
                      RegistrationForm(
                        onSubmit: (data) {
                          context.read<HomeBloc>().add(HomeFormSubmitted(data));
                          context.read<RegistrationFormBloc>().add(RegistrationLoadingEvent());
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
