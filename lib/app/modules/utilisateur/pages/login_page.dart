import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mon_atelier/app/modules/utilisateur/utilisateur_cubit.dart';
import '../../home/home_page.dart';
import 'package:mon_atelier/app/modules/utilisateur/utilisateur_repository.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'Connexion'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}
class LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _pinCodeController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _pinCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authenticationCubit = Modular.get<UtilisateurCubit>();
    final userRepository = Modular.get<UtilisateurRepository>();

    return BlocConsumer<UtilisateurCubit, UtilisateurState>(
      bloc: authenticationCubit,
      builder: (context, state) {
        bool isLoading = false;
        if (state is UtilisateurState.utilisateurConnecte) {
          Modular.to.pushReplacementNamed(HomePage.routeName);
        } else if (state is UtilisateurState.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is UtilisateurState.utilisateurNonConnecte) {
          isLoading = false;
        }

        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Container(
                width: 400,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _emailController,
                        //validator: Validators.emailValidator,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _pinCodeController,
                        //validator: Validators.pinCodeValidator,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'PIN code',
                        ),
                      ),
                      SizedBox(height: 16),
                      isLoading
                          ? CircularProgressIndicator()
                          : ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            authenticationCubit.connecterUtilisateur(
                              int.parse(_pinCodeController.text) as String,
                            );
                            isLoading = true;
                          }
                        },
                        child: Text('Login'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}