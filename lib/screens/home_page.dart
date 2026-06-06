import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:provider/provider.dart';
import '../widgets/tajwid_card.dart';
import '../widgets/quiz_box.dart';
import '../screens/profile_page.dart';
import '../screens/info_page.dart';
import '../screens/bookmark_page.dart';
import '../screens/tajwid_data.dart';
import 'sub_menu_page.dart';
import 'makhraj.dart';
import 'nun_mati_page.dart';
import 'waqaf_page.dart';
import '../screens/quiz_page.dart';
import '../l10n/locale_provider.dart';
import '../l10n/string_home.dart';
import '../screens/flag_toggle.dart';

const Color _navy = Color(0xFF073793);
const Color _teal = Color(0xFF0D6A75);
const Color _gold = Color(0xFFC9A84C);

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();
  final List<Widget> _subPages = [];

  // ── GlobalKey untuk QuizPage supaya boleh panggil resetToModuleGrid ──
  final GlobalKey<QuizPageState> _quizPageKey = GlobalKey<QuizPageState>();

  late final Map<int, Widget> _cachedPages = {
    2: QuizPage(key: _quizPageKey),
    3: const InfoPage(),
  };

  static LinearGradient _tileGradient(int index) {
    const gradients = [
      LinearGradient(
        colors: [Color(0xFF8FAAD8), Color.fromARGB(255, 205, 218, 240)],
        begin: Alignment.topLeft, end: Alignment.bottomRight),
      LinearGradient(
        colors: [Color(0xFF073793), Color(0xFF0D6A75)],
        begin: Alignment.topLeft, end: Alignment.bottomRight),
    ];
    return gradients[index % gradients.length];
  }

  final List<String> _directToPage = [
    'Lam Lafaz Jalalah',
    'Iltiqa Sakinah',
    'Hamzah Wasal',
    'Tanda-Tanda Waqaf',
  ];

  bool _matchesSearch(String title) {
    if (_searchQuery.isEmpty) return true;
    final query = _searchQuery.toLowerCase().trim();
    if (title.toLowerCase().contains(query)) return true;
    final subList = TajwidData.dataHukum[title];
    if (subList != null) {
      for (final item in subList) {
        if (item['title']!.toLowerCase().contains(query)) return true;
        if ((item['description'] ?? '').toLowerCase().contains(query)) return true;
      }
    }
    return false;
  }

  void _navigateToSubMenu(String title) {
    if (_directToPage.contains(title)) {
      _navigateDirectToDetail(title);
      return;
    }
    final List<Map<String, String>> data = TajwidData.dataHukum[title] ?? [];
    setState(() {
      _subPages.add(SubMenuPage(
        title: title,
        subHukum: data,
        descriptionKey: title,
        onSelectSub: (subTitle) => _navigateToDetail(subTitle, title, data),
      ));
    });
  }

  void _navigateDirectToDetail(String title) {
    if (title == 'Tanda-Tanda Waqaf') {
      setState(() { _subPages.add(WaqafPage(onBack: _handleBack)); });
      return;
    }
    final List<Map<String, String>> data = TajwidData.dataHukum[title] ?? [];
    if (data.isEmpty) {
      setState(() {
        _subPages.add(NunMatiPage(
          title: title,
          description: 'Penerangan untuk $title akan ditambah.',
          examples: const [''],
          onBack: _handleBack,
        ));
      });
      return;
    }
    if (data.length == 1) {
      setState(() {
        _subPages.add(NunMatiPage(
          title: data[0]['title'] ?? title,
          description: data[0]['description'] ?? '',
          examples: [data[0]['examples'] ?? ''],
          onBack: _handleBack,
        ));
      });
      return;
    }
    setState(() {
      _subPages.add(SubMenuPage(
        title: title,
        subHukum: data,
        descriptionKey: title,
        onSelectSub: (subTitle) => _navigateToDetail(subTitle, title, data),
      ));
    });
  }

  void _navigateToDetail(
      String subTitle, String parentTitle, List<Map<String, String>> parentList) {
    if (subTitle == 'Mad Lazim') {
      final List<Map<String, String>> dataMadLazim =
          TajwidData.dataHukum['Mad Lazim'] ?? [];
      setState(() {
        _subPages.add(SubMenuPage(
          title: subTitle,
          subHukum: dataMadLazim,
          descriptionKey: 'Mad Lazim',
          onSelectSub: (finalTitle) =>
              _navigateToDetail(finalTitle, 'Mad Lazim', dataMadLazim),
        ));
      });
      return;
    }
    final selectedData =
        parentList.firstWhere((e) => e['title'] == subTitle, orElse: () => {});
    setState(() {
      _subPages.add(parentTitle.toLowerCase().contains('makhraj')
          ? DetailContentPage(
              title: subTitle,
              description: selectedData['description'] ?? '',
              examples: [selectedData['examples'] ?? ''],
              onBack: _handleBack,
            )
          : NunMatiPage(
              title: subTitle,
              description: selectedData['description'] ?? '',
              examples: [selectedData['examples'] ?? ''],
              onBack: _handleBack,
            ));
    });
  }

  String _findParentTitle(String subTitle) {
    for (var entry in TajwidData.dataHukum.entries) {
      if (entry.value.any((item) => item['title'] == subTitle)) return entry.key;
    }
    return '';
  }

  void _handleBack() {
    if (_subPages.isNotEmpty) setState(() => _subPages.removeLast());
  }

  // ── Handle tap pada bottom nav bar ──
  void _onNavTap(int index) {
    if (index == _selectedIndex && index == 2) {
      _quizPageKey.currentState?.resetToModuleGrid();
      return;
    }
    setState(() {
      _subPages.clear();
      _selectedIndex = index;
    });
  }

  Widget _getBody() {
    if (_selectedIndex == 0) {
      return _subPages.isEmpty ? _buildMainDashboard(context) : _subPages.last;
    }
    if (_selectedIndex == 1) {
      final double navBarHeight = 60 + MediaQuery.of(context).padding.bottom;
      return BookmarkPage(
        bottomOffset: navBarHeight,
        onItemTap: (title) {
          String parent = _findParentTitle(title);
          if (parent.isNotEmpty) {
            setState(() { _selectedIndex = 0; _subPages.clear(); });
            _navigateToDetail(title, parent, TajwidData.dataHukum[parent]!);
          }
        },
      );
    }
    if (_selectedIndex == 2) return _cachedPages[2]!;
    if (_selectedIndex == 3) return _cachedPages[3]!;
    return ProfilePage(key: UniqueKey());
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _subPages.isEmpty && _selectedIndex == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (_subPages.isNotEmpty) {
          _handleBack();
        } else if (_selectedIndex == 2) {
          final handled = _quizPageKey.currentState?.handleBackPress() ?? false;
          if (!handled) {
            setState(() => _selectedIndex = 0);
          }
        } else if (_selectedIndex != 0) {
          setState(() => _selectedIndex = 0);
        }
      },
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: _getBody(),
        bottomNavigationBar: CurvedNavigationBar(
          index: _selectedIndex,
          height: 60,
          backgroundColor: Colors.transparent,
          color: _navy,
          items: const [
            Icon(Icons.home_rounded, color: Colors.white),
            Icon(Icons.bookmark_rounded, color: Colors.white),
            Icon(Icons.edit_note_rounded, color: Colors.white),
            Icon(Icons.info_rounded, color: Colors.white),
            Icon(Icons.settings_rounded, color: Colors.white),
          ],
          onTap: _onNavTap,
        ),
      ),
    );
  }

  Widget _buildMainDashboard(BuildContext context) {
    final s = SHome(context.watch<LocaleProvider>().isEn);
    final bool isSearching = _searchQuery.isNotEmpty;

    final List<({String arabic, String title, String searchKey})> cardData = [
      (arabic: 'مَخْرَجُ', title: s.cardMakhraj,     searchKey: 'Makhraj Huruf'),
      (arabic: 'ن',         title: s.cardNunMati,     searchKey: 'Nun Mati dan Tanwin'),
      (arabic: 'م',         title: s.cardMimMati,     searchKey: 'Mim Mati'),
      (arabic: 'غ',         title: s.cardHukumIdgham, searchKey: 'Hukum Idgham'),
      (arabic: 'ا و ي',    title: s.cardHukumMad,    searchKey: 'Hukum Mad'),
      (arabic: 'ر',         title: s.cardHukumRa,     searchKey: 'Hukum Ra'),
      (arabic: 'ل',         title: s.cardLamJalalah,  searchKey: 'Lam Lafaz Jalalah'),
      (arabic: 'ق',         title: s.cardQalqalah,    searchKey: 'Qalqalah'),
      (arabic: 'ال',        title: s.cardAlifLam,     searchKey: 'Alif Lam Marifah'),
      (arabic: 'إِلْتِقَا', title: s.cardIltiqa,      searchKey: 'Iltiqa Sakinah'),
      (arabic: 'ء',         title: s.cardHamzah,      searchKey: 'Hamzah Wasal'),
      (arabic: 'قلى صلي',  title: s.cardWaqaf,       searchKey: 'Tanda-Tanda Waqaf'),
    ];

    final List<({Widget card, String searchTitle})> allCards = cardData
        .asMap()
        .entries
        .map((e) => (
              card: _buildCard(e.value.arabic, e.value.title,
                  e.value.searchKey, e.key),
              searchTitle: e.value.searchKey,
            ))
        .toList();

    final List<Widget> filteredCards = allCards
        .where((item) => _matchesSearch(item.searchTitle))
        .map((item) => item.card)
        .toList();

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset('assets/images/background_4.jpg', fit: BoxFit.cover)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(s),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  const double quizBoxHeight  = 58;
                  const double quizBoxGap     = 8;
                  const double paddingTop     = 10;
                  const double paddingBottom  = 10;
                  const double bottomGap      = 80;
                  const double gridSpacing    = 10;
                  const double gridPadH       = 24;
                  const double cardGapH       = 20;

                  final double quizSection = isSearching ? 0 : quizBoxHeight + quizBoxGap;
                  final double availableForGrid = constraints.maxHeight
                      - quizSection - paddingTop - paddingBottom - bottomGap;

                  const int totalCards     = 12;
                  const int crossAxisCount = 3;
                  final int rowCount = (totalCards / crossAxisCount).ceil();
                  final double totalGapV = gridSpacing * (rowCount - 1);
                  final double cardHeight = (availableForGrid - totalGapV) / rowCount;
                  final double cardWidth =
                      (constraints.maxWidth - gridPadH - cardGapH) / crossAxisCount;
                  final double ratio = cardWidth / cardHeight.clamp(60, 200);

                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                        child: filteredCards.isEmpty
                            ? SizedBox(
                                height: availableForGrid,
                                child: Center(
                                  child: Text(s.noResult,
                                    style: TextStyle(
                                      color: _navy.withValues(alpha: 0.5),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500))))
                            : GridView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: crossAxisCount,
                                  mainAxisSpacing: gridSpacing,
                                  crossAxisSpacing: gridSpacing,
                                  childAspectRatio: ratio.clamp(0.7, 1.4),
                                ),
                                itemCount: filteredCards.length,
                                itemBuilder: (_, index) => filteredCards[index])),
                      if (!isSearching) ...[
                        _buildQuizBox(s, constraints.maxWidth),
                        const SizedBox(height: 80),
                      ],
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeader(SHome s) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [_navy, _teal],
          begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32)),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32)),
              child: CustomPaint(painter: WavePainter()))),
          Positioned(
            right: 16, top: 10, bottom: 0,
            child: Text('اللّٰه',
              style: TextStyle(
                fontSize: 90,
                color: Colors.white.withValues(alpha: 0.06),
                fontWeight: FontWeight.bold,
                fontFamily: 'Amiri'))),
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Text(s.homeTitle,
                      style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold,
                        color: Colors.white, letterSpacing: 0.3)),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.2), width: 1)),
                      child: const Icon(Icons.menu_book_rounded,
                          color: Colors.white, size: 18)),
                    const Spacer(),
                    const FlagToggleButton(),
                  ]),
                  const SizedBox(height: 6),
                  Container(height: 2, width: 50,
                    decoration: BoxDecoration(
                      color: _gold, borderRadius: BorderRadius.circular(4))),
                  const SizedBox(height: 14),
                  _buildSearchField(s),
                ],
              )),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField(SHome s) {
    return SizedBox(
      height: 42,
      child: TextField(
        controller: _searchController,
        style: const TextStyle(color: Colors.black87, fontSize: 14),
        onChanged: (v) => setState(() => _searchQuery = v),
        decoration: InputDecoration(
          hintText: s.search,
          hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(Icons.search_rounded, size: 20, color: Colors.grey),
          suffixIcon: _searchQuery.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear_rounded, size: 20, color: Colors.grey),
                  onPressed: () {
                    _searchController.clear();
                    setState(() => _searchQuery = '');
                  })
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none),
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }

  Widget _buildCard(String arabic, String title, String searchKey, int index) {
    return TajwidCard(
      arabic: arabic,
      title: title,
      color: Colors.transparent,
      gradient: _tileGradient(index),
      onTap: () {
        FocusScope.of(context).unfocus();
        _navigateToSubMenu(searchKey);
      },
    );
  }

  Widget _buildQuizBox(SHome s, double screenWidth) {
    final double sc = (screenWidth / 393).clamp(0.82, 1.18);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () {
          setState(() { _selectedIndex = 2; _subPages.clear(); });
        },
        borderRadius: BorderRadius.circular(18),
        child: Container(
          height: 58,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [_navy, _teal],
              begin: Alignment.centerLeft, end: Alignment.centerRight),
            borderRadius: BorderRadius.circular(18),
            boxShadow: [BoxShadow(
              color: _navy.withValues(alpha: 0.35),
              blurRadius: 12, offset: const Offset(0, 4))]),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: _gold.withValues(alpha: 0.4), width: 1.5)))),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textDirection: TextDirection.ltr,
                    children: [
                      QuizBox(letter: 'ك'),
                      SizedBox(width: 5),
                      QuizBox(letter: 'و'),
                      SizedBox(width: 5),
                      QuizBox(letter: 'ي'),
                      SizedBox(width: 5),
                      QuizBox(letter: 'ز'),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(s.quizLabel,
                    style: TextStyle(
                      fontSize: sc * 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withValues(alpha: 0.85),
                      letterSpacing: 1.2)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.white.withValues(alpha: 0.0),
          Colors.white.withValues(alpha: 0.15),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    final path1 = Path()
      ..moveTo(0, size.height * 0.5)
      ..quadraticBezierTo(size.width * 0.2, size.height * 0.3,
          size.width * 0.5, size.height * 0.6)
      ..quadraticBezierTo(
          size.width * 0.8, size.height * 0.9, size.width, size.height * 0.5)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path1, paint1);

    final paint2 = Paint()
      ..shader = LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          Colors.white.withValues(alpha: 0.12),
          Colors.white.withValues(alpha: 0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    final path2 = Path()
      ..moveTo(0, size.height * 0.85)
      ..quadraticBezierTo(size.width * 0.4, size.height * 0.5,
          size.width * 0.7, size.height * 0.8)
      ..quadraticBezierTo(size.width * 0.9, size.height * 0.95,
          size.width, size.height * 0.7)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}