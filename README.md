# FADI FARM - Flutter Farming Game 🌾

A complete farming simulation game built with **Flutter** and **Dart**. Grow crops, raise animals, earn money, and build your dream farm!

## 📱 Features

✅ **Main Menu** - Easy navigation with difficulty selection
✅ **Farm System** - 9 plots to plant different crops
✅ **Crops** - Carrots, Tomatoes, Corn, Strawberries
✅ **Animals** - Cows, Chickens, Goats, Sheep
✅ **Shop** - Buy seeds, animals, and buildings
✅ **Inventory** - Manage your collected items
✅ **Save/Load** - Game progress persistence
✅ **Google AdMob** - Banner & Interstitial ads (placeholder IDs)
✅ **Energy System** - Manage player energy
✅ **Money System** - Earn and spend money
✅ **Level System** - Progress through levels

## 🎮 Game Mechanics

### 🌱 Crops
- **Carrot** 🥕 - 30s grow time, 50💰 sell price
- **Tomato** 🍅 - 45s grow time, 75💰 sell price  
- **Corn** 🌽 - 60s grow time, 100💰 sell price
- **Strawberry** 🍓 - 50s grow time, 80💰 sell price

### 🐄 Animals
- **Cow** 🐄 - 500💰, produces 5 milk/day
- **Chicken** 🐔 - 200💰, produces 2 eggs/day
- **Goat** 🐐 - 400💰, produces 3 milk/day
- **Sheep** 🐑 - 350💰, produces 2 wool/day

### ⚙️ Difficulty Levels
- **Easy** - 1.5x money, 0.7x grow time
- **Normal** - Balanced
- **Hard** - 0.7x money, 1.3x grow time

## 📂 Project Structure

```
fadi_farm/
├── lib/
│   ├── main.dart
│   ├── constants/
│   │   └── game_constants.dart
│   ├── models/
│   │   └── farm_model.dart
│   ├── services/
│   │   ├── save_load_service.dart
│   │   └── admob_service.dart
│   └── screens/
│       ├── main_menu_screen.dart
│       ├── game_screen.dart
│       ├── shop_screen.dart
│       └── inventory_screen.dart
├── assets/
│   ├── images/
│   │   ├── player/
│   │   ├── animals/
│   │   ├── crops/
│   │   ├── buildings/
│   │   └── ui/
│   └── sounds/
│       ├── sfx/
│       └── music/
└── pubspec.yaml
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK >= 3.0.0
- Dart >= 3.0.0
- Android Studio or VS Code with Flutter extension

### Installation

1. **Create Flutter Project**
```bash
flutter create fadi_farm
cd fadi_farm
```

2. **Copy all files** from this repository to your project

3. **Get dependencies**
```bash
flutter pub get
```

4. **Run the app**
```bash
flutter run
```

## 🎯 How to Play

1. **Start Game** - Choose difficulty (Easy/Normal/Hard)
2. **Plant Crops** - Tap on farm plots to plant seeds
3. **Wait to Grow** - Crops take time to grow based on type
4. **Harvest** - Tap on grown crops to harvest and earn money
5. **Buy Animals** - Visit Shop to buy animals for daily income
6. **Manage Energy** - Rest to restore energy for farming activities
7. **Save Game** - Progress is auto-saved every 30 seconds

## 📋 Customization

### Change Grow Times
Edit `lib/constants/game_constants.dart`:
```dart
'carrot': {
  'growTime': 30, // Change this! (in seconds)
  'sellPrice': 50,
  'seedPrice': 10,
}
```

### Change Prices
Edit crop or animal prices in `lib/constants/game_constants.dart`:
```dart
'seedPrice': 10, // Change seed cost
'price': 500, // Change animal cost
'sellPrice': 50, // Change harvest value
```

### Setup Google AdMob

1. Go to https://admob.google.com/
2. Get your App ID and Ad Unit IDs
3. Edit `lib/services/admob_service.dart`:
```dart
static const String ADMOB_APP_ID = 'YOUR_APP_ID';
static const String BANNER_AD_UNIT_ID = 'YOUR_BANNER_ID';
static const String INTERSTITIAL_AD_UNIT_ID = 'YOUR_INTERSTITIAL_ID';
```

## 🛠️ Dependencies

- **get** (4.6.6) - State management & routing
- **shared_preferences** (2.2.2) - Local data storage
- **google_mobile_ads** (4.0.0) - AdMob integration

## 📦 Add Assets

Create folders in `assets/` directory:
```bash
mkdir -p assets/images/{player,animals,crops,buildings,ui}
mkdir -p assets/sounds/{sfx,music}
```

Add your images and sounds:
- Player sprites in `assets/images/player/`
- Animal images in `assets/images/animals/`
- Crop images in `assets/images/crops/`
- Building images in `assets/images/buildings/`
- UI elements in `assets/images/ui/`
- Sound effects in `assets/sounds/sfx/`
- Background music in `assets/sounds/music/`

**Free Asset Sources:**
- Kenney.nl - https://kenney.nl/assets
- OpenGameArt.org - https://opengameart.org/
- itch.io - https://itch.io/game-assets

## 💾 Save/Load System

The game automatically saves every 30 seconds using `SharedPreferences`. 

**Saved Data:**
- Player name & farm name
- Money & energy
- Level & experience
- Game statistics
- Difficulty setting

## 🎨 UI/UX Features

- Responsive design - works on all screen sizes
- Color-coded stats (green=good, orange=warning, red=critical)
- Smooth animations & transitions
- Intuitive tap/click interactions
- Auto-save notifications

## 🐛 Debugging Tips

1. **Check logs** - Run `flutter logs` in terminal
2. **Hot reload** - Press `r` while app is running
3. **Clear cache** - `flutter clean` then `flutter run`
4. **Check save data** - Use Android Studio Device File Explorer

## 📈 Future Enhancements

- [ ] Multiplayer farming
- [ ] Advanced graphics & animations
- [ ] Weather system
- [ ] Trading with NPCs
- [ ] Seasonal events
- [ ] Achievements & leaderboards
- [ ] In-app purchases
- [ ] Sound effects & music

## 👨‍💻 Developer

Created by: **Fadi** 🌾
Made with Flutter 💙

## 📄 License

This project is open source and available for anyone to use and modify.

## 🤝 Contributing

Feel free to fork and submit pull requests for any improvements!

---

**Enjoy building your farm! Happy farming! 🚜🌾**
