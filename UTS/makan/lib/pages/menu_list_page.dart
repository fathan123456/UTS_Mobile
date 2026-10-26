import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/custom_text.dart';
import 'add_menu_page.dart';
import 'menu_detail_page.dart';

// ─── Konstanta warna ────────────────────────────────────────────────────────
const Color _kPrimary = Color(0xFFFF6B35);
const Color _kPrimaryLight = Color(0xFFFF9F45);
const Color _kDark = Color(0xFF2D2D2D);

class MenuListPage extends StatefulWidget {
  const MenuListPage({super.key});

  @override
  State<MenuListPage> createState() => _MenuListPageState();
}

class _MenuListPageState extends State<MenuListPage> {
  // ── Data menu disimpan dalam List biasa di dalam State ──────────────────
  final List<Map<String, String>> _menuList = [
    {'nama': 'Nasi Goreng Spesial', 'harga': 'Rp 15.000'},
    {'nama': 'Mie Ayam Bakso', 'harga': 'Rp 12.000'},
    {'nama': 'Ayam Geprek Sambal Bawang', 'harga': 'Rp 18.000'},
    {'nama': 'Soto Lamongan', 'harga': 'Rp 14.000'},
    {'nama': 'Gado-Gado Betawi', 'harga': 'Rp 11.000'},
  ];

  @override
  Widget build(BuildContext context) {
    // ── Gambar 1: Scaffold → AppBar(Text) | Column(Padding(Text),
    //    Expanded(ListView.builder(Card(ListTile(...))))) | FAB(Icon) ────────
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
        title: CustomText(
          'Menu Kantin',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      // ── body: Column ─────────────────────────────────────────────────────
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Column anak-1: Padding → Text (CustomText) ──────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
            child: CustomText(
              'Pilih Menu Favoritmu',
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: _kDark,
            ),
          ),
          // ── Column anak-2: Expanded → ListView.builder ──────────────────
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 90),
              itemCount: _menuList.length,
              itemBuilder: (context, index) {
                final menu = _menuList[index];
                // ── ListView item: Card → ListTile ───────────────────────
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    // leading: Icon
                    leading: const Icon(
                      Icons.restaurant_menu,
                      color: _kPrimary,
                      size: 34,
                    ),
                    // title: Text (CustomText)
                    title: CustomText(
                      menu['nama']!,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1A1A1A),
                    ),
                    // subtitle: Text (CustomText)
                    subtitle: CustomText(
                      menu['harga']!,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: _kPrimary,
                    ),
                    // trailing: Icon
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: Color(0xFFBDBDBD),
                    ),
                    onTap: () {
                      // Navigasi ke halaman detail dengan Get.to()
                      Get.to(() => MenuDetailPage(menu: menu));
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // ── FloatingActionButton → Icon ──────────────────────────────────────
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Buka halaman tambah menu menggunakan Get.to()
          final result = await Get.to(() => const AddMenuPage());
          // Terima data kembali, tambahkan ke List, perbarui dengan setState()
          if (result != null && result is Map<String, String>) {
            setState(() {
              _menuList.add(result);
            });
          }
        },
        child: const Icon(Icons.add, size: 28),
      ),
    );
  }
}
