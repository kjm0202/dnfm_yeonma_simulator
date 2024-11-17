import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:intl/intl.dart';
import 'data.dart';

class EnhanceSimulator extends StatefulWidget {
  final bool isDarkMode;
  final Function(bool) onDarkModeChanged;

  const EnhanceSimulator({
    super.key,
    this.isDarkMode = false,
    required this.onDarkModeChanged,
  });

  @override
  State<EnhanceSimulator> createState() => _EnhanceSimulatorState();
}

class _EnhanceSimulatorState extends State<EnhanceSimulator> {
  // 상태 변수들
  int currentStage = 0;
  int targetStage = 10;
  bool autoEnhancing = false;
  Timer? autoEnhanceTimer;
  final TextEditingController _targetController = TextEditingController();

  // 통계 변수들
  int highestStage = 0;
  int failCount = 0;
  int destroyCount = 0;
  int failSystemCount = 0;

  // 재화 사용량 변수들
  int totalStoneUsed = 0;
  int totalCatalystsUsed = 0;
  int totalSangrakoUsed = 0;
  int totalGoldUsed = 0;

  // 결과 메시지 변수들
  String resultMessage = '';
  Color resultColor = Colors.black;

  @override
  void dispose() {
    autoEnhanceTimer?.cancel();
    _targetController.dispose();
    super.dispose();
  }

  // 스테이지 데이터 가져오기
  Map<String, dynamic> getStageData() {
    if (failSystemCount == 2) {
      return stages2[currentStage];
    } else if (failSystemCount == 1) {
      return stages1[currentStage];
    }
    return stages[currentStage];
  }

  // 연마 기능
  void enhance() {
    if (currentStage >= targetStage) return;

    final stageData = getStageData();
    final random = Random().nextDouble() * 100;
    double currentProb = 0;

    setState(() {
      // 재화 소모 업데이트
      totalStoneUsed += stageData[stone] as int;
      totalCatalystsUsed += stageData[catalysts] as int;
      totalSangrakoUsed += stageData[sangrako] as int;
      totalGoldUsed += stageData[gold] as int;

      // 결과 처리
      if (random < (currentProb += stageData[success] as num)) {
        currentStage++;
        if (currentStage > highestStage) highestStage = currentStage;
        resultMessage = '성공! $currentStage단계로 이동했습니다.';
        resultColor = Colors.blue;
        failSystemCount = 0;
      } else if (random < (currentProb += stageData[maintain] as num)) {
        resultMessage = '유지!';
        resultColor = Colors.green;
      } else if (random < (currentProb += stageData[fail] as num)) {
        currentStage--;
        failCount++;
        resultMessage = '실패!';
        resultColor = Colors.orange;
        if (failSystemCount < 2) failSystemCount++;
      } else {
        currentStage = 0;
        destroyCount++;
        resultMessage = '파괴되었습니다!';
        resultColor = Colors.red;
        failSystemCount = 0;
      }
    });
  }

  // 자동 연마 토글
  void toggleAutoEnhance() {
    setState(() {
      autoEnhancing = !autoEnhancing;
      if (autoEnhancing) {
        autoEnhanceTimer = Timer.periodic(
          const Duration(milliseconds: 100),
          (timer) {
            enhance();
            if (currentStage >= targetStage) {
              timer.cancel();
              setState(() {
                autoEnhancing = false;
              });
            }
          },
        );
      } else {
        autoEnhanceTimer?.cancel();
      }
    });
  }

  // 비용 계산
  String calculateTotalCost() {
    final totalSeraFromStone = totalStoneUsed * 417;
    final totalSeraFromCatalysts = totalCatalystsUsed * 2917;
    final totalSeraFromSangrako = totalSangrakoUsed * 417;
    final totalSeraFromGold = (totalGoldUsed / 2400).floor();
    return (totalSeraFromStone +
            totalSeraFromCatalysts +
            totalSeraFromSangrako +
            totalSeraFromGold)
        .toString();
  }

