import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/custom_text.dart';

// ─── Konstanta warna ────────────────────────────────────────────────────────
const Color _kPrimary = Color(0xFFFF6B35);
const Color _kPrimaryLight = Color(0xFFFF9F45);

// Halaman detail menu — struktur bebas sesuai soal.
// Menampilkan nama dan harga menu yang dipilih dari halaman daftar.
class MenuDetailPage extends StatelessWidget {
  final Map<String, String> menu;

  const MenuDetailPage({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F3F0),
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
          'Detail Menu',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Kartu utama yang menampilkan info menu
            Card(
              elevation: 6,
              // 0x38 = ~22% opacity dari #FF6B35
              shadowColor: const Color(0x38FF6B35),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Column(
                  children: [
                    // Ikon bergradient dalam lingkaran
                    Container(
                      width: 88,
                      height: 88,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [_kPrimary, _kPrimaryLight],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        shape: BoxShape.circle,
                        // 0x59 = ~35% opacity dari #FF6B35
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x59FF6B35),
                            blurRadius: 18,
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.restaurant,
                        color: Colors.white,
                        size: 42,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Badge "Tersedia"
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        // 0x1F = ~12% opacity dari #4CAF50
                        color: const Color(0x1F4CAF50),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          // 0x664CAF50 = ~40% opacity
                          color: const Color(0x664CAF50),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Color(0xFF4CAF50),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          CustomText(
                            'Tersedia',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF2E7D32),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    // Nama makanan
                    CustomText(
                      menu['nama']!,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A1A1A),
                    ),
                    const SizedBox(height: 4),
                    CustomText(
                      'Menu Kantin Sekolah',
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xFF9E9E9E),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      child: Divider(color: Colors.grey.shade200),
                    ),
                    // Baris harga
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          'Harga',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF757575),
                        ),
                        CustomText(
                          menu['harga']!,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: _kPrimary,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
