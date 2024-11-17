import 'package:flutter/material.dart';
import 'yeonma.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  void toggleDarkMode(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '클린타르',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.notoSansKrTextTheme(
          isDarkMode
              ? ThemeData.dark().textTheme // 다크모드일 때는 dark 테마의 textTheme 사용
              : ThemeData.light().textTheme, // 라이트모드일 때는 light 테마의 textTheme 사용
        ),
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        scaffoldBackgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
        cardTheme: CardTheme(
          color: isDarkMode ? Colors.grey[850] : Colors.white,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      onGenerateRoute: (settings) {
        if (settings.name == '/yeonma') {
          return MaterialPageRoute(
            builder: (context) => EnhanceSimulator(
              isDarkMode: isDarkMode,
              onDarkModeChanged: toggleDarkMode,
            ),
          );
        }
        return MaterialPageRoute(
          builder: (context) => HomePage(
            isDarkMode: isDarkMode,
            onThemeToggle: () {
              setState(() {
                isDarkMode = !isDarkMode;
              });
            },
          ),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const HomePage({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                isDarkMode ? Icons.light_mode : Icons.dark_mode,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              onPressed: onThemeToggle,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 헤더 섹션
            Container(
              height: 400,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: isDarkMode
                      ? [Color(0xFF2C3E50), Color(0xFF3498DB)]
                      : [Color(0xFF6B8DE3), Color(0xFF8B9FE3)],
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '환영합니다',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      '베놈의 Flutter 놀이터',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/yeonma');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 20,
                        ),
                      ),
                      child: const Text(
                        '시작하기',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF6B8DE3),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 특징 섹션
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
              child: Wrap(
                spacing: 40,
                runSpacing: 40,
                alignment: WrapAlignment.center,
                children: [
                  _buildFeatureCard(
                    icon: Icons.brush,
                    title: '모던한 디자인',
                    description: '현대적이고 세련된 디자인으로\n사용자 경험을 향상시킵니다.',
                    isDarkMode: isDarkMode,
                  ),
                  _buildFeatureCard(
                    icon: Icons.speed,
                    title: '빠른 성능',
                    description: '최적화된 성능으로\n쾌적한 사용성을 제공합니다.',
                    isDarkMode: isDarkMode,
                  ),
                  _buildFeatureCard(
                    icon: Icons.devices,
                    title: '반응형 디자인',
                    description: '모든 디바이스에서\n완벽하게 작동합니다.',
                    isDarkMode: isDarkMode,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
    required bool isDarkMode,
  }) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: isDarkMode
                ? Colors.black.withOpacity(0.3)
                : Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon,
              size: 50,
              color: isDarkMode ? Colors.white : const Color(0xFF6B8DE3)),
          const SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: isDarkMode ? Colors.grey[300] : Colors.grey,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
