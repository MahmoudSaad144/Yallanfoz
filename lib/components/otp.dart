import 'package:flutter/material.dart';

class OtpDialog extends StatefulWidget {
  final void Function(String) onCompleted;
  const OtpDialog({required this.onCompleted, super.key});

  @override
  State<OtpDialog> createState() => _OtpDialogState();
}

class _OtpDialogState extends State<OtpDialog> {
  final int fieldsCount = 6;
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(fieldsCount, (_) => TextEditingController());
    _focusNodes = List.generate(fieldsCount, (_) => FocusNode());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNodes[0]);
    });
  }

  @override
  void dispose() {
    for (var c in _controllers) c.dispose();
    for (var f in _focusNodes) f.dispose();
    super.dispose();
  }

  void _onFieldChanged(String value, int index) {
    if (value.length == 1) {
      if (index + 1 < fieldsCount) {
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      } else {
        String code = _controllers.map((c) => c.text).join();
        widget.onCompleted(code);
      }
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.all(0),
      actionsPadding: EdgeInsets.only(bottom: 10, top: 2, left: 5, right: 5),
      backgroundColor: Color(0xFF1E1E2F),
      title: Text(
        'أدخل رمز التحقق',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      content: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(fieldsCount, (i) {
              return Container(
                width: 50,
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: TextField(
                    controller: _controllers[i],
                    focusNode: _focusNodes[i],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.03,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      counterText: '',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFfff5e1)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 208, 114, 151),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (val) => _onFieldChanged(val, i),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('إلغاء', style: TextStyle(color: Color(0xFFF4A300))),
        ),
      ],
    );
  }
}
