// lib/presentation/widgets/quick_access_card.dart - Quick access menu grid
import 'package:flutter/material.dart';

class QuickAccessCard extends StatelessWidget {
  const QuickAccessCard({super.key});

  @override
  Widget build(BuildContext context) {
    final quickMenus = [
      {
        'icon': Icons.bookmark_rounded,
        'title': 'Bookmark',
        'color': Colors.orange,
      },
      {
        'icon': Icons.search_rounded,
        'title': 'Pencarian',
        'color': Colors.blue,
      },
      {
        'icon': Icons.volume_up_rounded,
        'title': 'Audio',
        'color': Colors.green,
      },
      {
        'icon': Icons.text_fields_rounded,
        'title': 'Tafsir',
        'color': Colors.purple,
      },
    ];

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: quickMenus.map((menu) => _buildQuickMenuItem(
        context,
        menu['icon'] as IconData,
        menu['title'] as String,
        menu['color'] as Color,
      )).toList(),
    );
  }

  Widget _buildQuickMenuItem(
    BuildContext context,
    IconData icon,
    String title,
    Color color,
  ) {
    return GestureDetector(
      onTap: () {
        // Handle quick menu tap
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: color,
                size: 20,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}