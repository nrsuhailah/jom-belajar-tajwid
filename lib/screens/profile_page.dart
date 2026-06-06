import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'arabic_size.dart';
import 'notification.dart';
import '../l10n/locale_provider.dart';
import '../l10n/string_profile.dart';
import '../database/database_helper.dart';
import '../screens/flag_toggle.dart';

const Color _navy = Color(0xFF073793);
const Color _teal = Color(0xFF0D6A75);
const Color _gold = Color(0xFFC9A84C);
const Color _soft = Color(0xFFDCE6F5);

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _totalKuiz = 0, _totalBetul = 0, _totalSalah = 0, _modulSelesai = 0;
  String _reminderTime = 'Tiada';
  bool _reminderAktif = false;
  static const int _totalModul = 12;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final totalKuiz     = await DatabaseHelper.instance.getQuizCount();
    final totalBetul    = await DatabaseHelper.instance.getTotalBetul();
    final totalSalah    = await DatabaseHelper.instance.getTotalSalah();
    final modulList     = await DatabaseHelper.instance.getModulSelesai();
    final reminderTime  = await DatabaseHelper.instance.getSetting('reminder_time') ?? 'Tiada';
    final reminderAktif = reminderTime != 'Tiada';
    if (!mounted) return;
    setState(() {
      _totalKuiz     = totalKuiz;
      _totalBetul    = totalBetul;
      _totalSalah    = totalSalah;
      _modulSelesai  = modulList.length;
      _reminderTime  = reminderTime;
      _reminderAktif = reminderAktif;
    });
  }

  String _tahap(SProfile s) {
    if (_totalKuiz >= 15) return s.tahapCemerlang;
    if (_totalKuiz >= 5)  return s.tahapGigih;
    return s.tahapBaru;
  }

  double get _peratus {
    final t = _totalBetul + _totalSalah;
    return t == 0 ? 0 : _totalBetul / t * 100;
  }

  // ─── Statistik dialog ──────────────────────────────────────────────────
  void _showStatistik(SProfile s) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        contentPadding: EdgeInsets.zero,
        content: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [_navy, _teal])),
              child: Column(children: [
                const Icon(Icons.bar_chart_rounded, color: _gold, size: 32),
                const SizedBox(height: 4),
                Text(s.statisticsTitle, style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
              ])),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(children: [
                _sRow(Icons.book_rounded,         s.moduleLearned, '$_modulSelesai / $_totalModul', _teal),
                _sRow(Icons.quiz_rounded,         s.quizDone,      '$_totalKuiz',  _navy),
                _sRow(Icons.check_circle_rounded, s.correctAns,    '$_totalBetul', Colors.green),
                _sRow(Icons.cancel_rounded,       s.wrongAns,      '$_totalSalah', Colors.redAccent),
                const SizedBox(height: 8),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text(s.successRate, style: const TextStyle(
                    fontWeight: FontWeight.bold, color: _navy, fontSize: 13)),
                  Text('${_peratus.toStringAsFixed(1)}%', style: const TextStyle(
                    fontWeight: FontWeight.bold, color: _gold, fontSize: 13)),
                ]),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: _peratus / 100,
                    backgroundColor: _soft,
                    minHeight: 10,
                    valueColor: AlwaysStoppedAnimation(
                      _peratus >= 70 ? Colors.green
                      : _peratus >= 40 ? _gold
                      : Colors.redAccent))),
                const Divider(height: 22),
                TextButton.icon(
                  // FIX 1: Buang async + Future.delayed, tutup dialog terus
                  // guna Navigator.pop(ctx) pastu _confirmReset synchronously
                  onPressed: () {
                    Navigator.pop(ctx);
                    if (!mounted) return;
                    final freshS = SProfile(context.read<LocaleProvider>().isEn);
                    _confirmReset(freshS);
                  },
                  icon: const Icon(Icons.refresh_rounded, color: Colors.redAccent, size: 18),
                  label: Text(s.resetAll,
                    style: const TextStyle(color: Colors.redAccent, fontSize: 13))),
              ])),
          ]))));
  }

  Widget _sRow(IconData icon, String label, String val, Color c) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Row(children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: c.withOpacity(0.1), borderRadius: BorderRadius.circular(9)),
          child: Icon(icon, color: c, size: 15)),
        const SizedBox(width: 9),
        Expanded(child: Text(label,
          style: const TextStyle(fontSize: 13, color: Colors.black87))),
        Text(val, style: const TextStyle(
          fontWeight: FontWeight.bold, color: _navy, fontSize: 14)),
      ]));
  }

  // ─── Confirm reset ────────────────────────────────────────────────────
  void _confirmReset(SProfile s) {
    // FIX 2: Guna 'context' (parent widget context) terus
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Text(s.resetTitle,
          style: const TextStyle(fontWeight: FontWeight.bold, color: _navy)),
        content: Text(s.resetBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(s.cancel, style: const TextStyle(color: Colors.grey))),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            onPressed: () async {
              Navigator.pop(ctx);
              if (!mounted) return;

              // FIX 3: Guna 'context' (parent) untuk Overlay
              OverlayEntry? spinnerOverlay;
              spinnerOverlay = OverlayEntry(
                builder: (_) => const ColoredBox(
                  color: Colors.black26,
                  child: Center(
                    child: CircularProgressIndicator(color: _navy))));
              Overlay.of(context).insert(spinnerOverlay);

              await DatabaseHelper.instance.deleteAllQuizResults();

              spinnerOverlay.remove();
              spinnerOverlay = null;

              if (!mounted) return;

              await _loadData();

              if (!mounted) return;

              final freshS = SProfile(context.read<LocaleProvider>().isEn);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(freshS.resetDone),
                backgroundColor: Colors.redAccent,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))));
            },
            child: Text(s.yesReset)),
        ]));
  }

  // ─── Reminder ─────────────────────────────────────────────────────────
  // FIX 4: Buang parameter 'BuildContext ctx' sepenuhnya
  // Guna 'context' (parent widget context) untuk semua operasi
  Future<void> _selectTime(SProfile s) async {
    final picked = await showTimePicker(
      context: context,               // ✅ parent context
      initialTime: TimeOfDay.now(),
      builder: (c, child) => Theme(
        data: Theme.of(c).copyWith(
          colorScheme: const ColorScheme.light(primary: _navy)),
        child: child!));
    if (picked == null) return;
    if (!mounted) return;
    final formatted = picked.format(context);  // ✅ parent context
    await NotificationService().jadualkanPeringatan(
      picked,
      isEn: context.read<LocaleProvider>().isEn,
    );
    await DatabaseHelper.instance.saveSetting('reminder_time', formatted);
    await DatabaseHelper.instance.saveSetting('reminder_aktif', 'true');
    if (!mounted) return;
    setState(() { _reminderTime = formatted; _reminderAktif = true; });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(s.reminderSet(formatted)),
      backgroundColor: _navy,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))));
  }

  Future<void> _batalkanPeringatan(SProfile s) async {
    await NotificationService().batalkanPeringatan();
    await DatabaseHelper.instance.saveSetting('reminder_time', 'Tiada');
    await DatabaseHelper.instance.saveSetting('reminder_aktif', 'false');
    if (!mounted) return;
    setState(() { _reminderTime = 'Tiada'; _reminderAktif = false; });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(s.reminderCancelled),
      backgroundColor: Colors.grey[700],
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))));
  }

  void _showReminderDialog(SProfile s) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        contentPadding: EdgeInsets.zero,
        content: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [_navy, _teal])),
              child: Column(children: [
                Icon(
                  _reminderAktif
                    ? Icons.notifications_active_rounded
                    : Icons.notifications_off_rounded,
                  color: _gold, size: 32),
                const SizedBox(height: 4),
                Text(s.reminderTitle, style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                    color: _reminderAktif
                      ? Colors.green.withOpacity(0.3)
                      : Colors.red.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    _reminderAktif ? s.reminderActive : s.reminderInactive,
                    style: TextStyle(
                      color: _reminderAktif ? Colors.greenAccent : Colors.redAccent,
                      fontSize: 11, fontWeight: FontWeight.bold))),
              ])),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(children: [
                if (_reminderAktif) ...[
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: _soft, borderRadius: BorderRadius.circular(12)),
                    child: Row(children: [
                      const Icon(Icons.access_time_rounded, color: _navy, size: 20),
                      const SizedBox(width: 8),
                      Text('${s.reminderCurrentTime}: $_reminderTime',
                        style: const TextStyle(color: _navy, fontWeight: FontWeight.bold)),
                    ])),
                  const SizedBox(height: 12),
                ],
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _navy,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14))),
                    // FIX 5: Tutup dialog, pastu panggil _selectTime tanpa ctx
                    onPressed: () {
                      Navigator.pop(ctx);
                      _selectTime(s);  // ✅ tiada ctx parameter
                    },
                    icon: const Icon(Icons.schedule_rounded, size: 18),
                    label: Text(
                      _reminderAktif ? s.reminderChangeTime : s.reminderSetTime,
                      style: const TextStyle(fontWeight: FontWeight.bold)))),
                if (_reminderAktif) ...[
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.redAccent,
                        side: const BorderSide(color: Colors.redAccent),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14))),
                      onPressed: () {
                        Navigator.pop(ctx);
                        _batalkanPeringatan(s);
                      },
                      icon: const Icon(Icons.notifications_off_rounded, size: 18),
                      label: Text(s.reminderCancel,
                        style: const TextStyle(fontWeight: FontWeight.bold)))),
                ],
                const SizedBox(height: 4),
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: Text(s.close, style: const TextStyle(color: Colors.grey))),
              ])),
          ]))));
  }

  // ─── Arabic size ──────────────────────────────────────────────────────
  void _showArabicSize(SProfile s) {
    final provider = context.read<ArabicSizeProvider>();
    const internalLabels = ['Kecil', 'Sederhana', 'Besar'];
    showDialog(
      context: context,
      builder: (ctx) => ChangeNotifierProvider.value(
        value: provider,
        child: AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          title: Text(s.arabicSizeTitle,
            style: const TextStyle(fontWeight: FontWeight.bold, color: _navy)),
          content: Consumer<ArabicSizeProvider>(
            builder: (_, prov, __) => Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(3, (i) {
                final internal = internalLabels[i];
                final display  = s.sizeLabels[i];
                final sel = prov.label == internal;
                final fs = i == 0 ? 22.0 : i == 1 ? 32.0 : 42.0;
                return GestureDetector(
                  onTap: () async {
                    await prov.setSize(internal);
                    if (mounted) Navigator.pop(ctx);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: sel ? _navy : _soft,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: sel ? _gold : Colors.transparent, width: 2)),
                    child: Row(children: [
                      Text('بِسْمِ اللّٰهِ', style: TextStyle(
                        fontSize: fs, fontFamily: 'Amiri',
                        fontWeight: FontWeight.bold,
                        color: sel ? Colors.white : _navy)),
                      const Spacer(),
                      Text(display, style: TextStyle(fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: sel ? _gold : _navy)),
                      if (sel) ...[
                        const SizedBox(width: 6),
                        const Icon(Icons.check_circle_rounded, color: _gold, size: 18),
                      ],
                    ])));
              }))))));
  }

  // ─── Build ────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final double s = (sw / 393).clamp(0.82, 1.18);
    final arabicProvider = context.watch<ArabicSizeProvider>();
    final localeProvider = context.watch<LocaleProvider>();
    final str = SProfile(localeProvider.isEn);

    final sizeMap = {
      'Kecil':     str.sizeLabels[0],
      'Sederhana': str.sizeLabels[1],
      'Besar':     str.sizeLabels[2],
    };
    final arabicDisplayLabel =
        sizeMap[arabicProvider.label] ?? arabicProvider.label;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        Positioned.fill(child: Image.asset(
          'assets/images/background_4.jpg', fit: BoxFit.cover)),
        Positioned.fill(child: Container(color: _navy.withOpacity(0.04))),

        SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                // ── Header ──
                Padding(
                  padding: const EdgeInsets.fromLTRB(2, 20, 2, 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 48),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(str.profileTitle, style: TextStyle(
                              fontSize: s * 26,
                              fontWeight: FontWeight.bold,
                              color: _navy)),
                            const SizedBox(height: 6),
                            Container(height: 3, width: 50, decoration: BoxDecoration(
                              color: _gold, borderRadius: BorderRadius.circular(4))),
                          ]),
                      ),
                      FlagToggleButton(
                        reminderTime: _reminderTime,
                        reminderAktif: _reminderAktif,
                      ),
                    ],
                  ),
                ),

                // ── Stats card ──
                _buildStatsCard(str),

                const SizedBox(height: 16),

                // ── Seksyen Pembelajaran ──
                _label(str.sectionLearning),
                const SizedBox(height: 8),
                _tile(Icons.bar_chart_rounded, _navy,
                  str.statisticsTitle,
                  '$_modulSelesai/$_totalModul ${str.modulesLabel}  ·  '
                  '${_peratus.toStringAsFixed(0)}% ${str.successRateShort}',
                  () => _showStatistik(str)),

                const SizedBox(height: 16),

                // ── Seksyen Keutamaan ──
                _label(str.sectionPreferences),
                const SizedBox(height: 8),
                _tile(
                  _reminderAktif
                    ? Icons.notifications_active_rounded
                    : Icons.notifications_off_rounded,
                  _reminderAktif ? Colors.green : Colors.orange,
                  str.reminderTitle,
                  _reminderAktif
                    ? str.reminderActiveDesc(_reminderTime)
                    : str.reminderNone,
                  () => _showReminderDialog(str)),
                const SizedBox(height: 8),
                _tile(Icons.text_fields_rounded, _navy,
                  str.arabicSizeTitle,
                  '${str.currentSize}: $arabicDisplayLabel',
                  () => _showArabicSize(str)),

                const Spacer(),
                const SizedBox(height: 80),
              ],
            ))),
      ]));
  }

  // ─── Stats card ────────────────────────────────────────────────────────
  Widget _buildStatsCard(SProfile s) {
    final total = _totalBetul + _totalSalah;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [_navy, _teal],
          begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [BoxShadow(
          color: _navy.withOpacity(0.3),
          blurRadius: 14, offset: const Offset(0, 5))]),
      child: Column(children: [
        Row(children: [
          Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              shape: BoxShape.circle,
              border: Border.all(color: _gold, width: 1.5)),
            child: const Icon(Icons.school_rounded, color: Colors.white, size: 20)),
          const SizedBox(width: 10),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(s.learningProgress, style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
            Text(_tahap(s), style: TextStyle(
              color: Colors.white.withOpacity(0.8), fontSize: 11)),
          ])),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: _gold.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: _gold.withOpacity(0.5))),
            child: Text('${_peratus.toStringAsFixed(0)}%',
              style: const TextStyle(
                color: _gold, fontWeight: FontWeight.bold, fontSize: 15))),
        ]),
        const SizedBox(height: 12),

        Row(children: [
          _mini('$_modulSelesai/$_totalModul', s.modulesLabel, Icons.book_rounded),
          _mini('$_totalKuiz',  s.quizLabel,    Icons.quiz_rounded),
          _mini('$_totalBetul', s.correctLabel, Icons.check_circle_rounded),
          _mini('$_totalSalah', s.wrongLabel,   Icons.cancel_rounded),
        ]),
        const SizedBox(height: 8),

        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('$total ${s.questionsAnswered}', style: TextStyle(
            color: Colors.white.withOpacity(0.6), fontSize: 10)),
          Text('$_modulSelesai/$_totalModul ${s.modulesLabel}', style: TextStyle(
            color: Colors.white.withOpacity(0.6), fontSize: 10)),
        ]),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: _modulSelesai / _totalModul,
            backgroundColor: Colors.white.withOpacity(0.15),
            valueColor: const AlwaysStoppedAnimation(_gold),
            minHeight: 6)),
      ]));
  }

  Widget _mini(String val, String label, IconData icon) {
    return Expanded(child: Column(children: [
      Icon(icon, color: Colors.white.withOpacity(0.7), size: 13),
      const SizedBox(height: 2),
      Text(val, style: const TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
      Text(label, style: TextStyle(
        color: Colors.white.withOpacity(0.6), fontSize: 9)),
    ]));
  }

  Widget _label(String t) {
    return Row(children: [
      Container(width: 4, height: 16, decoration: BoxDecoration(
        color: _gold, borderRadius: BorderRadius.circular(4))),
      const SizedBox(width: 8),
      Text(t, style: const TextStyle(fontSize: 13,
        fontWeight: FontWeight.bold, color: _navy, letterSpacing: 0.5)),
    ]);
  }

  Widget _tile(IconData icon, Color ic, String title, String sub,
      VoidCallback fn) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: fn,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.92),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: _soft, width: 1.5),
            boxShadow: [BoxShadow(
              color: _navy.withOpacity(0.07),
              blurRadius: 8, offset: const Offset(0, 3))]),
          child: Row(children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: ic.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10)),
              child: Icon(icon, color: ic, size: 20)),
            const SizedBox(width: 12),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: const TextStyle(
                fontWeight: FontWeight.bold, color: _navy, fontSize: 13)),
              const SizedBox(height: 1),
              Text(sub, style: TextStyle(fontSize: 11,
                color: Colors.black.withOpacity(0.45))),
            ])),
            const Icon(Icons.arrow_forward_ios_rounded,
              size: 13, color: Colors.grey),
          ]))));
  }
}