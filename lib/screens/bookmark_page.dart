import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../bookmark_manager.dart';
import '../l10n/locale_provider.dart';
import '../l10n/string_info.dart';
import '../screens/flag_toggle.dart';

const Color _navy = Color(0xFF073793);
const Color _teal = Color(0xFF0D6A75);
const Color _gold = Color(0xFFC9A84C);
const Color _soft = Color(0xFFDCE6F5);

class BookmarkPage extends StatefulWidget {
  final Function(String) onItemTap;
  final double bottomOffset;

  const BookmarkPage({
    super.key,
    required this.onItemTap,
    this.bottomOffset = 80,
  });

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {

  @override
  void initState() {
    super.initState();
    _loadBookmarks();
  }

  Future<void> _loadBookmarks() async {
    await BookmarkManager.loadFromDatabase();
    if (mounted) setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final double s = (sw / 393).clamp(0.82, 1.18);
    final str = SInfo(context.watch<LocaleProvider>().isEn);
    final savedItems = BookmarkManager.bookmarkedItems;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        Positioned.fill(child: Image.asset(
            'assets/images/background_4.jpg', fit: BoxFit.cover)),
        Positioned.fill(
            child: Container(color: _navy.withValues(alpha: 0.06))),
        SafeArea(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.fromLTRB(s * 20, s * 25, s * 20, s * 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 48),
                  Expanded(
                    child: Column(children: [
                      Text(str.bookmarkTitle,
                        style: TextStyle(fontSize: s * 26,
                          fontWeight: FontWeight.bold, color: _navy)),
                      SizedBox(height: s * 6),
                      Container(height: 3, width: s * 50,
                        decoration: BoxDecoration(
                          color: _gold,
                          borderRadius: BorderRadius.circular(4))),
                      SizedBox(height: s * 8),
                      if (savedItems.isNotEmpty)
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: s * 14, vertical: s * 5),
                          decoration: BoxDecoration(
                            color: _soft,
                            borderRadius: BorderRadius.circular(20)),
                          child: Text(str.bookmarkCount(savedItems.length),
                            style: TextStyle(fontSize: s * 12,
                              color: _navy, fontWeight: FontWeight.bold))),
                    ]),
                  ),
                  const FlagToggleButton(),
                ],
              )),
            Expanded(
              child: savedItems.isEmpty
                  ? _buildEmptyState(str, s)
                  : ListView.builder(
                      padding: EdgeInsets.fromLTRB(
                        s * 18, s * 10, s * 18, widget.bottomOffset),
                      physics: const BouncingScrollPhysics(),
                      itemCount: savedItems.length,
                      itemBuilder: (context, index) =>
                          _buildBookmarkItem(savedItems[index], str, s))),
          ])),
      ]));
  }

  Widget _buildEmptyState(SInfo str, double s) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(s * 24),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.8),
              shape: BoxShape.circle),
            child: Icon(Icons.bookmark_border_rounded,
                size: s * 52, color: _navy)),
          SizedBox(height: s * 16),
          Text(str.bookmarkEmpty,
            style: TextStyle(fontSize: s * 16,
              fontWeight: FontWeight.w600, color: _navy)),
          SizedBox(height: s * 6),
          Text(str.bookmarkHint,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: s * 13,
              color: Colors.black.withValues(alpha: 0.45), height: 1.5)),
        ]));
  }

  Widget _buildBookmarkItem(
      Map<String, dynamic> item, SInfo str, double s) {
    final arabic = item['arabic'] as String? ?? '';
    final color  = item['color']  as Color?  ?? _navy;
    final title  = item['title']  as String? ?? '';

    final double arabicFontSize = arabic.length <= 1
        ? s * 26
        : arabic.length <= 2 ? s * 22
        : arabic.length <= 4 ? s * 16
        : s * 12;

    return Container(
      margin: EdgeInsets.only(bottom: s * 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(s * 20),
        border: Border.all(color: _soft, width: 1.5),
        boxShadow: [BoxShadow(
          color: _navy.withValues(alpha: 0.08),
          blurRadius: 10, offset: const Offset(0, 3))]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(s * 20),
          onTap: () => widget.onItemTap(title),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: s * 14, vertical: s * 12),
            child: Row(children: [
              Container(
                width: s * 54, height: s * 54,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      color,
                      color == _navy
                          ? _teal
                          : color.withValues(alpha: 0.75)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(s * 14),
                  boxShadow: [BoxShadow(
                    color: color.withValues(alpha: 0.35),
                    blurRadius: 8, offset: const Offset(0, 3))]),
                child: Center(child: Text(arabic,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: arabicFontSize,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Amiri', height: 1.3)))),
              SizedBox(width: s * 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: _navy, fontSize: s * 15)),
                    SizedBox(height: s * 2),
                    Text(str.tapToOpen, style: TextStyle(
                      fontSize: s * 11,
                      color: Colors.black.withValues(alpha: 0.35))),
                  ])),
              GestureDetector(
                onTap: () {
                  setState(() {
                    BookmarkManager.toggleBookmark(
                      title: title, arabic: arabic, color: color);
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(s * 8),
                  decoration: BoxDecoration(
                    color: Colors.red.withValues(alpha: 0.08),
                    shape: BoxShape.circle),
                  child: Icon(Icons.delete_outline_rounded,
                    color: Colors.redAccent, size: s * 20))),
            ])))));
  }
}