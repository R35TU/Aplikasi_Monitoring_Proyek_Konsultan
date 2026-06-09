class UserModel {
  final String id;
  final String name;
  final String email;
  final String role;
  final int? perusahaanId;
  final String? username;
  final String? nomorHp;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.perusahaanId,
    this.username,
    this.nomorHp,
  });

  factory UserModel.fromJson(Map<String, dynamic> json, String email) {
    return UserModel(
      id: json['firebase_uid'] ?? '',
      name: json['nama'] ?? '',
      email: email, // Auth email
      role: json['peran'] ?? 'client',
      perusahaanId: json['perusahaan_id'],
      username: json['username'],
      nomorHp: json['nomor_hp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firebase_uid': id,
      'nama': name,
      'peran': role,
      'perusahaan_id': perusahaanId,
      'username': username,
      'nomor_hp': nomorHp,
    };
  }
}
