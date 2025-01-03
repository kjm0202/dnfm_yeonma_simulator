import 'package:flutter/material.dart';

class RootView extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const RootView({
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
              height: MediaQuery.of(context).size.height * 0.5,
              child: MediaQuery.of(context).size.width > 1280
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(isDarkMode
                                        ? 'assets/photos/venom_4.png' // 다크모드 이미지
                                        : 'assets/photos/anti_venom_1.png' // 라이트모드 이미지
                                    ),
                                fit: BoxFit.contain,
                              ),
                            ),
                            child: Container(
                              color: Colors.black
                                  .withOpacity(0.25), // 반투명 검정색 오버레이
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(isDarkMode
                                        ? 'assets/photos/venom_2.webp' // 다크모드 이미지
                                        : 'assets/photos/anti_venom_3.webp' // 라이트모드 이미지
                                    ),
                                fit: BoxFit.contain,
                              ),
                            ),
                            child: Container(
                              color: Colors.black
                                  .withOpacity(0.25), // 반투명 검정색 오버레이
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
                                      '베놈의 작은 놀이터',
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 40),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushNamed('/yeonma');
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
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(isDarkMode
                                        ? 'assets/photos/venom_1.png' // 다크모드 이미지
                                        : 'assets/photos/anti_venom_4.png' // 라이트모드 이미지
                                    ),
                                fit: BoxFit.contain,
                              ),
                            ),
                            child: Container(
                              color: Colors.black
                                  .withOpacity(0.25), // 반투명 검정색 오버레이
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(isDarkMode
                                  ? 'assets/photos/venom_4.png' // 다크모드 이미지
                                  : 'assets/photos/anti_venom_1.png' // 라이트모드 이미지
                              ),
                          fit: BoxFit.contain,
                        ),
                      ),
                      child: Container(
                        color: Colors.black.withOpacity(0.2), // 반투명 검정색 오버레이
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
                                '베놈의 작은 놀이터',
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
