import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/fonctions_util/all_fonctions_util.dart';
import 'package:flutter_app/widgets/widget_alls_create.dart';

class CreateTaskFormDialog extends StatefulWidget {
  const CreateTaskFormDialog({super.key});

  @override
  CreateTaskFormDialogState createState() => CreateTaskFormDialogState();
}

class CreateTaskFormDialogState extends State<CreateTaskFormDialog> {
  final _formKey = GlobalKey<FormState>();
  String? _title;
  String? _description;
  DateTime? _startDate;
  DateTime? _endDate;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  String? _priority;

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
    const textStyle = TextStyle(color: Colors.white);
    const inputDecoration = InputDecoration(
      labelStyle: textStyle,
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
    );
    const actionTextStyle = TextStyle(fontSize: 12, color: Colors.white);

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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      buildTextField(
                        label: 'Titre',
                        onSaved: (value) => _title = value,
                        textStyle: textStyle,
                        decoration: inputDecoration,
                      ),
                      const SizedBox(height: 16.0),
                      buildTextField(
                        label: 'Description',
                        onSaved: (value) => _description = value,
                        textStyle: textStyle,
                        decoration: inputDecoration,
                      ),
                      const SizedBox(height: 16.0),
                      buildDateField(
                        label: 'Début',
                        date: _startDate,
                        onDateChanged: (date) {
                          setState(() {
                            _startDate = date;
                            _startDateController.text = date != null
                                ? date.toLocal().toString().split(' ')[0]
                                : '';
                          });
                        },
                        selectDate: (context) => _selectDateTime(context, true),
                        textStyle: textStyle,
                        decoration: inputDecoration,
                        context: context,
                      ),
                      const SizedBox(height: 16.0),
                      buildDateField(
                        label: 'Fin',
                        date: _endDate,
                        onDateChanged: (date) {
                          setState(() {
                            _endDate = date;
                            _endDateController.text = date != null
                                ? date.toLocal().toString().split(' ')[0]
                                : '';
                          });
                        },
                        selectDate: (context) => _selectDateTime(context, true),
                        textStyle: textStyle,
                        decoration: inputDecoration,
                        context: context,
                      ),
                      const SizedBox(height: 16.0),
                      PrioritySelector(
                        selectedPriority: _priority,
                        onPrioritySelected: (value) {
                          setState(() {
                            _priority = value;
                          });
                        },
                      ),
                      const SizedBox(height: 24.0),
                      buildActionButtons(
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
                          // Fonction qui permet d'Ouvrir et de sélectionner un groupe
                        },
                        onSendPressed: () {
                          _submitForm();
                          // if (_formKey.currentState?.validate() ?? false) {
                          //   _formKey.currentState?.save();
                          //   Navigator.of(context).pop();
                          // }
                        },
                        actionTextStyle: actionTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDateTime(BuildContext context, bool isStartDate) async {
    // 1. Sélection de la date
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: isStartDate
          ? _startDate ?? DateTime.now()
          : _endDate ?? (_startDate ?? DateTime.now()),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate == null || !mounted) return;

    // 2. Sélection de l'heure
    final TimeOfDay? pickedTime = await showTimePicker(
      // ignore: use_build_context_synchronously
      context: context,
      initialTime: isStartDate
          ? _startTime ?? TimeOfDay.now()
          : _endTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null && mounted) {
      setState(() {
        final newDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        if (isStartDate) {
          _startDate = newDateTime;
          _startTime = pickedTime;
          // Validation: Si endDate est avant startDate, on le réinitialise
          if (_endDate != null && _endDate!.isBefore(newDateTime)) {
            _endDate = null;
            _endTime = null;
          }
        } else {
          _endDate = newDateTime;
          _endTime = pickedTime;
        }
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Validation supplémentaire
      if (_startDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("La date de début est obligatoire")),
        );
        return;
      }

      if (_priority == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("La priorité est obligatoire")),
        );
        return;
      }

      final task = {
        'title': _title,
        'description': _description,
        'startDate': _startDate,
        'endDate': _endDate,
        'priority': _priority,
      };

      log("Tâche créée: $task");
      Navigator.of(context).pop(task); // Renvoie les données
    }
  }
}

//   Future<void> _selectStartDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _startDate ?? DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null && picked != _startDate) {
//       setState(() {
//         _startDate = picked;
//       });
//     }
//   }

//   Future<void> _selectEndDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _endDate ?? DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null && picked != _endDate) {
//       setState(() {
//         _endDate = picked;
//       });
//     }
//   }
// }

