import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class TrackModel extends ChangeNotifier {
    final mapController = Completer<YandexMapController>();
}