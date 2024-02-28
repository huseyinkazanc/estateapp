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

  Future<void> registerUserAndSaveToSupabase(name, surname, email, password) async {
    // Register the user with Supabase
    final result = await registerUser(email, password);

    // User registration successful, save additional user data to Supabase database
    final response = await supabase.from('users').upsert([
      {
        'name': name,
        'surname': surname,
        'emaddil': email,
      }
    ]);

    if (response.error == null) {
      // Data saved successfully
      // Navigate to the home screen or perform any other action
    } else {
      // Error occurred while saving data
      // Handle the error
    }
  }

  Future<void> logoutUser(context, String page) async {
    if (supabase.auth.currentUser != null) {
      await supabase.auth.signOut();
      context.go(page);
    } else {
      print("kullanıcı zaten çıkış yapmış");
    }
  }
}
