// 상수 정의
const String success = 'success';
const String maintain = 'maintain';
const String fail = 'fail';
const String destroy = 'destroy';
const String catalysts = 'catalysts';
const String sangrako = 'sangrako';
const String gold = 'gold';
const String stone = 'stone';

// 스테이지 데이터
final List<Map<String, dynamic>> stages = [
  {
    success: 45,
    maintain: 55,
    fail: 0,
    destroy: 0,
    catalysts: 2,
    sangrako: 3,
    gold: 6200000,
    stone: 99
  }, // 0->1
  {
    success: 30,
    maintain: 40,
    fail: 30,
    destroy: 0,
    catalysts: 2,
    sangrako: 3,
    gold: 7502000,
    stone: 116
  }, // 1->2
  {
    success: 20,
    maintain: 50,
    fail: 30,
    destroy: 0,
    catalysts: 2,
    sangrako: 4,
    gold: 9002340,
    stone: 135
  }, // 2->3
  {
    success: 20,
    maintain: 45,
    fail: 30,
    destroy: 5,
    catalysts: 3,
    sangrako: 4,
    gold: 10427000,
    stone: 157
  }, // 3->4
  {
    success: 17,
    maintain: 44,
    fail: 30,
    destroy: 9,
    catalysts: 3,
    sangrako: 5,
    gold: 12254000,
    stone: 177
  }, // 4->5
  {
    success: 15,
    maintain: 42,
    fail: 30,
    destroy: 13,
    catalysts: 3,
    sangrako: 5,
    gold: 13979000,
    stone: 200
  }, // 5->6
  {
    success: 10,
    maintain: 60,
    fail: 0,
    destroy: 30,
    catalysts: 4,
    sangrako: 6,
    gold: 15806000,
    stone: 220
  }, // 6->7
  {
    success: 7,
    maintain: 53,
    fail: 0,
    destroy: 40,
    catalysts: 4,
    sangrako: 6,
    gold: 17781000,
    stone: 241
  }, // 7->8
  {
    success: 3,
    maintain: 37,
    fail: 0,
    destroy: 60,
    catalysts: 4,
    sangrako: 7,
    gold: 19881000,
    stone: 263
  }, // 8->9
  {
    success: 1,
    maintain: 29,
    fail: 0,
    destroy: 70,
    catalysts: 5,
    sangrako: 7,
    gold: 22136000,
    stone: 283
  } // 9->10
];

final List<Map<String, dynamic>> stages1 = [
  {
    success: 45,
    maintain: 55,
    fail: 0,
    destroy: 0,
    catalysts: 2,
    sangrako: 3,
    gold: 6200000,
    stone: 99
  }, // 0->1
  {
    success: 30,
    maintain: 50,
    fail: 20,
    destroy: 0,
    catalysts: 2,
    sangrako: 3,
    gold: 7502000,
    stone: 116
  }, // 1->2
  {
    success: 20,
    maintain: 60,
    fail: 20,
    destroy: 0,
    catalysts: 2,
    sangrako: 4,
    gold: 9002340,
    stone: 135
  }, // 2->3
  {
    success: 20,
    maintain: 55,
    fail: 20,
    destroy: 5,
    catalysts: 3,
    sangrako: 4,
    gold: 10427000,
    stone: 157
  }, // 3->4
  {
    success: 17,
    maintain: 54,
    fail: 20,
    destroy: 9,
    catalysts: 3,
    sangrako: 5,
    gold: 12254000,
    stone: 177
  }, // 4->5
  {
    success: 15,
    maintain: 52,
    fail: 20,
    destroy: 13,
    catalysts: 3,
    sangrako: 5,
    gold: 13979000,
    stone: 200
  }, // 5->6
  {
    success: 10,
    maintain: 60,
    fail: 0,
    destroy: 30,
    catalysts: 4,
    sangrako: 6,
    gold: 15806000,
    stone: 220
  }, // 6->7
  {
    success: 7,
    maintain: 53,
    fail: 0,
    destroy: 40,
    catalysts: 4,
    sangrako: 6,
    gold: 17781000,
    stone: 241
  }, // 7->8
  {
    success: 3,
    maintain: 37,
    fail: 0,
    destroy: 60,
    catalysts: 4,
    sangrako: 7,
    gold: 19881000,
    stone: 263
  }, // 8->9
  {
    success: 1,
    maintain: 29,
    fail: 0,
    destroy: 70,
    catalysts: 5,
    sangrako: 7,
    gold: 22136000,
    stone: 283
  } // 9->10
];

final List<Map<String, dynamic>> stages2 = [
  {
    success: 45,
    maintain: 55,
    fail: 0,
    destroy: 0,
    catalysts: 2,
    sangrako: 3,
    gold: 6200000,
    stone: 99
  }, // 0->1
  {
    success: 30,
    maintain: 70,
    fail: 0,
    destroy: 0,
    catalysts: 2,
    sangrako: 3,
    gold: 7502000,
    stone: 116
  }, // 1->2
  {
    success: 20,
    maintain: 80,
    fail: 0,
    destroy: 0,
    catalysts: 2,
    sangrako: 4,
    gold: 9002340,
    stone: 135
  }, // 2->3
  {
    success: 20,
    maintain: 75,
    fail: 0,
    destroy: 5,
    catalysts: 3,
    sangrako: 4,
    gold: 10427000,
    stone: 157
  }, // 3->4
  {
    success: 17,
    maintain: 74,
    fail: 0,
    destroy: 9,
    catalysts: 3,
    sangrako: 5,
    gold: 12254000,
    stone: 177
  }, // 4->5
  {
    success: 15,
    maintain: 72,
    fail: 0,
    destroy: 13,
    catalysts: 3,
    sangrako: 5,
    gold: 13979000,
    stone: 200
  }, // 5->6
  {
    success: 10,
    maintain: 60,
    fail: 0,
    destroy: 30,
    catalysts: 4,
    sangrako: 6,
    gold: 15806000,
    stone: 220
  }, // 6->7
  {
    success: 7,
    maintain: 53,
    fail: 0,
    destroy: 40,
    catalysts: 4,
    sangrako: 6,
    gold: 17781000,
    stone: 241
  }, // 7->8
  {
    success: 3,
    maintain: 37,
    fail: 0,
    destroy: 60,
    catalysts: 4,
    sangrako: 7,
    gold: 19881000,
    stone: 263
  }, // 8->9
  {
    success: 1,
    maintain: 29,
    fail: 0,
    destroy: 70,
    catalysts: 5,
    sangrako: 7,
    gold: 22136000,
    stone: 283
  } // 9->10
];
