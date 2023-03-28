import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';
import 'package:mon_atelier/app/modules/utilisateur/utilisateur_repository.dart';
import 'package:mon_atelier/app/modules/utilisateur/utilisateur.dart';

part 'utilisateur_state.dart';

class UtilisateurCubit extends Cubit<UtilisateurState> {

  final UtilisateurRepository _utilisateurRepository;

  UtilisateurCubit(this._utilisateurRepository) : super(UtilisateurState.utilisateurInitial());

  Future<void> enregistrerUtilisateur(String nom, int code) async {
    try {
      final user = Utilisateur(nom: nom, code: code);
      await _utilisateurRepository.saveUtilisateur(user);
      emit(UtilisateurState.utilisateurEnregistre());
    } catch (e) {
      emit(UtilisateurState.error("Impossible de creer l'utilisateur : " + e.toString()));
    }
  }

  Future<void> connecterUtilisateur(String code) async {
    try {
      final user = await _utilisateurRepository.getUtilisateurByNom(code);
      if (user?.code == code) {
        emit(UtilisateurState.utilisateurConnecte(user!));
      } else {
        emit(UtilisateurState.error("Impossible de se connecter code invalid"));
      }
    } catch (_) {
      emit(UtilisateurState.utilisateurNonConnecte());
    }
  }

  Future<void> deconnecterUtilisateur() async{
    emit(UtilisateurState.utilisateurNonConnecte());
  }
}