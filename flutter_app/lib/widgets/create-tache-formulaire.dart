import 'package:flutter/material.dart';
import 'package:flutter_app/fonctions_util/all-fonctions-util.dart';
import 'package:flutter_app/widgets/widget-alls-create.dart';

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
    final textStyle = TextStyle(color: Colors.white);
    final inputDecoration = InputDecoration(
      labelStyle: textStyle,
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
    );
    final actionTextStyle = TextStyle(fontSize: 12, color: Colors.white);

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
                      SizedBox(height: 16.0),
                      buildTextField(
                        label: 'Description',
                        onSaved: (value) => _description = value,
                        textStyle: textStyle,
                        decoration: inputDecoration,
                      ),
                      SizedBox(height: 16.0),
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
                        selectDate: _selectStartDate,
                        textStyle: textStyle,
                        decoration: inputDecoration,
                        context: context,
                      ),
                      SizedBox(height: 16.0),
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
                        selectDate: _selectEndDate,
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
                          if (_formKey.currentState?.validate() ?? false) {
                            _formKey.currentState?.save();
                            Navigator.of(context).pop();
                          }
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

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _startDate) {
      setState(() {
        _startDate = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _endDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _endDate) {
      setState(() {
        _endDate = picked;
      });
    }
  }
}
