import 'dart:io';
import 'package:flutter/material.dart';
import '../../backend/services/storage_service.dart';

enum UploadState { idle, picking, uploading, success, failed }

class UploadProvider extends ChangeNotifier {
  final StorageService storageService;

  UploadState _state = UploadState.idle;
  String? _uploadedUrl;
  String? _errorMessage;

  UploadProvider(this.storageService);

  UploadState get state => _state;
  String? get uploadedUrl => _uploadedUrl;
  String? get errorMessage => _errorMessage;

  void pickPhoto() {
    // PRECONDITION: State must be idle
    assert(_state == UploadState.idle, 'pickPhoto() hanya valid dari state idle, saat ini: $_state');
    _state = UploadState.picking;
    _errorMessage = null;
    notifyListeners();
  }

  Future<void> startUpload(File file, String destinationPath) async {
    // PRECONDITION: State must be picking
    assert(_state == UploadState.picking, 'startUpload() hanya valid dari state picking, saat ini: $_state');

    _state = UploadState.uploading;
    notifyListeners();

    try {
      final url = await storageService.uploadPhoto(file, destinationPath);
      _uploadedUrl = url;
      _state = UploadState.success;
      notifyListeners();
    } catch (e) {
      _state = UploadState.failed;
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  void reset() {
    // PRECONDITION: State must be success or failed
    assert(_state == UploadState.success || _state == UploadState.failed,
        'reset() hanya valid dari state success atau failed, saat ini: $_state');
    _state = UploadState.idle;
    _uploadedUrl = null;
    _errorMessage = null;
    notifyListeners();
  }
}
