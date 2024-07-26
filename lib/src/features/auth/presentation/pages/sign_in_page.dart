import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:zaracast/src/features/auth/data/params/sign_in_with_phone_params.dart';
import 'package:zaracast/src/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:zaracast/src/shared/presentation/widgets/form_builder.dart';
import 'package:zaracast/src/shared/presentation/widgets/text_form_field_builder.dart';

final signInFormKey = GlobalKey<FormState>();

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final spacer = SizedBox(height: 16);

    final countryData = PhoneCountryData.fromMap({
      'country': 'United States',
      'countryRU': 'США',
      'internalPhoneCode': '1',
      'countryCode': 'US',
      'phoneMask': '+0 (555) 123 4567',
    });

    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) => [
          EnterEmailOtp,
          EnterPhoneOtp,
          AuthError,
        ].contains(current.runtimeType),
        listener: (context, state) {
          if (state is EnterEmailOtp) {
            context.push('/sign-in/otp:email');
          }
          if (state is EnterPhoneOtp) {
            context.push('/sign-in/otp:phone');
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
            context.read<AuthBloc>().add(const AuthClearError());
          }
        },
        child: Center(
          child: Column(
            children: [
              Text(
                'ZaraCast',
                maxLines: 1,
                style: Theme.of(context).textTheme.headlineLarge ??
                    const TextStyle(),
              ),
              FormBuilder(
                formKey: signInFormKey,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // TODO: Add support for phone auth beyond just the US.
                  /*
                  CountryDropdown(
                    printCountryName: true,
                    initialCountryData: _countryData,
                    filter: PhoneCodes.findCountryDatasByCountryCodes(
                      countryIsoCodes: [
                        'US',
                      ],
                    ),
                    onCountrySelected: (PhoneCountryData countryData) {
                      setState(() {
                        _countryData = countryData;
                      });
                    },
                  ),
                  */
                  TextFormFieldBuilder(
                    key: const Key('phoneFormField'),
                    autocorrect: false,
                    autofillHints: const [AutofillHints.telephoneNumber],
                    autofocus: true,
                    hintText: countryData.phoneMaskWithoutCountryCode,
                    inputFormatters: [
                      PhoneInputFormatter(
                        defaultCountryCode: countryData.countryCode,
                      ),
                    ],
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      controller.text = value;
                    },
                    validator: ValidationBuilder().phone().build(),
                  ),
                  // TODO: Add support for email sign in.
                  /*
                  CustomTextFormField(
                    autocorrect: false,
                    autofillHints: const [AutofillHints.email],
                    autofocus: false,
                    hintText: 'Email',
                    key: const Key('emailFormField'),
                    keyboardType: TextInputType.emailAddress,
                    maxLength: 255,
                    onChanged: (value) => print('email changed: $value'),
                    validator: ValidationBuilder().email().build(),
                  ),
                  */
                  spacer,
                  FilledButton(
                    onPressed: () {
                      if (signInFormKey.currentState?.validate() ?? false) {
                        final params =
                            SignInWithPhoneParams(phone: controller.text);

                        context.read<AuthBloc>().add(
                              SignInWithPhone(params),
                            );
                      }
                    },
                    child: BlocBuilder<AuthBloc, AuthState>(
                      buildWhen: (previous, current) => current is AuthLoading,
                      builder: (context, state) {
                        if (state is AuthLoading) {
                          return const CircularProgressIndicator();
                        }
                        return const Text('Sign In');
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
