import 'package:flutter/material.dart';
import 'package:flutter_app_web_api/database/database.dart';
import 'package:flutter_app_web_api/screens/home_screen/widgets/home_screen_list.dart';

import '../../models/journal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime currentDay = DateTime.now();

  int windowPage = 10;

  Map<String, Journal> database = {};

  final ScrollController _listScrollController = ScrollController();

  @override
  void initState() {
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${currentDay.day}  |  ${currentDay.month}  |  ${currentDay.year}"),
      ),
      body: ListView(
        controller: _listScrollController,
        children: generateListJournalCards(
          windowPage: windowPage,
          currentDay: currentDay,
          database: database,
        ),
      ),
    );
  }

  void refresh() {
    setState(() {
      database = generateRandomDatabase(maxGap: windowPage, amount: 3);
    });
  }
}
