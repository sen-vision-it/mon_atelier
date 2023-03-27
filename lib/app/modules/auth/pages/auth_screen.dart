import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:your_app/presentation/auth/register_form.dart';

import '../auth_cubit.dart';
import 'auth_form.dart';
class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authCubit = Modular.get<AuthCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentification'),
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is Unauthenticated) {
            return AuthForm();
          } else if (state is Authenticated) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Connecté en tant que:'),
                const SizedBox(height: 8),
                Text(state.user.username),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => authCubit.logout(),
                  child: const Text('Déconnexion'),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => RegisterForm(
              onSave: (user) async {
                await DatabaseService.saveUser(user);
                authCubit.authenticate(user.username, user.pin);
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}