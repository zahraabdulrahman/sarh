import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sarh/Screens/SplashScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:provider/provider.dart';
// import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // Platfrm.isAndroid?
  await Firebase.initializeApp(
    options:  const FirebaseOptions(
      apiKey: "AIzaSyCgcjK2E_ixq72pO10-pbzavlGNSqsBhyc",
      appId: "1:451801507625:android:492fc2e026a708cfd07938",
      messagingSenderId: "451801507625",
      projectId: "sarh-3efed",
    ),
  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const SplashScreen(),
    },
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: const [
      Locale('ar'), // Arabic
    ],
  )
  );
}
