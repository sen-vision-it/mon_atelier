/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../auth_cubit.dart';
class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}
class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _pinController = TextEditingController();
  void _submit(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      final authCubit = Modular.get<AuthCubit>();
      authCubit.authenticate(
        _usernameController.text,
        int.parse(_pinController.text),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          // Navigation après la connexion réussie
        } else if (state is Unauthenticated) {
          // Affichage d'un message d'erreur d'authentification
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Nom d\'utilisateur',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Le nom d\'utilisateur est requis.';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _pinController,
              decoration: const InputDecoration(
                labelText: 'Code PIN',
              ),
              keyboardType: TextInputType.number,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Le code PIN est requis.';
                } else if (value.length != 4) {
                  return 'Le code PIN doit comporter 4 chiffres.';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () => _submit(context),
              child: const Text('Connexion'),
            ),
          ],
        ),
      ),
    );
  }
}*/
