import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'quiz_constant.dart';
import '../l10n/locale_provider.dart';
import '../l10n/string_quiz.dart';
import '../screens/flag_toggle.dart';

const Color _gold = Color(0xFFC9A84C);

class QuizModuleGrid extends StatelessWidget {
  final Map<String, List<Map<String, dynamic>>> quizData;
  final void Function(String) onModuleSelected;
  final Map<String, int>? moduleProgress;
  final int streakDays;
  final int totalXp;

  const QuizModuleGrid({
    super.key,
    required this.quizData,
    required this.onModuleSelected,
    this.moduleProgress,
    this.streakDays = 0,
    this.totalXp = 0,
  });

  static LinearGradient _tileGradient(int index) {
    const gradients = [
      LinearGradient(
          colors: [Color(0xFF8FAAD8), Color(0xFF8FAAD8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight),
      LinearGradient(
          colors: [Color(0xFF073793), Color(0xFF0D6A75)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight),
      LinearGradient(
          colors: [Color(0xFF8FAAD8), Color(0xFF8FAAD8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight),
      LinearGradient(
          colors: [Color(0xFF073793), Color(0xFF0D6A75)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight),
    ];
    return gradients[index % gradients.length];
  }

  static bool _isDark(int index) => index % 2 == 1;

  static int _columnCount(double screenWidth) {
    if (screenWidth >= 900) return 4;
    if (screenWidth >= 600) return 3;
    return 3;
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final sw = mq.size.width;
    final double s = (sw / 393).clamp(0.82, 1.18);
    final modules = quizData.keys.toList();
    final isEn = context.watch<LocaleProvider>().isEn;
    final str = SQuiz(isEn);

    if (modules.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.menu_book_rounded, size: 64, color: softBlue),
            const SizedBox(height: 16),
            Text(
              str.tiadaModul,
              style: const TextStyle(color: navyBlue, fontSize: 16),
            ),
          ],
        ),
      );
    }

    return OrientationBuilder(
      builder: (context, orientation) {
        return Column(
          children: [
            SafeArea(
              bottom: false,
              child: _buildHeader(s, str), // ← pass str
            ),
            StreakBanner(
              streakDays: streakDays,
              totalXp: totalXp,
              str: str,
            ),
            Expanded(
              child: SafeArea(
                top: false,
                bottom: true,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final mq = MediaQuery.of(context);

                    final double navBarHeight =
                        kBottomNavigationBarHeight + mq.padding.bottom;

                    final int cols = _columnCount(mq.size.width);

                    const double spacing = 10;
                    const double padH = 32;
                    final double cardGapH = spacing * (cols - 1);

                    final double cardWidth =
                        (constraints.maxWidth - padH - cardGapH) / cols;

                    final double gridHeight =
                        constraints.maxHeight - navBarHeight - 8;
                    final int rowCount = (modules.length / cols).ceil();
                    final double totalGapV = spacing * (rowCount - 1);
                    final double cardHeight =
                        (gridHeight - totalGapV) / rowCount;

                    final double ratio =
                        cardWidth / cardHeight.clamp(60, 200);

                    return Padding(
                      padding: const EdgeInsets.fromLTRB(16, 4, 16, 5),
                      child: GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: modules.length,
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: cols,
                          mainAxisSpacing: spacing,
                          crossAxisSpacing: spacing,
                          childAspectRatio: ratio.clamp(0.7, 1.4),
                        ),
                        itemBuilder: (context, index) {
                          final name = modules[index];
                          final displayName = str.translateModuleName(name);
                          final total = quizData[name]?.length ?? 0;
                          final completed = moduleProgress?[name] ?? 0;
                          return _ModuleCard(
                            moduleName: displayName,
                            gradient: _tileGradient(index),
                            isDark: _isDark(index),
                            icon: QuizHelpers.moduleIcon(name),
                            total: total,
                            completed: completed,
                            progressFraction:
                                total > 0 ? completed / total : 0.0,
                            onTap: () => onModuleSelected(name),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ← terima str sebagai parameter
  Widget _buildHeader(double s, SQuiz str) {
    return Padding(
      padding: EdgeInsets.fromLTRB(s * 20, s * 20, s * 20, s * 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 48),
          Expanded(
            child: Column(
              children: [
                Text(
                  str.pilihModul, // ← guna str.pilihModul, bukan hard-coded
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: s * 24,
                    fontWeight: FontWeight.bold,
                    color: navyBlue,
                  ),
                ),
                SizedBox(height: s * 6),
                Container(
                  height: 3,
                  width: s * 50,
                  decoration: BoxDecoration(
                    color: _gold,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
          const FlagToggleButton(),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// _ModuleCard
// ─────────────────────────────────────────────

class _ModuleCard extends StatefulWidget {
  final String moduleName;
  final LinearGradient gradient;
  final bool isDark;
  final IconData icon;
  final int total, completed;
  final double progressFraction;
  final VoidCallback onTap;

  const _ModuleCard({
    required this.moduleName,
    required this.gradient,
    required this.isDark,
    required this.icon,
    required this.total,
    required this.completed,
    required this.progressFraction,
    required this.onTap,
  });

  @override
  State<_ModuleCard> createState() => _ModuleCardState();
}

class _ModuleCardState extends State<_ModuleCard> {
  bool _pressed = false;

  Color get _textColor => widget.isDark ? Colors.white : navyBlue;
  Color get _iconBg => widget.isDark
      ? Colors.white.withValues(alpha: 0.18)
      : navyBlue.withValues(alpha: 0.12);
  Color get _iconColor => widget.isDark ? Colors.white : navyBlue;
  Color get _watermark => widget.isDark
      ? Colors.white.withValues(alpha: 0.18)
      : navyBlue.withValues(alpha: 0.15);
  Color get _highlightColor => widget.isDark
      ? Colors.white.withValues(alpha: 0.25)
      : Colors.white.withValues(alpha: 0.90);
  Color get _shadowColor => widget.isDark
      ? const Color(0xFF021A4A).withValues(alpha: 0.60)
      : const Color(0xFF4A6FA5).withValues(alpha: 0.45);

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final double s = (sw / 393).clamp(0.82, 1.35);

    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        transform: Matrix4.translationValues(
          _pressed ? 2 : 0,
          _pressed ? 3 : 0,
          0,
        ),
        decoration: BoxDecoration(
          gradient: widget.gradient,
          borderRadius: BorderRadius.circular(16),
          boxShadow: _pressed
              ? [
                  BoxShadow(
                    color: _shadowColor,
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: const Offset(1, 2),
                  )
                ]
              : [
                  BoxShadow(
                    color: _shadowColor,
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: const Offset(4, 6),
                  ),
                  BoxShadow(
                    color: _shadowColor.withValues(alpha: 0.25),
                    blurRadius: 20,
                    spreadRadius: 0,
                    offset: const Offset(2, 4),
                  ),
                  BoxShadow(
                    color: _highlightColor,
                    blurRadius: 0,
                    spreadRadius: 0,
                    offset: const Offset(-2, -2),
                  ),
                ],
        ),
        child: Stack(
          children: [
            // Shimmer overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      _highlightColor.withAlpha(
                          _pressed ? 0 : (0.35 * 255).round()),
                      Colors.transparent,
                      Colors.transparent,
                      _shadowColor.withAlpha(
                          _pressed ? 0 : (0.15 * 255).round()),
                    ],
                    stops: const [0.0, 0.3, 0.7, 1.0],
                  ),
                ),
              ),
            ),

            // Watermark huruf Arab
            Positioned(
              right: -10,
              top: -2,
              child: Text(
                'ق',
                style: TextStyle(
                  fontSize: s * 52,
                  color: _watermark,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Amiri',
                ),
              ),
            ),

            // Bulatan hiasan bawah
            Positioned(
              bottom: -8,
              left: -8,
              child: Container(
                width: s * 40,
                height: s * 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _watermark,
                ),
              ),
            ),
            Positioned(
              bottom: s * 8,
              left: s * 8,
              child: Container(
                width: s * 22,
                height: s * 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _watermark,
                ),
              ),
            ),

            // Kandungan utama
            Padding(
              padding: EdgeInsets.all(s * 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon
                  Container(
                    padding: EdgeInsets.all(s * 6),
                    decoration: BoxDecoration(
                      color: _iconBg,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: _shadowColor.withValues(alpha: 0.3),
                          blurRadius: 4,
                          offset: const Offset(1, 2),
                        )
                      ],
                    ),
                    child: Icon(widget.icon,
                        color: _iconColor, size: s * 18),
                  ),
                  SizedBox(height: s * 6),

                  // Nama modul
                  Text(
                    widget.moduleName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: s * 11,
                      fontWeight: FontWeight.bold,
                      color: _textColor,
                      height: 1.3,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}