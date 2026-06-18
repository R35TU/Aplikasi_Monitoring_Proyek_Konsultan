import '../models/project_document_model.dart';

// 3. Observer Pattern (Behavioral)
// Memungkinkan objek (Observer) untuk berlangganan dan mendapatkan notifikasi
// dari objek lain (Subject) saat terjadi perubahan state (misal: dokumen baru diunggah).

// Interface untuk Observer
abstract class DocumentObserver {
  void onDocumentUploaded(ProjectDocumentModel document);
}

// Subject yang akan diamati
class DocumentServiceSubject {
  final List<DocumentObserver> _observers = [];
  final List<ProjectDocumentModel> _documents = [];

  // Menambahkan observer (langganan)
  void attach(DocumentObserver observer) {
    if (!_observers.contains(observer)) {
      _observers.add(observer);
    }
  }

  // Menghapus observer (berhenti langganan)
  void detach(DocumentObserver observer) {
    _observers.remove(observer);
  }

  // Memberitahu semua observer tentang perubahan
  void notifyObservers(ProjectDocumentModel document) {
    for (var observer in _observers) {
      observer.onDocumentUploaded(document);
    }
  }

  // Aksi yang memicu notifikasi
  void uploadDocument(ProjectDocumentModel document) {
    // Logika upload dokumen ...
    _documents.add(document);
    
    // Setelah berhasil, beri tahu semua observer
    notifyObservers(document);
  }
}
