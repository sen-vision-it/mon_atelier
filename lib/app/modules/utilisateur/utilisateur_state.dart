part of 'utilisateur_cubit.dart';

class UtilisateurState extends Equatable {

  final bool isAuthenticated;
  final Utilisateur? user;
  final String? error;

const UtilisateurState._({
  this.isAuthenticated = false,
  this.user,
  this.error,
});

  const UtilisateurState.utilisateurInitial() : this._();

  const UtilisateurState.utilisateurConnecte(Utilisateur user)
      : this._(isAuthenticated: true, user: user);

  const UtilisateurState.utilisateurNonConnecte() : this._();

  const UtilisateurState.utilisateurEnregistre() : this._();

  const UtilisateurState.error(String error)
      : this._(error: error);

@override
List<Object?> get props => [isAuthenticated, user, error];
}

/*class UtilisateurInitial extends UtilisateurState {}

class UtilisateurEnregistre extends UtilisateurState {}

class UtilisateurErreur extends UtilisateurState {}

class UtilisateurConnecte extends UtilisateurState {
  Utilisateur? user;
}

class UtilisateurNonConnecte extends UtilisateurState {}*/

