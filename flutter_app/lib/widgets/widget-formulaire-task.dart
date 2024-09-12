import 'package:flutter/material.dart';
import 'package:flutter_app/themes-styles/app-style.dart';

// Gestion des champs de saisi du formulaire

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final FormFieldSetter<String>? onSaved;
  final TextStyle textStyle;
  final InputDecoration decoration;

  CustomTextField({
    required this.label,
    required this.controller,
    required this.onSaved,
    required this.textStyle,
    required this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSaved,
      decoration: decoration.copyWith(labelText: label),
      style: textStyle,
    );
  }
}

// Gestion du selecteur de date

class DatePickerField extends StatelessWidget {
  final String label;
  final DateTime? date;
  final Function(DateTime?) onDateChanged;
  final Future<void> Function(BuildContext) selectDate;
  final TextEditingController controller;
  final TextStyle textStyle;
  final InputDecoration decoration;

  DatePickerField({
    required this.label,
    required this.date,
    required this.onDateChanged,
    required this.selectDate,
    required this.controller,
    required this.textStyle,
    required this.decoration,
    required BuildContext context,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: decoration.copyWith(labelText: label),
      style: textStyle,
      readOnly: true,
      onTap: () async {
        await selectDate(context);
      },
    );
  }
}

// Gestion des button du formulaire

class ActionButtons extends StatelessWidget {
  final VoidCallback onTimePickerPressed;
  final VoidCallback onGroupPickerPressed;
  final VoidCallback onSendPressed;

  ActionButtons({
    required this.onTimePickerPressed,
    required this.onGroupPickerPressed,
    required this.onSendPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            Icons.access_time,
            color: AppColors.primaryColor,
          ),
          onPressed: onTimePickerPressed,
          tooltip: 'Choisir Heure',
        ),
        IconButton(
          icon: Icon(Icons.group, color: AppColors.primaryColor),
          onPressed: onGroupPickerPressed,
          tooltip: 'Choisir Groupe',
        ),
        IconButton(
          icon: Icon(Icons.check, color: Colors.green),
          onPressed: onSendPressed,
          tooltip: 'Valider',
        ),
      ],
    );
  }
}
