import 'package:get/get.dart';

class MeditationController extends GetxController {
  // Playlist data
  final List<Map<String, String>> playlist = [
    {
      'title': 'Midnight Wind',
      'artist': 'Snoop Dogg',
      'duration': '04:34',
      'plays': '1,234',
      'image': 'assets/images/643edddf95fd388b62a1ee62af69ab9d70b1b62d.jpg',
    },
    {
      'title': 'Drop It Like It\'s...',
      'artist': 'Snoop Dogg',
      'duration': '04:34',
      'plays': '1,234',
      'image': 'assets/images/b429224468f62a30ea4f74a1b1f5c7b4d2b2a3f8.jpg',
    },
    {
      'title': 'Night Rainfall',
      'artist': 'Snoop Dogg',
      'duration': '04:34',
      'plays': '1,234',
      'image': 'assets/images/643edddf95fd388b62a1ee62af69ab9d70b1b62d.jpg',
    },
    {
      'title': 'Dream State',
      'artist': 'Snoop Dogg',
      'duration': '05:20',
      'plays': '980',
      'image': 'assets/images/b429224468f62a30ea4f74a1b1f5c7b4d2b2a3f8.jpg',
    },{
      'title': 'Midnight Wind',
      'artist': 'Snoop Dogg',
      'duration': '04:34',
      'plays': '1,234',
      'image': 'assets/images/643edddf95fd388b62a1ee62af69ab9d70b1b62d.jpg',
    },
    {
      'title': 'Drop It Like It\'s...',
      'artist': 'Snoop Dogg',
      'duration': '04:34',
      'plays': '1,234',
      'image': 'assets/images/image 1081.png',
    },
    {
      'title': 'Night Rainfall',
      'artist': 'Snoop Dogg',
      'duration': '04:34',
      'plays': '1,234',
      'image': 'assets/images/643edddf95fd388b62a1ee62af69ab9d70b1b62d.jpg',
    },
    {
      'title': 'Dream State',
      'artist': 'Snoop Dogg',
      'duration': '05:20',
      'plays': '980',
      'image': 'assets/images/b429224468f62a30ea4f74a1b1f5c7b4d2b2a3f8.jpg',
    },{
      'title': 'Midnight Wind',
      'artist': 'Snoop Dogg',
      'duration': '04:34',
      'plays': '1,234',
      'image': 'assets/images/643edddf95fd388b62a1ee62af69ab9d70b1b62d.jpg',
    },
    {
      'title': 'Drop It Like It\'s...',
      'artist': 'Snoop Dogg',
      'duration': '04:34',
      'plays': '1,234',
      'image': 'assets/images/image 1081.png',
    },
    {
      'title': 'Night Rainfall',
      'artist': 'Snoop Dogg',
      'duration': '04:34',
      'plays': '1,234',
      'image': 'assets/images/643edddf95fd388b62a1ee62af69ab9d70b1b62d.jpg',
    },
    {
      'title': 'Dream State',
      'artist': 'Snoop Dogg',
      'duration': '05:20',
      'plays': '980',
      'image': 'assets/images/b429224468f62a30ea4f74a1b1f5c7b4d2b2a3f8.jpg',
    },
  ].obs;

  // Selected song index
  final RxInt selectedIndex = 0.obs;

  // Get current song
  Map<String, String> get currentSong => playlist[selectedIndex.value];

  // Method to select a song
  void selectSong(int index) {
    selectedIndex.value = index;
    // Future: Initialize audio playback here
  }

  // Next song
  void nextSong() {
    if (selectedIndex.value < playlist.length - 1) {
      selectedIndex.value++;
    } else {
      selectedIndex.value = 0; // Loop to start
    }
  }

  // Previous song
  void previousSong() {
    if (selectedIndex.value > 0) {
      selectedIndex.value--;
    } else {
      selectedIndex.value = playlist.length - 1; // Loop to end
    }
  }
}
