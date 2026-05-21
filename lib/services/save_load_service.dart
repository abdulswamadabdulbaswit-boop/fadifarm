// ============================================================================
// SAVE/LOAD SERVICE - Persistent game storage
// ============================================================================
// Uses SharedPreferences to save game data to device storage.
// When player closes app and opens later, their farm is still there!
// ============================================================================

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/farm_model.dart';

class SaveLoadService {
  // Key used to store game data in SharedPreferences
  static const String SAVE_KEY = 'fadi_farm_save_game';

  // ========================================================================
  // SAVE GAME - stores all progress to device
  // ========================================================================
  static Future<void> saveGame(FarmModel farm) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      
      // Create map with all important game data
      final gameData = {
        'playerName': farm.playerName.value,
        'farmName': farm.farmName.value,
        'money': farm.money.value,
        'energy': farm.energy.value,
        'level': farm.level.value,
        'experience': farm.experience.value,
        'difficulty': farm.difficulty.value,
        'totalHarvested': farm.totalHarvested.value,
        'totalEarned': farm.totalEarned.value,
        'daysPlayed': farm.daysPlayed.value,
        'lastSaveTime': DateTime.now().toIso8601String(),
      };

      // Convert to JSON string
      final jsonString = jsonEncode(gameData);
      
      // Save to device storage
      await prefs.setString(SAVE_KEY, jsonString);
      
      print('✅ GAME SAVED SUCCESSFULLY!');
    } catch (e) {
      print('❌ ERROR SAVING GAME: $e');
    }
  }

  // ========================================================================
  // LOAD GAME - restores saved progress from device
  // ========================================================================
  static Future<bool> loadGame(FarmModel farm) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      
      // Try to get saved data
      final jsonString = prefs.getString(SAVE_KEY);

      // Check if save exists
      if (jsonString == null) {
        print('❌ No save file found');
        return false;
      }

      // Decode JSON and restore all data
      final gameData = jsonDecode(jsonString);
      
      farm.playerName.value = gameData['playerName'] ?? 'Farmer';
      farm.farmName.value = gameData['farmName'] ?? 'My Farm';
      farm.money.value = gameData['money'] ?? 500;
      farm.energy.value = gameData['energy'] ?? 100;
      farm.level.value = gameData['level'] ?? 1;
      farm.experience.value = gameData['experience'] ?? 0;
      farm.difficulty.value = gameData['difficulty'] ?? 'normal';
      farm.totalHarvested.value = gameData['totalHarvested'] ?? 0;
      farm.totalEarned.value = gameData['totalEarned'] ?? 0;
      farm.daysPlayed.value = gameData['daysPlayed'] ?? 0;

      print('✅ GAME LOADED SUCCESSFULLY!');
      return true; // Success!
    } catch (e) {
      print('❌ ERROR LOADING GAME: $e');
      return false; // Failed
    }
  }

  // ========================================================================
  // DELETE SAVE - removes saved game completely
  // ========================================================================
  static Future<void> deleteSave() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(SAVE_KEY);
      print('✅ Save file deleted!');
    } catch (e) {
      print('❌ ERROR DELETING SAVE: $e');
    }
  }

  // ========================================================================
  // CHECK IF SAVE EXISTS - before showing load button
  // ========================================================================
  static Future<bool> hasSave() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final exists = prefs.containsKey(SAVE_KEY);
      print(exists ? '✅ Save exists' : '❌ No save found');
      return exists;
    } catch (e) {
      print('❌ ERROR CHECKING SAVE: $e');
      return false;
    }
  }

  // ========================================================================
  // GET SAVE INFO - show player info from save without loading full game
  // ========================================================================
  static Future<Map<String, dynamic>?> getSaveInfo() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(SAVE_KEY);
      
      if (jsonString == null) return null;
      
      return jsonDecode(jsonString);
    } catch (e) {
      print('❌ ERROR GETTING SAVE INFO: $e');
      return null;
    }
  }
}
