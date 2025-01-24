import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evenage/application/auth/auth_bloc.dart';
import 'package:evenage/presentation/core/colors.dart';
import 'package:sign_in_button/sign_in_button.dart';

class SignInWithGoogleButton extends StatelessWidget {
  const SignInWithGoogleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.user.name == ""
            ? BlocSelector<AuthBloc, AuthState, bool>(
                selector: (state) => state.islogging ? true : false,
                builder: (context, state) {
                  return state
                      ? const Center(
                          child: CupertinoActivityIndicator(
                            color: tangBlue,
                            radius: 30,
                          ),
                        )
                      : SizedBox(
                        height: 40,
                        child: SignInButton(
                        
                            Buttons.google,
                            onPressed: () {
                              context.read<AuthBloc>().add(
                                    const AuthEvent.signInWithGoogle(),
                                  );
                            },
                            text: 'Sign in with Google ',
                            
                          ),
                      );
                },
              )
            : BlocSelector<AuthBloc, AuthState, bool>(
                selector: (state) => state.islogging ? true : false,
                builder: (context, state) {
                  return state
                      ? const Center(
                          child: CupertinoActivityIndicator(
                            color: tangBlue,
                            radius: 30,
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(
                                  const AuthEvent.signOut(),
                                );
                          },
                          child: const Text('Log Out '),
                        );
                },
              );
      },
    );
  }
}
