import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinityfree/design/alternative_text_style.dart';
import 'view/yeonma_simulator_view.dart';
import 'view/root_view.dart'; // Import the new home_page.dart file
// import 'package:google_fonts/google_fonts.dart';
// import 'package:url_strategy/url_strategy.dart';

void main() async {
  // setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();

  // 폰트 로드
  final fontLoader = FontLoader('PretendardVariable');
  fontLoader.addFont(rootBundle.load('assets/fonts/PretendardVariable.woff2'));
  await fontLoader.load();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    // 다크 모드 여부를 확인하여 기본값 설정
    isDarkMode =
        WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
  }

  void toggleDarkMode(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 현재 URL 경로 가져오기
    final uri = Uri.parse(Uri.base.toString());
    final initialRoute = (uri.path == '/yeonma') ? '/yeonma' : '/';

    return MaterialApp(
      title: '클린타르',
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute, // 초기 라우트 설정
      routes: {
        '/': (context) => RootView(
              isDarkMode: isDarkMode,
              onThemeToggle: () {
                setState(() {
                  isDarkMode = !isDarkMode;
                });
              },
            ),
        '/yeonma': (context) => YeonmaSimulatorView(
              isDarkMode: isDarkMode,
              onDarkModeChanged: toggleDarkMode,
            ),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        scaffoldBackgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
        cardTheme: CardTheme(
          color: isDarkMode ? Colors.grey[850] : Colors.white,
        ),
        textTheme: AltTextStyle.textTheme,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
