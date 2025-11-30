// ignore_for_file: file_names

import 'package:flutter/material.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  // Mock wishlist data
  List<Map<String, dynamic>> wishlist = [
    {
      "title": "تنظيف المنزل",
      "desc": "خدمة تنظيف شاملة لجميع الغرف.",
      "icon": Icons.cleaning_services_outlined,
    },
    {
      "title": "سباكة",
      "desc": "إصلاح الأعطال وتسليك المواسير.",
      "icon": Icons.plumbing_outlined,
    },
    {
      "title": "دهان",
      "desc": "دهان المنزل بالكامل مع خامات ممتازة.",
      "icon": Icons.format_paint_outlined,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF3B5998),
          title: const Text("قائمة المفضلة"),
          centerTitle: true,
        ),

        body: wishlist.isEmpty
            ? const Center(
                child: Text(
                  "لا توجد خدمات مفضلة حالياً",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
            : ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: wishlist.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final item = wishlist[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: CircleAvatar(
                        radius: 26,
                        backgroundColor: const Color(0xFFEAF2FF),
                        child: Icon(
                          item["icon"],
                          color: const Color(0xFF3B5998),
                          size: 28,
                        ),
                      ),
                      title: Text(
                        item["title"],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3B5998),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          item["desc"],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),

                      // Remove from wishlist
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            wishlist.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
