// lib/presentation/pages/prayer_time_page.dart - Prayer times page
import 'package:flutter/material.dart';

class PrayerTimePage extends StatelessWidget {
  const PrayerTimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal Shalat'),
        actions: [
          IconButton(
            onPressed: () {
              // Show location settings
            },
            icon: const Icon(Icons.location_on_rounded),
          ),
        ],
      ),
      body: const Center(
        child: Text('Prayer Times Feature Coming Soon'),
      ),
    );
  }
}
