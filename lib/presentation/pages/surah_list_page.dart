// lib/presentation/pages/surah_list_page.dart - Main Quran reading page with surah list
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/surah_list/surah_list_bloc.dart';
import '../widgets/surah_list_item.dart';

class SurahListPage extends StatefulWidget {
  const SurahListPage({super.key});

  @override
  State<SurahListPage> createState() => _SurahListPageState();
}

class _SurahListPageState extends State<SurahListPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    context.read<SurahListBloc>().add(GetAllSurahEvent());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Al-Quran'),
        actions: [
          IconButton(
            onPressed: () {
              // Toggle view mode
            },
            icon: const Icon(Icons.view_list_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Container(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Cari surah...',
                prefixIcon: const Icon(Icons.search_rounded),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          _searchController.clear();
                          setState(() {
                            _searchQuery = '';
                          });
                        },
                        icon: const Icon(Icons.clear_rounded),
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
            ),
          ),

          // Surah list
          Expanded(
            child: BlocBuilder<SurahListBloc, SurahListState>(
              builder: (context, state) {
                if (state is SurahListLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SurahListLoaded) {
                  final filteredSurahs = state.surahList.where((surah) {
                    if (_searchQuery.isEmpty) return true;
                    return surah.namaLatin.toLowerCase().contains(_searchQuery) ||
                           surah.arti.toLowerCase().contains(_searchQuery) ||
                           surah.nomor.toString().contains(_searchQuery);
                  }).toList();

                  if (filteredSurahs.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off_rounded,
                            size: 64,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Surah tidak ditemukan',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              context.read<SurahListBloc>().add(GetAllSurahEvent());
                            },
                            child: const Text('Coba Lagi'),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: filteredSurahs.length,
                    itemBuilder: (context, index) {
                      return SurahListItem(surah: filteredSurahs[index]);
                    },
                  );
                } else if (state is SurahListError) {
                  return Center(
                    child: Text(state.message),
                  );
                }

                return const Center(child: Text('Terjadi kesalahan.'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
