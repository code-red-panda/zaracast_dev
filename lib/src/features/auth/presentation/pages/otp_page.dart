import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zaracast/src/features/auth/data/params/verify_phone_otp_params.dart';
import 'package:zaracast/src/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:zaracast/src/shared/presentation/widgets/text_form_field_builder.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (previous, current) =>
          [Authenticated, AuthError].contains(current.runtimeType),
      listener: (context, state) {
        if (state is Authenticated) {
          context.go('/settings');
        }
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );

          context.read<AuthBloc>().add(const AuthClearError());
        }
      },
      buildWhen: (previous, current) =>
          [EnterEmailOtp, EnterPhoneOtp].contains(current.runtimeType),
      builder: (context, state) {
        const spacer = SizedBox(height: 16);
        var otpTarget = '';

        if (state is EnterEmailOtp) {
          otpTarget = state.email;
        } else if (state is EnterPhoneOtp) {
          otpTarget = state.phone;
        }

        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              children: [
                Text(
                  'Verification',
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ) ??
                      const TextStyle(),
                ),
                Text(
                  'Enter the one-time passcode sent to: $otpTarget',
                  maxLines: 1,
                  //style: AppFonts.titleSmall,
                ),
                spacer,
                TextFormFieldBuilder(
                  key: const Key('otpFormField'),
                  autocorrect: false,
                  autofillHints: const <String>['otp'],
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  onChanged: (value) {
                    if (value.length == 6) {
                      AuthEvent event;
                      /*
                      if (otpType == 'email') {
                        final params = VerifyEmailOtpParams(
                          email: otpTarget,
                          otp: value,
                        );
                      } else if (otpType == 'phone') {
                        final params = VerifyPhoneOtpParams(
                          phone: otpTarget,
                          otp: value,
                        );

                        event = VerifyPhoneOtp(params);
                      }
                      */
                      final params = VerifyPhoneOtpParams(
                        phone: otpTarget,
                        otp: value,
                      );

                      event = VerifyPhoneOtp(params);

                      context.read<AuthBloc>().add(event);
                    }
                  },
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  buildWhen: (previous, current) => current is AuthLoading,
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return const CircularProgressIndicator();
                    }
                    return spacer;
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
