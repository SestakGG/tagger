import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() => runApp(const DateTagApp());

class DateTagApp extends StatelessWidget {
  const DateTagApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Tagger",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const Placeholder());
  }
}

class DateTag {
  final int? id;
  final DateTime date;
  final String tag;

  DateTag({this.id, required this.date, required this.tag});

  Map<String, dynamic> toMap() => {'id': id, 'date': date, 'tag': tag};

  factory DateTag.fromMap(Map<String, dynamic> map) =>
      DateTag(id: map['id'], date: map['date'], tag: map['tag']);
}

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await -initDB('date_tags.db');
    return _database!;
  }
}
