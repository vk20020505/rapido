import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rapido/screens.dart/login.dart';
import 'firebase_options.dart';
// import 'package:provider/provider.dart';
// import 'datahandler/appdata.dart';
import 'screens.dart/home.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      
        // textTheme: TextTheme(),
          appBarTheme:  const AppBarTheme(
          
            // titleTextStyle: TextStyle(color: Colors.amber),
            backgroundColor: Colors.amber,
            iconTheme: IconThemeData(size: 30),
            foregroundColor: Colors.black,
    
          ),
          textTheme: TextTheme(
            displayMedium: GoogleFonts.lato(fontSize: 25,color: Colors.black,fontWeight: FontWeight.w400),
            titleSmall: GoogleFonts.lato(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w400),
            titleMedium: GoogleFonts.lato(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),
            bodyMedium: GoogleFonts.lato(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w600),
            bodySmall: GoogleFonts.lato(fontSize: 17,color: Colors.black45,fontWeight: FontWeight.w400),
            labelLarge: GoogleFonts.ubuntu(fontSize: 18,color: Colors.black38,fontWeight: FontWeight.w500),
            labelMedium: GoogleFonts.lato(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w600, fontStyle: FontStyle.italic),
            labelSmall: GoogleFonts.lato(fontSize: 15,color: Colors.black54,fontWeight: FontWeight.w400),
            bodyLarge: GoogleFonts.lato(fontSize: 19,color: Colors.black,fontWeight: FontWeight.w600)
          )
          // primaryColor: Colors.amber
          
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: loginPage(),
    );
  }
}

