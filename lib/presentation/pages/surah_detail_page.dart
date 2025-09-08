// lib/presentation/pages/surah_detail_page.dart - Individual surah reading page
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/surah_detail/surah_detail_bloc.dart';
import '../bloc/quran_audio/quran_audio_bloc.dart';
import '../widgets/ayat_item.dart';

class SurahDetailPage extends StatefulWidget {
  final int surahNumber;
  
  const SurahDetailPage({
    super.key,
    required this.surahNumber,
  });

  @override
  State<SurahDetailPage> createState() => _SurahDetailPageState();
}

class _SurahDetailPageState extends State<SurahDetailPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<SurahDetailBloc>().add(GetSurahDetailEvent(widget.surahNumber));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SurahDetailBloc, SurahDetailState>(
        builder: (context, state) {
          if (state is SurahDetailLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (state is SurahDetailLoaded) {
            return CustomScrollView(
              controller: _scrollController,
              slivers: [
                // Header with surah info
                SliverAppBar(
                  expandedHeight: 200,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Theme.of(context).colorScheme.primary,
                            Theme.of(context).colorScheme.secondary,
                          ],
                        ),
                      ),
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.detailSurah.surah.nama,
                                style: const TextStyle(
                                  fontFamily: 'Amiri',
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                state.detailSurah.surah.namaLatin,
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${state.detailSurah.surah.arti} • ${state.detailSurah.surah.jumlahAyat} Ayat • ${state.detailSurah.surah.tempatTurun}',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    title: Text(state.detailSurah.surah.namaLatin),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        // Show surah info
                        _showSurahInfo(context, state.detailSurah.surah);
                      },
                      icon: const Icon(Icons.info_outline_rounded),
                    ),
                    BlocBuilder<QuranAudioBloc, QuranAudioState>(
                      builder: (context, audioState) {
                        if (audioState is QuranAudioPlaying) {
                          return IconButton(
                            onPressed: () {
                              context.read<QuranAudioBloc>().add(PauseAudioEvent());
                            },
                            icon: const Icon(Icons.pause_rounded),
                          );
                        } else {
                          return IconButton(
                            onPressed: () {
                              context.read<QuranAudioBloc>().add(
                                PlaySurahEvent(widget.surahNumber),
                              );
                            },
                            icon: const Icon(Icons.play_arrow_rounded),
                          );
                        }
                      },
                    ),
                  ],
                ),
                
                // Bismillah (except for At-Tawbah)
                if (widget.surahNumber != 9 && widget.surahNumber != 1)
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                        ),
                      ),
                      child: Text(
                        'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Amiri',
                          fontSize: 24,
                          height: 1.8,
                        ),
                      ),
                    ),
                  ),
                
                // Ayat list
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final ayat = state.detailSurah.ayat[index];
                      return AyatItem(
                        ayat: ayat,
                        surahNumber: widget.surahNumber,
                        onBookmarkTap: () {
                          // Handle bookmark
                        },
                        onShareTap: () {
                          // Handle share
                        },
                        onPlayTap: () {
                          // Handle play ayat audio
                        },
                      );
                    },
                    childCount: state.detailSurah.ayat.length,
                  ),
                ),
                
                // Bottom padding
                const SliverToBoxAdapter(
                  child: SizedBox(height: 100),
                ),
              ],
            );
          } else if (state is SurahDetailError) {
            return Scaffold(
              appBar: AppBar(title: const Text('Error')),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline_rounded,
                      size: 64,
                      color: Colors.red.shade400,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Terjadi kesalahan',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.message,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<SurahDetailBloc>().add(
                          GetSurahDetailEvent(widget.surahNumber),
                        );
                      },
                      child: const Text('Coba Lagi'),
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  void _showSurahInfo(BuildContext context, surah) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tentang Surah',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close_rounded),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              surah.deskripsi.replaceAll(RegExp(r'<[^>]*>'), ''),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}