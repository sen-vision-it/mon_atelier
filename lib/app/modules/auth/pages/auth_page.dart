/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../auth_cubit.dart';

class AuthPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = Modular.get<AuthCubit>();

    return Scaffold(
        appBar: AppBar(
        title: Text('Authentification'),
    ),
    body: BlocConsumer<AuthCubit, AuthState>(
    bloc: authCubit,
    listener: (context, state) {
    if (state is AuthSuccess) {
    // Naviguez vers l'écran principal de l'application
    } else if (state is AuthFailure) {
    // Affichez un message d'erreur à l'utilisateur
    }
    },
    builder: (context, state) {
    if (state is AuthLoading) {
    return Center(
    child: CircularProgressIndicator(),
    );
    } else {
    return Padding(
    padding: EdgeInsets.all(16.0),
    child: Form(
    key: _formKey,
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    TextFormField(
    controller: _codeController,
    decoration: InputDecoration(
    labelText: 'Code',
    border: OutlineInputBorder(),
    ),
    keyboardType: TextInputType.number,
    maxLength: 4,
    validator: (value) {
    if (value.isEmpty) {
    return 'Veuillez entrer un code';
    } else if (value.length != 4) {
    return 'Le code doit contenir 4 chiffres';
    }
    return null;
    },
    ),
    SizedBox(
    height: 16.0,
    ),
    }}
*/
