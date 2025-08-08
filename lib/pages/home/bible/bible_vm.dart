import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../../../domain/model/bible_model.dart';
import '../../base/base.vm.dart';

class BibleViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  String testament = 'Old Testament';
  List<BibleVerse> allVerses = [];

  void setTestament(String newTestament) {
    testament = newTestament;
    notifyListeners();
  }

  final List<String> oldTestamentBooks = [
    'Genesis', 'Exodus', 'Leviticus', 'Numbers', 'Deuteronomy',
    'Joshua', 'Judges', 'Ruth', '1 Samuel', '2 Samuel', '1 Kings',
    '2 Kings', '1 Chronicles', '2 Chronicles', 'Ezra', 'Nehemiah',
    'Esther', 'Job', 'Psalm', 'Proverbs', 'Ecclesiastes',
    'Song of Solomon', 'Isaiah', 'Jeremiah', 'Lamentations',
    'Ezekiel', 'Daniel', 'Hosea', 'Joel', 'Amos', 'Obadiah', 'Jonah',
    'Micah', 'Nahum', 'Habakkuk', 'Zephaniah', 'Haggai', 'Zechariah',
    'Malachi',
  ];

  final List<String> newTestamentBooks = [
    'Matthew', 'Mark', 'Luke', 'John', 'Acts', 'Romans', '1 Corinthians',
    '2 Corinthians', 'Galatians', 'Ephesians', 'Philippians', 'Colossians',
    '1 Thessalonians', '2 Thessalonians', '1 Timothy', '2 Timothy', 'Titus',
    'Philemon', 'Hebrews', 'James', '1 Peter', '2 Peter', '1 John', '2 John',
    '3 John', 'Jude', 'Revelation',
  ];

  Future<void> loadBibleData() async {

    final jsonString = await rootBundle.loadString('assets/docs/kjv_bible_cleaned.json');
    final List<dynamic> jsonList = jsonDecode(jsonString);
    allVerses = jsonList.map((e) => BibleVerse.fromJson(e)).toList();
    print(allVerses.length);
    notifyListeners();

  }

  List<String> getUniqueBooks() {
    return allVerses.map((v) => v.book).toSet().toList();
  }

  List<int> getChapters(String book) {
    return allVerses
        .where((v) => v.book == book)
        .map((v) => v.chapter)
        .toSet()
        .toList()
      ..sort();
  }

  List<BibleVerse> getVerses(String book, int chapter) {
    return allVerses.where((v) => v.book == book && v.chapter == chapter).toList();
  }
}