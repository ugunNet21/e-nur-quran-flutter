// lib/presentation/widgets/prayer_time_card.dart - Prayer times display card
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/prayer_time/prayer_time_bloc.dart';

class PrayerTimeCard extends StatelessWidget {
  const PrayerTimeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Jadwal Shalat Hari Ini',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.location_on_rounded,
                  color: Theme.of(context).colorScheme.primary,
                  size: 20,
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Bandung, Jawa Barat',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 16),
            BlocBuilder<PrayerTimeBloc, PrayerTimeState>(
              builder: (context, state) {
                if (state is PrayerTimeLoaded) {
                  return _buildPrayerTimeGrid(context, state);
                } else if (state is PrayerTimeLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return _buildDefaultPrayerTimes(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrayerTimeGrid(BuildContext context, PrayerTimeLoaded state) {
    final prayers = [
      {'name': 'Subuh', 'time': '04:30'},
      {'name': 'Dzuhur', 'time': '12:15'},
      {'name': 'Ashar', 'time': '15:30'},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: prayers.map((prayer) => _buildPrayerTimeItem(
        context,
        prayer['name']!,
        prayer['time']!,
      )).toList(),
    );
  }

  Widget _buildDefaultPrayerTimes(BuildContext context) {
    final prayers = [
      {'name': 'Subuh', 'time': '04:30'},
      {'name': 'Dzuhur', 'time': '12:15'},
      {'name': 'Ashar', 'time': '15:30'},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: prayers.map((prayer) => _buildPrayerTimeItem(
        context,
        prayer['name']!,
        prayer['time']!,
      )).toList(),
    );
  }

  Widget _buildPrayerTimeItem(BuildContext context, String name, String time) {
    return Column(
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          time,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}