import 'package:estate_flutter_app/main.dart';
import 'package:flutter/material.dart';

class AppService extends ChangeNotifier {
  Future<void> loginUser(email, password, context, Widget page) async {
    try {
      if (email == null && password == null) {
        return;
      }

      await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));

      print("Kullanıcı giriş  başarılı");
    } catch (e) {
      if (e.toString() == 'Invalid login credentials') {
        print('Kullanıcı adı veya parola yanlış');
      }
      print(e);
    }
  }

  Future<void> registerUser(email, password) async {
    try {
      if (email != null) {
        await supabase.auth.signUp(email: email, password: password);
      }

      print("başarılır");
    } catch (e) {
      print("hata bu $e");
    }
  }

  Future<void> logoutUser() async {
    if (supabase.auth.currentUser != null) {
      await supabase.auth.signOut();
    } else {
      print("kullanıcı zaten çıkış yapmış");
    }
  }
}
