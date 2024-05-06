import 'package:flutter/material.dart';
import 'package:pontoalegre/screen/singIn/singin_model.dart';

class SingInProvider extends ChangeNotifier {
  final keyLogin = GlobalKey<FormState>();
  SingInModel singIn = SingInModel(email: '', password: '', loading: false);

  void changedEmail(String value) {
    singIn = SingInModel(email: value, password: singIn.password, loading: singIn.loading);
    notifyListeners();
  }

  void changedPassword(String value) {
    singIn = SingInModel(email: singIn.email, password: value, loading: singIn.loading);
    notifyListeners();
  }

  void loading(bool value) {
    singIn = SingInModel(email: singIn.email, password: singIn.password, loading: value);
    notifyListeners();
  }

  void onSubmitted(BuildContext ctx) async {
    loading(true);
    try {
      await Future.delayed(const Duration(seconds: 5));

      debugPrint(singIn.email);
      debugPrint(singIn.password);
    } finally {
      loading(false);
    }

    notifyListeners();
  }
}
