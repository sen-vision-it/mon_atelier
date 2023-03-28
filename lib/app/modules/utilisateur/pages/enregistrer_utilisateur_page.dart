import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utilisateur_cubit.dart';

class EnregistrerUtilisateurPage extends StatefulWidget {
  final String title;
  const EnregistrerUtilisateurPage({Key? key, this.title = 'S''Inscrire'}) : super(key: key);
  @override
  EnregistrerUtilisateurPageState createState() => EnregistrerUtilisateurPageState();
}
class EnregistrerUtilisateurPageState extends State<EnregistrerUtilisateurPage> {

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _codeController = TextEditingController();
  final _codeFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocProvider(
        create: (_) => UtilisateurCubit(),
        child: BlocConsumer<UtilisateurCubit, UtilisateurState>(
          listener: (context, state) {
            if (state is UtilisateurState.utilisateurConnecte(user)) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Registration successful')),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                      ),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(_codeFocus),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _codeController,
                      decoration: InputDecoration(
                        labelText: 'Code',
                      ),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      focusNode: _codeFocus,
                      validator: (value) {
                        if (value.length != 4) {
                          return 'Code must be 4 characters long';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: state is RegisterLoading
                          ? null
                          : () {
                        if (_formKey.currentState.validate()) {
                          context.read<RegisterCubit>().register(
                            name: _nameController.text,
                            code: _codeController.text,
                          );
                        }
                      },
                      child: state is RegisterLoading
                          ? CircularProgressIndicator()
                          : Text('Register'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}