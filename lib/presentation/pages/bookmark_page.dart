// lib/presentation/pages/bookmark_page.dart - Bookmarks management page
import 'package:flutter/material.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmark'),
        actions: [
          IconButton(
            onPressed: () {
              // Show bookmark management options
            },
            icon: const Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bookmark_outline_rounded,
              size: 64,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            Text(
              'Belum ada bookmark',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Tandai ayat favoritmu untuk akses cepat',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}