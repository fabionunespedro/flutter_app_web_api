import 'package:flutter/material.dart';
import 'package:flutter_app_web_api/models/journal.dart';
import 'package:flutter_app_web_api/screens/add_journal_screen/add_journal_screen.dart';
import 'package:flutter_app_web_api/services/journal_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());

  JournalService service = JournalService();
  service.register("Ola Mundo");
  //service.get();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(color: Colors.white),
          elevation: 0,
          actionsIconTheme: IconThemeData(color: Colors.white),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: GoogleFonts.bitterTextTheme(),
      ),
      title: 'Simple Journal',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      initialRoute: "home",
      routes: {
        "home": (context) => const HomeScreen(),
        "add-journal":
            (context) => AddJournalScreen(
              journal: Journal(
                id: "id",
                content: "content",
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
              ),
            ),
      },
    );
  }
}
