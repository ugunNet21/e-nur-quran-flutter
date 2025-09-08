// lib/presentation/widgets/ayat_item.dart - Individual ayat display widget
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../domain/entities/ayat.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/constants.dart';

class AyatItem extends StatelessWidget {
  final Ayat ayat;
  final int surahNumber;
  final VoidCallback? onBookmarkTap;
  final VoidCallback? onShareTap;
  final VoidCallback? onPlayTap;

  const AyatItem({
    super.key,
    required this.ayat,
    required this.surahNumber,
    this.onBookmarkTap,
    this.onShareTap,
    this.onPlayTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Ayat header with number and actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      ayat.nomorAyat.toArabicNumber(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: onPlayTap,
                      icon: Icon(
                        Icons.play_circle_outline_rounded,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      constraints: const BoxConstraints(),
                      padding: const EdgeInsets.all(8),
                    ),
                    IconButton(
                      onPressed: () => _shareAyat(context),
                      icon: Icon(
                        Icons.share_rounded,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      constraints: const BoxConstraints(),
                      padding: const EdgeInsets.all(8),
                    ),
                    IconButton(
                      onPressed: onBookmarkTap,
                      icon: Icon(
                        Icons.bookmark_outline_rounded,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      constraints: const BoxConstraints(),
                      padding: const EdgeInsets.all(8),
                    ),
                    IconButton(
                      onPressed: () => _copyAyat(context),
                      icon: Icon(
                        Icons.copy_rounded,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      constraints: const BoxConstraints(),
                      padding: const EdgeInsets.all(8),
                    ),
                  ],
                ),
              ],
            ),
            
            const SizedBox(height: 20),
            
            // Arabic text
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                ),
              ),
              child: SelectableText(
                ayat.teksArab,
                style: AppTheme.arabicTextStyle.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Latin transliteration
            SelectableText(
              ayat.teksLatin,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontStyle: FontStyle.italic,
                color: Theme.of(context).colorScheme.primary,
                height: 1.5,
              ),
            ),
            
            const SizedBox(height: 12),
            
            // Indonesian translation
            SelectableText(
              ayat.teksIndonesia,
              style: AppTheme.translationTextStyle.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _copyAyat(BuildContext context) {
    final text = '''${ayat.teksArab}

${ayat.teksLatin}

${ayat.teksIndonesia}

QS. $surahNumber:${ayat.nomorAyat}''';
    
    Clipboard.setData(ClipboardData(text: text));
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Ayat telah disalin'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _shareAyat(BuildContext context) {
    // In a real app, you would use share_plus plugin
    _copyAyat(context);
  }
}
