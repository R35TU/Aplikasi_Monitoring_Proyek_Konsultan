import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../backend/repositories/project_repository.dart';

class CreateProjectPage extends StatefulWidget {
  const CreateProjectPage({super.key});

  @override
  State<CreateProjectPage> createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final TextEditingController _namaProyekController = TextEditingController();
  final TextEditingController _perusahaanController = TextEditingController();
  final TextEditingController _lokasiController = TextEditingController();
  final TextEditingController _pemilikProyekController = TextEditingController();
  final TextEditingController _sumberDanaController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();

  DateTime? _tanggalMulai;
  DateTime? _targetSelesai;

  late ProjectRepository _projectRepo;

  @override
  void initState() {
    super.initState();
    _projectRepo = ProjectRepository(Supabase.instance.client);
  }

  Future<void> _pilihTanggal(BuildContext context, bool isMulai) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isMulai) {
          _tanggalMulai = picked;
        } else {
          _targetSelesai = picked;
        }
      });
    }
  }

  Future<void> _simpanProyek() async {
    if (!_formKey.currentState!.validate()) return;
    if (_tanggalMulai == null || _targetSelesai == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pilih Tanggal Mulai dan Target Selesai')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      await _projectRepo.tambahProyek({
        'nama_proyek': _namaProyekController.text.trim(),
        'nama_perusahaan': _perusahaanController.text.trim(),
        'pemilik_proyek': _pemilikProyekController.text.trim(),
        'sumber_dana': _sumberDanaController.text.trim(),
        'deskripsi': _deskripsiController.text.trim(),
        'lokasi': _lokasiController.text.trim(),
        'tanggal_mulai': _tanggalMulai!.toIso8601String().split('T')[0],
        'target_selesai': _targetSelesai!.toIso8601String().split('T')[0],
        'progress_rencana': 0,
        'progress_aktual': 0,
        'status': 'Progres',
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Proyek berhasil ditambahkan')),
        );
        Navigator.pop(context, true); // Kembali dengan state success
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.black12,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Tambah Proyek",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField('Nama Proyek', _namaProyekController),
              const SizedBox(height: 16),
              _buildTextField('Nama Perusahaan', _perusahaanController),
              const SizedBox(height: 16),
              _buildTextField('Lokasi Proyek', _lokasiController),
              const SizedBox(height: 16),
              _buildTextField('Pemilik Proyek', _pemilikProyekController, required: false),
              const SizedBox(height: 16),
              _buildTextField('Sumber Dana', _sumberDanaController, required: false),
              const SizedBox(height: 16),
              _buildTextField('Deskripsi Proyek', _deskripsiController, required: false, maxLines: 3),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildDatePicker(
                      'Tanggal Mulai',
                      _tanggalMulai,
                      () => _pilihTanggal(context, true),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildDatePicker(
                      'Target Selesai',
                      _targetSelesai,
                      () => _pilihTanggal(context, false),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff0D24FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: _isLoading ? null : _simpanProyek,
                  child: _isLoading
                      ? const SizedBox(
                          width: 24, height: 24,
                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                        )
                      : const Text(
                          "Simpan Proyek",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool required = true, int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          validator: required ? (v) => v!.isEmpty ? 'Wajib diisi' : null : null,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDatePicker(String label, DateTime? selectedDate, VoidCallback onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedDate == null
                      ? 'Pilih'
                      : '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                  style: TextStyle(
                    color: selectedDate == null ? Colors.grey : Colors.black,
                  ),
                ),
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