  // 리셋 기능
  void _resetAll() {
    setState(() {
      currentStage = 0;
      totalStoneUsed = 0;
      totalCatalystsUsed = 0;
      totalSangrakoUsed = 0;
      totalGoldUsed = 0;
      highestStage = 0;
      failCount = 0;
      destroyCount = 0;
      failSystemCount = 0;
      resultMessage = '';
      resultColor = Colors.black;
      autoEnhancing = false;
      autoEnhanceTimer?.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('연마 시뮬레이터 V4'),
        backgroundColor: widget.isDarkMode ? Colors.grey[900] : Colors.white,
        actions: [
          IconButton(
            icon: Icon(
              widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: widget.isDarkMode ? Colors.yellow : Colors.white,
            ),
            onPressed: () {
              widget.onDarkModeChanged(!widget.isDarkMode);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(maxWidth: 720), // 최대 가로 길이 설정
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 24),
                    _buildStatusCard(),
                    const SizedBox(height: 16),
                    _buildMaterialsCard(),
                    const SizedBox(height: 24),
                    _buildButtons(),
                    const SizedBox(height: 24),
                    _buildUsageStats(),
                    const SizedBox(height: 16),
                    _buildNotice(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          '연마 시뮬레이터 V4',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: widget.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '현재 연마 수치: $currentStage',
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  Widget _buildStatusCard() {
    final stageData = getStageData();
    return Card(
      elevation: 4,
      color: widget.isDarkMode ? Colors.grey[850] : Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
                '확률 - 성공: ${stageData[success] as num}%, 유지: ${stageData[maintain] as num}%, '
                '실패: ${stageData[fail] as num}%, 파괴: ${stageData[destroy] as num}%'),
            SizedBox(
              height: 24, // 고정된 높이 설정
              child: Center(
                child: failSystemCount > 0
                    ? Text(
                        '확률 하락 방지 시스템 ${failSystemCount}단계 적용 중',
                        style: const TextStyle(color: Colors.orange),
                      )
                    : null,
              ),
            ),
            Text(resultMessage, style: TextStyle(color: resultColor)),
          ],
        ),
      ),
    );
  }

  Widget _buildMaterialsCard() {
    final stageData = getStageData();
    return Card(
      elevation: 4,
      color: widget.isDarkMode ? Colors.grey[850] : Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildMaterialItem('연마석', stageData[stone].toString()),
            _buildMaterialItem('촉매제', stageData[catalysts].toString()),
            _buildMaterialItem('상급 라이언 코크스', stageData[sangrako].toString()),
            _buildMaterialItem(
                '골드', NumberFormat('#,###').format(stageData[gold])),
          ],
        ),
      ),
    );
  }

  Widget _buildMaterialItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            controller: _targetController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: '목표 단계',
              hintText: '1-10 사이의 숫자를 입력하세요',
            ),
            onChanged: (value) {
              final stage = int.tryParse(value);
              if (stage != null && stage >= 1 && stage <= 10) {
                setState(() {
                  targetStage = stage;
                });
              }
            },
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: enhance,
              child: const Text('연마'),
            ),
            ElevatedButton(
              onPressed: toggleAutoEnhance,
              child: Text(autoEnhancing ? '자동연마 중지' : '자동연마'),
            ),
            ElevatedButton(
              onPressed: _resetAll,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('리셋', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildUsageStats() {
    return Card(
      elevation: 4,
      color: widget.isDarkMode ? Colors.grey[850] : Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('현재까지 소모된 재화',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(
                '연마석: ${NumberFormat('#,###').format(totalStoneUsed)} (${NumberFormat('#,###').format(totalStoneUsed * 417)}원)'),
            Text(
                '촉매제: ${NumberFormat('#,###').format(totalCatalystsUsed)} (${NumberFormat('#,###').format(totalCatalystsUsed * 2917)}원)'),
            Text(
                '상급 라이언 코크스: ${NumberFormat('#,###').format(totalSangrakoUsed)} (${NumberFormat('#,###').format(totalSangrakoUsed * 417)}원)'),
            Text(
                '골드: ${NumberFormat('#,###').format(totalGoldUsed)} (${NumberFormat('#,###').format((totalGoldUsed / 2400).floor())}원)'),
            const Divider(),
            Text(
              '💸 현재까지 사용된 현금: 약 ${NumberFormat('#,###').format(int.parse(calculateTotalCost()))}원',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('실패한 횟수: $failCount, 파괴된 횟수: $destroyCount'),
            Text('현재까지 성공한 가장 높은 연마 단계: $highestStage'),
          ],
        ),
      ),
    );
  }

  Widget _buildNotice() {
    return Card(
      color: widget.isDarkMode ? Colors.grey[850] : Colors.grey[100],
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            Text('촉매제 70,000테라 / 연마석 10,000테라'),
            Text('세라:테라 = 1:24 / 테라:골드 = 1:100(골드깡)'),
          ],
        ),
      ),
    );
  }
}
