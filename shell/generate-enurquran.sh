#!/bin/bash

PROJECT_NAME="e_nur_quran"

echo "🚀 Membuat project Flutter $PROJECT_NAME..."

# 1. Buat project Flutter standar
flutter create $PROJECT_NAME

# 2. Hapus folder lib bawaan
rm -rf $PROJECT_NAME/lib

# 3. Buat ulang lib sesuai struktur clean architecture
BASE_DIR="$PROJECT_NAME/lib"

mkdir -p $BASE_DIR/data/datasources
mkdir -p $BASE_DIR/data/models
mkdir -p $BASE_DIR/data/repositories

mkdir -p $BASE_DIR/domain/entities
mkdir -p $BASE_DIR/domain/repositories
mkdir -p $BASE_DIR/domain/usecases

mkdir -p $BASE_DIR/presentation/bloc/surah_list
mkdir -p $BASE_DIR/presentation/bloc/surah_detail
mkdir -p $BASE_DIR/presentation/pages
mkdir -p $BASE_DIR/presentation/widgets

mkdir -p $BASE_DIR/core/utils
mkdir -p $BASE_DIR/core/error
mkdir -p $BASE_DIR/core/usecase

# 4. Buat file kosong sesuai struktur

touch $BASE_DIR/data/datasources/remote_data_source.dart
touch $BASE_DIR/data/datasources/local_data_source.dart
touch $BASE_DIR/data/models/surah_model.dart
touch $BASE_DIR/data/models/detail_surah_model.dart
touch $BASE_DIR/data/models/tafsir_model.dart
touch $BASE_DIR/data/repositories/quran_repository_impl.dart

touch $BASE_DIR/domain/entities/surah.dart
touch $BASE_DIR/domain/entities/detail_surah.dart
touch $BASE_DIR/domain/entities/tafsir.dart
touch $BASE_DIR/domain/repositories/quran_repository.dart
touch $BASE_DIR/domain/usecases/get_all_surah.dart
touch $BASE_DIR/domain/usecases/get_detail_surah.dart
touch $BASE_DIR/domain/usecases/get_tafsir_surah.dart

touch $BASE_DIR/presentation/bloc/surah_list/surah_list_bloc.dart
touch $BASE_DIR/presentation/bloc/surah_list/surah_list_event.dart
touch $BASE_DIR/presentation/bloc/surah_list/surah_list_state.dart

touch $BASE_DIR/presentation/bloc/surah_detail/surah_detail_bloc.dart
touch $BASE_DIR/presentation/bloc/surah_detail/surah_detail_event.dart
touch $BASE_DIR/presentation/bloc/surah_detail/surah_detail_state.dart

touch $BASE_DIR/presentation/pages/home_page.dart
touch $BASE_DIR/presentation/pages/detail_surah_page.dart

touch $BASE_DIR/presentation/widgets/surah_list_item.dart
touch $BASE_DIR/presentation/widgets/ayat_list_item.dart

touch $BASE_DIR/core/utils/constants.dart
touch $BASE_DIR/core/error/failure.dart
touch $BASE_DIR/core/error/exception.dart
touch $BASE_DIR/core/usecase/usecase.dart

# 5. Buat main.dart contoh

cat <<EOL > $BASE_DIR/main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Nur Quran',
      home: Scaffold(
        appBar: AppBar(title: const Text('E-Nur Quran')),
        body: const Center(child: Text('Hello E-Nur Quran')),
      ),
    );
  }
}
EOL

echo "✅ Project Flutter '$PROJECT_NAME' selesai dibuat dengan struktur clean architecture di folder $PROJECT_NAME"
echo "➡️ Jalankan: cd $PROJECT_NAME && flutter run"
