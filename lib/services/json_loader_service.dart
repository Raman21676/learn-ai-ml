import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/question.dart';

class JsonLoaderService {
  Future<List<Question>> loadQuestions(String challengeId) async {
    try {
      final String fileName = 'challenge_${challengeId.substring(1).padLeft(2, '0')}.json';
      final String jsonString = await rootBundle.loadString(
        'assets/questions/$fileName',
      );
      
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);
      final List<dynamic> questionsJson = jsonData['questions'];
      
      return questionsJson.map((q) => Question.fromJson(q)).toList();
    } catch (e) {
      throw Exception('Failed to load questions for $challengeId: $e');
    }
  }

  Future<Challenge> loadChallenge(String challengeId) async {
    try {
      final String fileName = 'challenge_${challengeId.substring(1).padLeft(2, '0')}.json';
      final String jsonString = await rootBundle.loadString(
        'assets/questions/$fileName',
      );
      
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);
      return Challenge.fromJson(jsonData);
    } catch (e) {
      throw Exception('Failed to load challenge $challengeId: $e');
    }
  }

  Future<Map<String, dynamic>> loadLevelData(int levelId) async {
    try {
      final String fileName = 'level${levelId}_data.json';
      final String jsonString = await rootBundle.loadString(
        'assets/data/$fileName',
      );
      
      return jsonDecode(jsonString);
    } catch (e) {
      throw Exception('Failed to load level $levelId data: $e');
    }
  }

  Future<Map<String, dynamic>> loadAllLevels() async {
    try {
      final String jsonString = await rootBundle.loadString(
        'assets/data/all_levels.json',
      );
      
      return jsonDecode(jsonString);
    } catch (e) {
      throw Exception('Failed to load all levels: $e');
    }
  }
}
