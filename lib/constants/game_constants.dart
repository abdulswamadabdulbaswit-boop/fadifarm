// ============================================================================
// GAME CONSTANTS - All game configuration data
// ============================================================================
// Want to change prices, crop names, or grow times?
// Change them HERE! Don't search the entire code!
// ============================================================================

class GameConstants {
  // ========================================================================
  // STARTING VALUES - What player gets when starting new game
  // ========================================================================
  static const int STARTING_MONEY = 500;
  static const int MAX_ENERGY = 100;
  static const int STARTING_ENERGY = 100;
  
  // ========================================================================
  // CROPS - What can be planted
  // ========================================================================
  // Change 'growTime' to: 30 = 30 seconds (good for testing)
  //                      180 = 3 minutes (good for real game)
  static const Map<String, dynamic> CROPS = {
    'carrot': {
      'name': 'Carrot',
      'emoji': '🥕',
      'growTime': 30, // seconds - CHANGE THIS!
      'sellPrice': 50, // How much you get when selling
      'seedPrice': 10, // Cost to buy seeds
    },
    'tomato': {
      'name': 'Tomato',
      'emoji': '🍅',
      'growTime': 45,
      'sellPrice': 75,
      'seedPrice': 15,
    },
    'corn': {
      'name': 'Corn',
      'emoji': '🌽',
      'growTime': 60,
      'sellPrice': 100,
      'seedPrice': 25,
    },
    'strawberry': {
      'name': 'Strawberry',
      'emoji': '🍓',
      'growTime': 50,
      'sellPrice': 80,
      'seedPrice': 20,
    },
  };

  // ========================================================================
  // ANIMALS - What can be bought
  // ========================================================================
  // Each animal produces something daily (milk, eggs, etc)
  static const Map<String, dynamic> ANIMALS = {
    'cow': {
      'name': 'Cow',
      'emoji': '🐄',
      'price': 500, // Cost to buy
      'dailyProduction': 5, // How much milk per day
      'productName': 'Milk',
    },
    'chicken': {
      'name': 'Chicken',
      'emoji': '🐔',
      'price': 200,
      'dailyProduction': 2,
      'productName': 'Egg',
    },
    'goat': {
      'name': 'Goat',
      'emoji': '🐐',
      'price': 400,
      'dailyProduction': 3,
      'productName': 'Milk',
    },
    'sheep': {
      'name': 'Sheep',
      'emoji': '🐑',
      'price': 350,
      'dailyProduction': 2,
      'productName': 'Wool',
    },
  };

  // ========================================================================
  // BUILDINGS - What can be constructed
  // ========================================================================
  static const Map<String, dynamic> BUILDINGS = {
    'house': {
      'name': 'House',
      'emoji': '🏠',
      'price': 1000,
      'description': 'Increase storage capacity',
    },
    'barn': {
      'name': 'Barn',
      'emoji': '🏚️',
      'price': 1500,
      'description': 'Store more crops',
    },
    'coop': {
      'name': 'Chicken Coop',
      'emoji': '🐔',
      'price': 500,
      'description': 'Keep chickens happy',
    },
  };

  // ========================================================================
  // DIFFICULTY MULTIPLIERS
  // ========================================================================
  // Easy = earn more money, crops grow faster
  // Normal = balanced
  // Hard = earn less money, crops grow slower
  static const Map<String, dynamic> DIFFICULTY = {
    'easy': {
      'name': '😊 EASY',
      'moneyMultiplier': 1.5,
      'timeMultiplier': 0.7,
    },
    'normal': {
      'name': '😐 NORMAL',
      'moneyMultiplier': 1.0,
      'timeMultiplier': 1.0,
    },
    'hard': {
      'name': '😤 HARD',
      'moneyMultiplier': 0.7,
      'timeMultiplier': 1.3,
    },
  };

  // ========================================================================
  // GAME MECHANICS - Energy and costs
  // ========================================================================
  static const int ENERGY_COST_PLANT = 5; // Energy used when planting
  static const int ENERGY_COST_HARVEST = 10; // Energy used when harvesting
  static const int REST_COST = 50; // Money cost to rest and restore energy
  static const int REST_RESTORE = 50; // How much energy restored
}
