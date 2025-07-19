
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/translation/presentation/providers/services/services.dart';

class ClipboardService {

  static Future<void> copyToClipboard(String text) async {
    if(text.isEmpty) return ;

    FlutterClipboard.copy(text).then((value) {
     MessageService.showMessage('Texto copiado para a área de transferência', color: Colors.green);
    }).catchError((error) {
      MessageService.showMessage('Erro ao copiar para a área de transferência: $error', color: Colors.red);
    });
  }
}
