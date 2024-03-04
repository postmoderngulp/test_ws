

import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final supabase = Supabase.instance.client;

  Future<void> signUp (String email,String password,String number,String name,) async{
    await supabase.auth.signUp(password: password,email: email);
    await supabase.from('profiles').insert({
      'name' : name,
      'number' : number,
      'role' : 'client',
      'balance' : 1000000
    });
  }


  Future<void> signIn (String email, String password) async{
    await supabase.auth.signInWithPassword(password: password,email: email);
  }

  Future<void> signOut () async{
    await supabase.auth.signOut();
  }

  Future<void> googleSignIn() async{
     const webClientId =
        '68631595723-1sve2l9lq0qi5poklfshuhn2jt5qpqth.apps.googleusercontent.com';

        final GoogleSignIn googleSignIn = GoogleSignIn(
          serverClientId: webClientId
        );

        final googleUser = await googleSignIn.signIn();
        final googleAuth = await googleUser!.authentication;


        await supabase.auth.signInWithIdToken(provider: OAuthProvider.google, idToken: googleAuth.idToken as String,accessToken: googleAuth.accessToken);


  }

  
}