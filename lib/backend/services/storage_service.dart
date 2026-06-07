import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class StorageService {
  Future<String> uploadPhoto(File file, String destinationPath) async {
    // Defensive checking
    assert(await file.exists(), 'File tidak ditemukan di path asal');
    final length = await file.length();
    assert(length < 5 * 1024 * 1024, 'Ukuran file melebihi batas 5MB');

    try {
      final appDir = await getApplicationDocumentsDirectory();
      final targetFolder = Directory(p.join(appDir.path, 'uploads'));
      if (!await targetFolder.exists()) {
        await targetFolder.create(recursive: true);
      }

      final fileName = p.basename(file.path);
      final newFile = await file.copy(p.join(targetFolder.path, fileName));
      return newFile.path;
    } catch (e) {
      throw Exception('Gagal menyimpan file secara lokal: $e');
    }
  }

  Future<void> deletePhoto(String url) async {
    try {
      final file = File(url);
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      // Defensively log error without crashing
      print('Gagal menghapus file: $e');
    }
  }

  Future<String> getPhotoUrl(String path) async {
    return path;
  }
}
