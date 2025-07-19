import 'package:flutter/material.dart';

class TranslateBox extends StatelessWidget {
  const TranslateBox({
    super.key,
    required this.icons,
    this.onChanged,
    this.onSubmitted,
    this.labelText,
    required this.isTextField,
    this.translatedText,
    this.controller,
  });

  final List<IconButton> icons;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final String? labelText;
  final bool isTextField;
  final String? translatedText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isTextField
              ? TextField(
                  textInputAction: TextInputAction.done,
                  onChanged: onChanged,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    labelText: labelText ?? 'Texto a ser traduzido',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(16),
                  ),
                  controller: controller,
                  onSubmitted: onSubmitted,
                )
              : Padding(padding: const EdgeInsets.all(16), child: Text(translatedText ?? 'Tradução')),

          Spacer(),
          Divider(indent: 10, endIndent: 10),

          Row(spacing: 20, mainAxisAlignment: MainAxisAlignment.end, children: icons),
        ],
      ),
    );
  }
}
