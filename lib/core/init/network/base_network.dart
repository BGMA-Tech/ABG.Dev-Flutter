import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

class BaseNetwork {
  late final INetworkManager networkManager;
  late BuildContext context;

  final String baseUrl = 'http://localhost:8080/api/';

  BaseNetwork() {
    networkManager = _mainNetworkManager();
  }

  NetworkManager _mainNetworkManager() {
    return NetworkManager(
      options: BaseOptions(
        headers: {'accept-language': 'tr'},
        baseUrl: baseUrl,
        contentType: ContentType.json.value,
      ),
    );
  }
}
