import 'package:flutter/material.dart';
import 'package:flutter_app/models/groupe-task.dart';
import 'package:flutter_app/widgets/widget-alls-create.dart';
import 'package:flutter_app/themes-styles/app-style.dart';
import 'package:flutter_app/widgets/widget-formulaire-task.dart';
import 'package:flutter_app/fonctions_util/all-fonctions-util.dart';

class CreateTaskFormDialog extends StatefulWidget {
  @override
  _CreateTaskFormDialogState createState() => _CreateTaskFormDialogState();
}

class _CreateTaskFormDialogState extends State<CreateTaskFormDialog> {
  final _formKey = GlobalKey<FormState>();
  String? _title;
  String? _description;
  DateTime? _startDate;
  DateTime? _endDate;
  String? _priority;
  GroupeTask? _selectedGroup;

  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(color: AppColors.texteColor);
    final inputDecoration = InputDecoration(
      labelStyle: textStyle,
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.texteColor),
      ),
    );

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      backgroundColor: Colors.transparent,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.9,
            maxHeight: MediaQuery.of(context).size.height * 0.45,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[850]?.withOpacity(0.9),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextField(
                    label: 'Titre',
                    controller: TextEditingController(text: _title),
                    onSaved: (value) => _title = value,
                    textStyle: textStyle,
                    decoration: inputDecoration,
                  ),
                  SizedBox(height: 16.0),
                  CustomTextField(
                    label: 'Description',
                    controller: TextEditingController(text: _description),
                    onSaved: (value) => _description = value,
                    textStyle: textStyle,
                    decoration: inputDecoration,
                  ),
                  SizedBox(height: 16.0),
                  DatePickerField(
                    label: 'Début',
                    date: _startDate,
                    controller: _startDateController,
                    onDateChanged: (date) {
                      setState(() {
                        _startDate = date;
                        _startDateController.text = date != null
                            ? date.toLocal().toString().split(' ')[0]
                            : '';
                      });
                    },
                    selectDate: (context) =>
                        selectDate(context, _startDate, (date) {
                      setState(() {
                        _startDate = date;
                      });
                    }),
                    textStyle: textStyle,
                    decoration: inputDecoration,
                    context: context,
                  ),
                  SizedBox(height: 16.0),
                  DatePickerField(
                    label: 'Fin',
                    date: _endDate,
                    controller: _endDateController,
                    onDateChanged: (date) {
                      setState(() {
                        _endDate = date;
                        _endDateController.text = date != null
                            ? date.toLocal().toString().split(' ')[0]
                            : '';
                      });
                    },
                    selectDate: (context) =>
                        selectDate(context, _endDate, (date) {
                      setState(() {
                        _endDate = date;
                      });
                    }),
                    textStyle: textStyle,
                    decoration: inputDecoration,
                    context: context,
                  ),
                  SizedBox(height: 16.0),
                  PrioritySelector(
                    selectedPriority: _priority,
                    onPrioritySelected: (value) {
                      setState(() {
                        _priority = value;
                      });
                    },
                  ),
                  SizedBox(height: 24.0),
                  ActionButtons(
                    onTimePickerPressed: () {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((selectedTime) {
                        if (selectedTime != null) {
                          // Traitement de l'heure sélectionnée
                        }
                      });
                    },
                    onGroupPickerPressed: () {
                      showGroupSelector(
                        context,
                        (selectedGroup) {
                          setState(() {
                            _selectedGroup = selectedGroup;
                          });
                        },
                      );
                    },
                    onSendPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
