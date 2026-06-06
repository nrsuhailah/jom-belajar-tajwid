import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'quiz_constant.dart';
import '../l10n/locale_provider.dart';
import '../l10n/string_quiz.dart';
import '../screens/flag_toggle.dart';

class ModuleRuleCard extends StatelessWidget {
  final String moduleName;
  final String arabicExample;
  final String Function(String module, bool isEn) ruleDescriptionBuilder;
  final VoidCallback onStart;

  const ModuleRuleCard({
    super.key,
    required this.moduleName,
    required this.arabicExample,
    required this.ruleDescriptionBuilder,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;
    final double s = (sw / 393).clamp(0.82, 1.18);
    final isEn = context.watch<LocaleProvider>().isEn;
    final str = SQuiz(isEn);
    final displayName = str.translateModuleName(moduleName);
    final ruleDescription = ruleDescriptionBuilder(moduleName, isEn);

    return SafeArea(
      child: Column(
        children: [

          // ── Header luar box ──
          Padding(
            padding: EdgeInsets.fromLTRB(s * 20, s * 28, s * 20, s * 20), // ✅ top naik dari 16→28, bottom naik dari 8→20
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 48),
                Expanded(
                  child: Column(children: [
                    Text(
                      displayName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: s * 26,         // ✅ besar dari 20→26
                        fontWeight: FontWeight.bold,
                        color: navyBlue,
                      ),
                    ),
                    SizedBox(height: s * 8),      // ✅ gap bawah text naik dari 6→8
                    Container(
                      height: 3,
                      width: s * 60,             // ✅ line bawah sikit lebih panjang dari 50→60
                      decoration: BoxDecoration(
                        color: goldAccent,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ]),
                ),
                const FlagToggleButton(),
              ],
            ),
          ),

          // ── Card box — centered vertically ──
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(s * 28, s * 8, s * 28, s * 20),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: sh * 0.45,
                  ),
                  child: IntrinsicHeight(
                    child: Container(
                      padding: EdgeInsets.all(s * 24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(s * 28),
                        boxShadow: [
                          BoxShadow(
                            color: navyBlue.withValues(alpha: 0.15),
                            blurRadius: 24,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          // Arabic example
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(s * 18),
                            decoration: BoxDecoration(
                              color: cardGold,
                              borderRadius: BorderRadius.circular(s * 16),
                              border: Border.all(
                                color: goldAccent.withValues(alpha: 0.4),
                              ),
                            ),
                            child: Text(
                              arabicExample,
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: s * 34,
                                color: navyBlue,
                                fontWeight: FontWeight.w600,
                                height: 2.0,
                                fontFamily: 'Amiri',
                              ),
                            ),
                          ),

                          SizedBox(height: s * 16),

                          // Rule description
                          Text(
                            ruleDescription,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: s * 14,
                              color: Colors.black87,
                              height: 1.6,
                            ),
                          ),

                          SizedBox(height: s * 28),

                          // Start button
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: navyBlue,
                              minimumSize: Size(double.infinity, s * 52),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(s * 14),
                              ),
                              elevation: 4,
                            ),
                            onPressed: onStart,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.play_arrow_rounded,
                                  color: Colors.white,
                                  size: s * 22,
                                ),
                                SizedBox(width: s * 8),
                                Text(
                                  str.mulaKuiz,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: s * 16,
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}