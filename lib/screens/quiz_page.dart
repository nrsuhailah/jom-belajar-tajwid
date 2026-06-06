import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'quiz_data.dart';
import 'quiz_module_grid.dart';
import 'quiz_rule.dart';
import 'quiz_content_screen.dart';
import 'quiz_result_screen.dart';
import '../l10n/string_quiz.dart';
import '../database/database_helper.dart';
import '../l10n/locale_provider.dart';
import 'package:provider/provider.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});
  @override
  QuizPageState createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> with RouteAware {
  // ── Navigation state ──
  String? _selectedModule;
  bool _showRuleCard = false;

  // ── Quiz state ──
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _isQuizFinished = false;
  bool _isMuted = false;

  // ── Answer feedback state ──
  int? _selectedAnswerIndex;
  int? _correctAnswerIndex;
  bool _hasAnswered = false;

  // ── Controllers ──
  final AudioPlayer _bgMusicPlayer = AudioPlayer();
  final AudioPlayer _sfxPlayer = AudioPlayer();
  final _quizData = QuizData.data;

  // ── Soalan yang dah di-shuffle ──
  List<Map<String, dynamic>> _shuffledQuestions = [];

  // ── Streak / XP ──
  int _streakDays = 0;
  int _totalXp = 0;

  static const String _muteKey = 'quiz_is_muted';

  @override
  void initState() {
    super.initState();
    _loadStats();
    _loadMuteState();
  }

  @override
  void dispose() {
    _bgMusicPlayer.stop();
    _bgMusicPlayer.dispose();
    _sfxPlayer.dispose();
    super.dispose();
  }

  Future<void> _loadMuteState() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getBool(_muteKey) ?? false;
    if (!mounted) return;
    setState(() => _isMuted = saved);
  }

  Future<void> _saveMuteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_muteKey, value);
  }

  Future<void> _loadStats() async {
    final streakDays = await DatabaseHelper.instance.getSettingInt('streak_days');
    final totalXp    = await DatabaseHelper.instance.getTotalXp();
    if (!mounted) return;
    setState(() {
      _streakDays = streakDays;
      _totalXp    = totalXp;
    });
  }

  Future<void> _saveQuizResult() async {
    final isEn = context.read<LocaleProvider>().isEn;
    final str  = SQuiz(isEn);
    final xpEarned = _score * 10;
    await DatabaseHelper.instance.insertQuizResult(
      tajwidBab: _selectedModule ?? str.unknownModule,
      score:     _score,
      total:     _shuffledQuestions.length,
      xpEarned:  xpEarned,
    );

    if (_selectedModule != null) {
      await DatabaseHelper.instance.insertModulSelesai(_selectedModule!);
    }

    await DatabaseHelper.instance.updateStreak();

    final newXp = await DatabaseHelper.instance.getTotalXp();
    final newStreak = await DatabaseHelper.instance.getSettingInt('streak_days');

    if (mounted) {
      
    } setState(() {
    _totalXp    = newXp;
    _streakDays = newStreak;
  });
}

 
  List<Map<String, dynamic>> _shuffleQuestions(String module) {
    final original = _quizData[module]!;

    final shuffled = original.map((q) {
      final answers       = List<String>.from(q['answers'] as List);
      final correctAnswer = answers[q['correctIndex'] as int];

      answers.shuffle();

      return <String, dynamic>{
        ...q,
        'answers':      answers,
        'correctIndex': answers.indexOf(correctAnswer),
      };
    }).toList();

    shuffled.shuffle();
    return shuffled;
  }

  // ── AUDIO ──
  Future<void> _startBgMusic() async {
    if (_isMuted) return;
    await _bgMusicPlayer.stop();
    await _bgMusicPlayer.setReleaseMode(ReleaseMode.loop);
    await _bgMusicPlayer.setVolume(0.4);
    await _bgMusicPlayer.play(AssetSource('sounds/quiz_bgm.mp3'));
  }

  Future<void> _stopBgMusic() async => await _bgMusicPlayer.stop();

  Future<void> _toggleMute() async {
    final newMuted = !_isMuted;
    setState(() => _isMuted = newMuted);
    await _saveMuteState(newMuted);
    if (newMuted) {
      await _bgMusicPlayer.setVolume(0.0);
    } else {
      await _bgMusicPlayer.setVolume(0.4);
      if (_bgMusicPlayer.state == PlayerState.stopped) await _startBgMusic();
    }
  }

  Future<void> _playSound(bool isCorrect) async {
    if (_isMuted) return;
    await _sfxPlayer.stop();
    await _sfxPlayer.play(
        AssetSource(isCorrect ? 'sounds/correct.mp3' : 'sounds/wrong.mp3'));
  }

  void _answerQuestion(int selectedIndex) {
    if (_hasAnswered) return;
    final correctIdx = _shuffledQuestions[_currentQuestionIndex]['correctIndex'] as int;
    final isCorrect  = selectedIndex == correctIdx;
    _playSound(isCorrect);
    if (isCorrect) _score++;
    setState(() {
      _hasAnswered         = true;
      _selectedAnswerIndex = selectedIndex;
      _correctAnswerIndex  = correctIdx;
    });
  }

  void _nextQuestion() {
    setState(() {
      _hasAnswered         = false;
      _selectedAnswerIndex = null;
      _correctAnswerIndex  = null;
      if (_currentQuestionIndex < _shuffledQuestions.length - 1) {
        _currentQuestionIndex++;
      } else {
        _isQuizFinished = true;
        _stopBgMusic();
        _saveQuizResult();
      }
    });
  }


  void _previousQuestion() {
    if (_currentQuestionIndex <= 0) return;
    setState(() {
      _currentQuestionIndex--;
      _hasAnswered         = false;
      _selectedAnswerIndex = null;
      _correctAnswerIndex  = null;
    });
  }

  void _selectModule(String module) {
    final shuffled = _shuffleQuestions(module);
    setState(() {
      _selectedModule       = module;
      _shuffledQuestions    = shuffled;
      _showRuleCard         = true;
      _currentQuestionIndex = 0;
      _score                = 0;
      _hasAnswered          = false;
      _selectedAnswerIndex  = null;
      _correctAnswerIndex   = null;
      _isQuizFinished       = false;
    });
  }

  void _startQuizFromRuleCard() {
    setState(() => _showRuleCard = false);
    _startBgMusic();
  }

  void _resetQuiz() {
    _stopBgMusic();
    setState(() {
      _isQuizFinished       = false;
      _selectedModule       = null;
      _showRuleCard         = false;
      _currentQuestionIndex = 0;
      _score                = 0;
      _hasAnswered          = false;
      _selectedAnswerIndex  = null;
      _correctAnswerIndex   = null;
      _shuffledQuestions    = [];
    });
  }

  void _retryQuiz() {
    if (_selectedModule == null) return;
    final reshuffled = _shuffleQuestions(_selectedModule!);
    _stopBgMusic();
    setState(() {
      _isQuizFinished       = false;
      _showRuleCard         = false;
      _currentQuestionIndex = 0;
      _score                = 0;
      _hasAnswered          = false;
      _selectedAnswerIndex  = null;
      _correctAnswerIndex   = null;
      _shuffledQuestions    = reshuffled;
    });
    _startBgMusic();
  }

  void resetToModuleGrid() {
    _resetQuiz();
  }

  bool handleBackPress() {
    if (_isQuizFinished) {
      _resetQuiz();
      return true;
    }
    if (!_showRuleCard && _selectedModule != null) {
      _stopBgMusic();
      setState(() => _showRuleCard = true);
      return true;
    }
    if (_showRuleCard) {
      setState(() {
        _showRuleCard   = false;
        _selectedModule = null;
      });
      return true;
    }
    return false;
  }

  String? get _currentExplanation {
    if (_shuffledQuestions.isEmpty) return null;
    if (_currentQuestionIndex >= _shuffledQuestions.length) return null;
    return _shuffledQuestions[_currentQuestionIndex]['explanation'] as String?;
  }

  String _ruleDescription(String module, bool isEn) {
    final questions = _quizData[module];
    if (questions == null || questions.isEmpty) return '';
    final raw = questions.first['ruleDescription'] as String? ?? '';
    return SQuiz(isEn).translateRuleDesc(raw);
  }

  String _arabicExample(String module) {
    final questions = _quizData[module];
    if (questions == null || questions.isEmpty) return '';
    return questions.first['arabicExample'] as String? ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final displayData = _selectedModule != null && _shuffledQuestions.isNotEmpty
        ? {_selectedModule!: _shuffledQuestions}
        : _quizData;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background_4.jpg',
              fit: BoxFit.cover,
            ),
          ),
          if (_isQuizFinished)
            QuizResultScreen(
              selectedModule: _selectedModule ?? '',
              score: _score,
              totalQuestions: _shuffledQuestions.length,
              onBack: _resetQuiz,
              onRetry: _retryQuiz,
            )
          else if (_selectedModule == null)
            QuizModuleGrid(
              quizData: _quizData,
              onModuleSelected: _selectModule,
              streakDays: _streakDays,
              totalXp: _totalXp,
            )
          else if (_showRuleCard)
            ModuleRuleCard(
              moduleName: _selectedModule!,
              arabicExample: _arabicExample(_selectedModule!),
              ruleDescriptionBuilder: _ruleDescription,
              onStart: _startQuizFromRuleCard,
            )
          else
            SafeArea(
              bottom: false,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom),
                child: QuizContentScreen(
                  selectedModule: _selectedModule!,
                  quizData: displayData,
                  currentIndex: _currentQuestionIndex,
                  isMuted: _isMuted,
                  onAnswer: _answerQuestion,
                  onToggleMute: _toggleMute,
                  onNext: _nextQuestion,
                  onPrevious: _previousQuestion, // ← BARU
                  selectedAnswerIndex: _selectedAnswerIndex,
                  correctAnswerIndex: _correctAnswerIndex,
                  answerExplanation: _currentExplanation,
                ),
              ),
            ),
        ],
      ),
    );
  }
}