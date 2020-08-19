import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:nextline/utils/app_session.dart';

import '../repository_home.dart';

class BlocHome implements Bloc {
  final RepositoryHome repository = RepositoryHome();

  final StreamController<int> _streamController =
      StreamController<int>.broadcast();

  Sink<int> get idUsuario => _streamController.sink;
  Stream<Map<String, dynamic>> get responseDataHome =>
      _streamController.stream.asyncMap((idUsuario) => _getDataHome());

  Future<Map<String, dynamic>> _getDataHome() async {
    if (AppSession.data.esCliente) {
      return await repository.getDataHomeAPI('admon/contratos-status');
    } else {
      return await repository.getDataHomeAPI('solicitud/contratos-status');
    }
  }

  @override
  void dispose() {
    _streamController.close();
  }
}
