import 'package:environment_hackaton/utils/app_library.dart';
import 'package:flutter/material.dart';

class InitialsTextField extends StatefulWidget {
  const InitialsTextField({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InitialsTextFieldState createState() => _InitialsTextFieldState();
}

class _InitialsTextFieldState extends State<InitialsTextField> {
  final _initialsController = TextEditingController();
  final _blacklist = [
    'FUK',
    'FUC',
    'COK',
    'DIK',
    'KKK',
    'SHT',
    'CNT',
    'ASS',
    'CUM',
    'FAG',
    'SEX',
    'TIT',
    'WTF',
    'RAP',
    'POO',
    'PIS',
    'COX',
    'CBT',
    'BBC',
    'FGT',
    'GAY',
    'GOD',
    'GYP',
    'HOR',
    'JAP',
    'JIG',
    'KIK',
    'LES',
    'MUT',
    'NIG',
    'NIP',
    'PED',
    'PIG',
    'POV',
    'PRN',
    'PCK',
    'RAC',
    'RET',
    'RIO',
    'SLT',
    'SPI',
    'SPK',
    'TRD',
    'TWA',
    'WAG',
    'WHR',
    'WOP',
    'XXX',
  ];

  String _errorText = '';

  @override
  void dispose() {
    _initialsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _initialsController,
      decoration: InputDecoration(
        labelText: 'Enter 3 Initials',
        errorText: _errorText.isNotEmpty ? _errorText : null,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^[A-Z]{0,3}$')),
      ],
      onChanged: (value) {
        setState(() {
          _errorText = _blacklist.contains(value.toUpperCase())
              ? 'Keep it PG! Use different initials'
              : '';
        });
      },
    );
  }
}
