import 'package:flutter/material.dart';
import 'package:flutter_app/models/groupe-task.dart';
import 'package:flutter_app/models/task.dart';
import 'package:flutter_app/widgets/widget-alls-create.dart';
import 'package:flutter_app/themes-styles/app-style.dart';
import 'package:flutter_app/widgets/widget-formulaire-task.dart';
import 'package:flutter_app/fonctions_util/all-fonctions-util.dart';

class EditeTaskFormDialog extends StatefulWidget {
  final Task? taskToEdit;

  EditeTaskFormDialog({this.taskToEdit});

  @override
  _EditeTaskFormDialogState createState() => _EditeTaskFormDialogState();
}

class _EditeTaskFormDialogState extends State<EditeTaskFormDialog> {
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
  void initState() {
    super.initState();

    if (widget.taskToEdit != null) {
      // Initialisez les champs avec les valeurs de la tâche
      _title = widget.taskToEdit!.titre;
      _description = widget.taskToEdit!.description;
      _startDate = widget.taskToEdit!.dateDebut;
      _endDate = widget.taskToEdit!.dateFin;
      _priority = widget.taskToEdit!.priorite.toString();
      _selectedGroup = widget.taskToEdit!.groupe;

      _startDateController.text = _startDate != null
          ? _startDate!.toLocal().toString().split(' ')[0]
          : '';
      _endDateController.text =
          _endDate != null ? _endDate!.toLocal().toString().split(' ')[0] : '';
    }
  }

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
            maxHeight: MediaQuery.of(context).size.height * 0.9,
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

                        if (widget.taskToEdit != null) {
                          // Si la tâche existe, mettez à jour ses valeurs
                          widget.taskToEdit!
                            ..titre = _title!
                            ..description = _description!
                            ..dateDebut = _startDate!
                            ..dateFin = _endDate!
                            ..priorite = PrioriteTask.values
                                .firstWhere((e) => e.toString() == _priority)
                            ..groupe = _selectedGroup!;
                        }
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
