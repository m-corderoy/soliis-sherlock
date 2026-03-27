import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyARlz6mwNIX9FktNMtkfKI6FIinqH-iuMo",
            authDomain: "holmes-xws01o.firebaseapp.com",
            projectId: "holmes-xws01o",
            storageBucket: "holmes-xws01o.firebasestorage.app",
            messagingSenderId: "520496699147",
            appId: "1:520496699147:web:2f37ee5cb7b92cc4efb40e"));
  } else {
    await Firebase.initializeApp();
  }
}
