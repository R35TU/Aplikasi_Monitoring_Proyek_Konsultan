/// Class pembungkus untuk membedakan hasil database yang Sukses dan Gagal
class DbResult<T> {
  final T? data;
  final String? errorMessage;
  final bool isSuccess;

  // Constructor jika sukses
  DbResult.success(this.data) : isSuccess = true, errorMessage = null;

  // Constructor jika gagal/error
  DbResult.error(this.errorMessage) : isSuccess = false, data = null;
}
