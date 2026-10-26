import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/custom_text.dart';

// ─── Konstanta warna ────────────────────────────────────────────────────────
const Color _kPrimary = Color(0xFFFF6B35);
const Color _kPrimaryLight = Color(0xFFFF9F45);

class AddMenuPage extends StatefulWidget {
  const AddMenuPage({super.key});

  @override
  State<AddMenuPage> createState() => _AddMenuPageState();
}

class _AddMenuPageState extends State<AddMenuPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _hargaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ── Gambar 2: Scaffold → AppBar(Text) | Padding(Form(Column(
    //    TextFormField, SizedBox, TextFormField, SizedBox,
    //    ElevatedButton(Text)))) ─────────────────────────────────────────────
    return Scaffold(
      // ── AppBar → Text (CustomText) ───────────────────────────────────────
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 64,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [_kPrimary, _kPrimaryLight],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: CustomText(
          'Tambah Menu',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      // ── body: Padding ─────────────────────────────────────────────────────
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 28, 20, 20),
        // ── Padding → Form ────────────────────────────────────────────────
        child: Form(
          key: _formKey,
          // ── Form → Column ─────────────────────────────────────────────
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ── Column anak-1: TextFormField (nama) ─────────────────────
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Makanan',
                  hintText: 'Contoh: Nasi Goreng',
                  prefixIcon: Icon(Icons.fastfood_rounded),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama makanan tidak boleh kosong';
                  }
                  return null;
                },
              ),
              // ── Column anak-2: SizedBox ──────────────────────────────────
              const SizedBox(height: 16),
              // ── Column anak-3: TextFormField (harga) ────────────────────
              TextFormField(
                controller: _hargaController,
                decoration: const InputDecoration(
                  labelText: 'Harga (Rp)',
                  hintText: 'Contoh: 15000',
                  prefixIcon: Icon(Icons.payments_rounded),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Harga tidak boleh kosong';
                  }
                  if (int.tryParse(value.trim()) == null) {
                    return 'Harga harus berupa angka';
                  }
                  return null;
                },
              ),
              // ── Column anak-4: SizedBox ──────────────────────────────────
              const SizedBox(height: 28),
              // ── Column anak-5: ElevatedButton → Text (CustomText) ────────
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Data valid: kirim kembali ke halaman daftar
                    final Map<String, String> newMenu = {
                      'nama': _namaController.text.trim(),
                      'harga': 'Rp ${_hargaController.text.trim()}',
                    };
                    Get.back(result: newMenu);
                  }
                  // Jika tidak valid, validator menampilkan pesan error
                  // dan data tidak dikirim
                },
                child: CustomText(
                  'Simpan Menu',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
