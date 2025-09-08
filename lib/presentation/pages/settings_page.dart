// lib/presentation/pages/settings_page.dart
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
      ),
      body: ListView(
        children: [
          _buildSettingsSection(
            context,
            'Tampilan',
            [
              _buildSettingsTile(
                context,
                Icons.dark_mode_rounded,
                'Mode Gelap',
                'Aktifkan tema gelap',
                trailing: Switch(
                  value: false,
                  onChanged: (value) {
                    // TODO: Handle dark mode toggle
                  },
                ),
              ),
              _buildSettingsTile(
                context,
                Icons.text_fields_rounded,
                'Ukuran Font',
                'Atur ukuran teks Arab dan terjemahan',
                onTap: () {
                  // TODO: Show font size settings
                },
              ),
            ],
          ),
          _buildSettingsSection(
            context,
            'Audio',
            [
              _buildSettingsTile(
                context,
                Icons.record_voice_over_rounded,
                'Qari Pilihan',
                'Abdullah Al-Juhany',
                onTap: () {
                  // TODO: Show qari selection
                },
              ),
              _buildSettingsTile(
                context,
                Icons.download_rounded,
                'Download Otomatis',
                'Download audio saat membaca',
                trailing: Switch(
                  value: true,
                  onChanged: (value) {
                    // TODO: Handle auto download toggle
                  },
                ),
              ),
            ],
          ),
          _buildSettingsSection(
            context,
            'Lainnya',
            [
              _buildSettingsTile(
                context,
                Icons.info_outline_rounded,
                'Tentang Aplikasi',
                'Versi 1.0.0',
                onTap: () {
                  // TODO: Show about dialog
                },
              ),
              _buildSettingsTile(
                context,
                Icons.feedback_rounded,
                'Kirim Masukan',
                'Bantu kami tingkatkan aplikasi',
                onTap: () {
                  // TODO: Handle feedback
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(
    BuildContext context,
    String title,
    List<Widget> children,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
        ...children,
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildSettingsTile(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle, {
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: trailing ?? const Icon(Icons.chevron_right_rounded),
      onTap: onTap,
    );
  }
}
