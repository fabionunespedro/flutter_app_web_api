import 'package:flutter/material.dart';
import 'package:flutter_app_web_api/helpers/weekday.dart';
import 'package:flutter_app_web_api/models/journal.dart';

class AddJournalScreen extends StatelessWidget {
  final Journal journal;
  const AddJournalScreen({super.key, required this.journal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("${WeekDay(journal.createdAt.weekday).long}")));
  }
}
