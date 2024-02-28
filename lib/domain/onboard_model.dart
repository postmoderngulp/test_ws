import 'package:flutter/material.dart';
import 'package:test_ws/entity/board.dart';
import 'package:test_ws/presentation/Home.dart';
import 'package:test_ws/repository/queue_save.dart';

class OnBoardModel extends ChangeNotifier {
  Board? item;
  OnBoardModel(BuildContext context) {
    _setup(context);
  }

  void _setup(BuildContext context) async {
    QueueSave queueSave = QueueSave();
    final list = await queueSave.download('queue');
    if (list == null) {
      final boardList = [
        Board(
            title: 'Quick Delivery At Your Doorstep',
            subTitle: 'Enjoy quick pick-up and delivery to your destination',
            width: 346,
            height: 346,
            path: 'first_board'),
        Board(
            title: 'Flexible Payment',
            subTitle:
                'Different modes of payment either before and after delivery without stress',
            width: 346,
            height: 346,
            path: 'second_board'),
        Board(
            title: 'Real-time Tracking',
            subTitle:
                'Track your packages/items from the comfort of your home till final destination',
            width: 346,
            height: 346,
            path: 'third_board'),
      ];
      List<String> boards = [];
      for (int i = 0; i < boardList.length; i++) {
        boards.add(boardList[i].toJson());
      }
      await queueSave.load(boards, 'queue');
      _setup(context);
    } else if (list.isEmpty) {
      signUp(context);
    } else {
      item = Board.fromJson(list.first);
      notifyListeners();
      list.remove(list.first);
      await queueSave.load(list, 'queue');
    }
  }

  void next(BuildContext context) async {
    _setup(context);
  }

  void signUp(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const Home()));
  }

  skip(BuildContext context) async {
    QueueSave queueSave = QueueSave();
    final list = await queueSave.download('queue');
    if (list != null) {
      await queueSave.load([list.last], 'queue');
      _setup(context);
    }
  }
}