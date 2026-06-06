import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/locale_provider.dart';
import '../screens/notification.dart';

const Color _navy = Color(0xFF073793);
const Color _gold = Color(0xFFC9A84C);

class FlagToggleButton extends StatelessWidget {
  final String? reminderTime;
  final bool reminderAktif;

  const FlagToggleButton({
    super.key,
    this.reminderTime,
    this.reminderAktif = false,
  });

  @override
  Widget build(BuildContext context) {
    final localeProvider = context.watch<LocaleProvider>();
    final isEn = localeProvider.isEn;

    final flagAsset = isEn
        ? 'assets/images/flag_my.png'
        : 'assets/images/flag_uk.png';
    final flagEmoji = isEn ? '🇲🇾' : '🇬🇧';
    final label     = isEn ? 'MY' : 'EN';

    return GestureDetector(
      onTap: () async {
        final newLang = isEn ? 'ms' : 'en';
        await localeProvider.setLang(newLang);

        if (reminderAktif && reminderTime != null && reminderTime != 'Tiada') {
          try {
            final parts = reminderTime!.split(':');
            if (parts.length == 2) {
              final time = TimeOfDay(
                hour: int.parse(parts[0].trim()),
                minute: int.parse(parts[1].trim()),
              );
              await NotificationService().jadualkanPeringatan(
                time, isEn: newLang == 'en');
            }
          } catch (_) {}
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Bendera bulat sahaja, tiada container shape ──
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _gold,
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: _navy.withOpacity(0.18),
                  blurRadius: 6,
                  spreadRadius: 0,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                flagAsset,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Center(
                  child: Text(
                    flagEmoji,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 3),
          // ── Label di bawah bendera, warna hitam ──
          Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}