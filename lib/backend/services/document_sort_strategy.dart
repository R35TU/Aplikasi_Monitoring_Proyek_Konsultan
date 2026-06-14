import '../models/project_document_model.dart';

// 4. Strategy Pattern (Behavioral)
// Memungkinkan pemilihan algoritma pengurutan (sorting) saat program berjalan (runtime).

// Interface untuk Strategi Pengurutan
abstract class DocumentSortStrategy {
  void sort(List<ProjectDocumentModel> documents);
}

// Strategi: Urutkan berdasarkan Nama File A-Z
class SortByNameAscending implements DocumentSortStrategy {
  @override
  void sort(List<ProjectDocumentModel> documents) {
    documents.sort((a, b) => a.namaFile.compareTo(b.namaFile));
  }
}

// Strategi: Urutkan berdasarkan Nama File Z-A
class SortByNameDescending implements DocumentSortStrategy {
  @override
  void sort(List<ProjectDocumentModel> documents) {
    documents.sort((a, b) => b.namaFile.compareTo(a.namaFile));
  }
}

// Strategi: Urutkan berdasarkan Tanggal Unggah Terbaru
class SortByDateDescending implements DocumentSortStrategy {
  @override
  void sort(List<ProjectDocumentModel> documents) {
    // Asumsi tanggalUnggah bisa di-parse menjadi DateTime atau String yyyy-mm-dd
    documents.sort((a, b) => b.tanggalUnggah.compareTo(a.tanggalUnggah));
  }
}

// Context class yang menggunakan strategi
class DocumentListSorter {
  DocumentSortStrategy _strategy;

  DocumentListSorter(this._strategy);

  // Mengubah strategi saat runtime
  void setStrategy(DocumentSortStrategy strategy) {
    _strategy = strategy;
  }

  // Menjalankan algoritma pengurutan sesuai strategi yang dipilih
  void sortDocuments(List<ProjectDocumentModel> documents) {
    _strategy.sort(documents);
  }
}
