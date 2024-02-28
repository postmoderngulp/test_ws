// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_ws/entity/Board.dart';
import 'package:test_ws/repository/queue_save.dart';

void main() async {
  SharedPreferences.setMockInitialValues({});

  test('Изображение и текста из очереди извлекается правильно', () async {
    QueueSave queueSave = QueueSave();
    final queue = [
      Board(
          title: 'Real-time Trackinggg',
          subTitle:
              'Track your packages/items from the comfort of your home till final destination',
          path: 'third_board',
          width: 300,
          height: 150),
    ];
    List<String> supportQueue = [];
    queue.forEach((element) {
      supportQueue.add(element.toJson());
    });
    await queueSave.load(supportQueue, 'queue');
    supportQueue = (await queueSave.download('queue'))!;
    Board el = Board.fromJson(supportQueue.first);
    supportQueue.remove(supportQueue.first);
    await queueSave.load(supportQueue, 'queue');
    expect(
      el,
      Board(
          title: 'Real-time Tracking',
          subTitle:
              'Track your packages/items from the comfort of your home till final destination',
          path: 'third_board',
          width: 300,
          height: 150),
    );
  });

  test('Корректное извлечение элементов из очереди', () async {
    QueueSave queueSave = QueueSave();
    final queue = [
      Board(
          title: 'Real-time Tracking',
          subTitle:
              'Track your packages/items from the comfort of your home till final destination',
          path: 'third_board',
          width: 300,
          height: 150),
    ];
    List<String> supportQueue = [];
    queue.forEach((element) {
      supportQueue.add(element.toJson());
    });
    await queueSave.load(supportQueue, 'queue');
    supportQueue = (await queueSave.download('queue'))!;
    supportQueue.remove(supportQueue.first);
    queueSave.load(supportQueue, 'queue');
    expect(supportQueue.length, 0);
  });
}
