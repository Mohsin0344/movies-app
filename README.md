# 🎬 Movie Booking App

A sleek, modern, and feature-packed **Flutter Movie Ticket Booking App** that allows users to explore upcoming movies, view detailed info, watch trailers, and select cinema seats interactively.
##  Detail Demo of Flutter App: https://drive.google.com/file/d/1mMyYlUPm3_UlzgZzm5k1SpAxu-GKxJze/view?usp=drivesdk
---

## ✨ Features

- 🔍 **Browse Upcoming Movies**
    - Paginated lists using TMDB API.
    - View detailed information about each movie.

- 📽️ **Watch Trailers**
    - YouTube trailer playback inside a fullscreen player.
    - Auto-close after trailer ends.

- 🪑 **Seat Selection**
    - Interactive seat layout using `InteractiveViewer`.
    - Zoom, pan, and select seats with color-coded pricing.
    - VIP and Regular pricing logic.

- 🔄 **Layout Switching**
    - Toggle between list and grid movie views.

- 📆 **Date Picker**
    - Horizontal scrollable calendar from today to 30 days ahead.

- 🔎 **Search**
    - Animated AppBar that morphs into a search text field.

---

## 📁 Folder Structure

Your project uses a clean and scalable architecture:

```
lib/
├── api/                  # API configs, routes, methods, and client
│   ├── api_client.dart
│   ├── api_config.dart
│   ├── api_methods.dart
│   └── api_routes.dart
│
├── bloc_providers/       # BlocProvider wrappers
│   └── bloc_providers.dart
│
├── cubits/               # BLoC/Cubit state management
│   ├── movies/
│   │   ├── app_states.dart
│   │   ├── cubit_exception_handler.dart
│   │   └── test_view_model.dart
│
├── models/               # API models
│   ├── movies/
│   ├── reservations/
│   └── test_model.dart
│
├── routes/               # Route config and navigation helpers
│
├── utils/                # App constants and utility functions
│   ├── app_assets.dart
│   ├── app_colors.dart
│   ├── app_extensions.dart
│   ├── app_fonts.dart
│   ├── app_strings.dart
│   ├── debounce.dart
│   └── route_names.dart
│
├── views/                # UI screens
│   ├── movies/
│   └── reservations/
```

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>= 3.0.0)
- TMDB API Key
- Dart enabled environment

### 🔧 Setup

1. Clone the repo:
   ```bash
   git clone https://github.com/mohsin0344/movie_booking_app.git
   cd movie_booking_app
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Create a `.env` file:
   ```env
   TMDB_API_KEY=your_tmdb_api_key
   ```

4. Run the app:
   ```bash
   flutter run
   ```

---

## 🧩 Tech Stack

- **Flutter + Dart**
- **BLoC / Cubit** for state management
- **TMDB API** for movie data
- `flutter_dotenv` for secure API keys
- `youtube_player_flutter` for trailer playback
- `infinite_scroll_pagination` for lazy loading
- `cached_network_image` for optimized image rendering

---

## 📃 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## 👤 Author

**Mohsin**  
*Flutter Developer*