import 'package:flutter/material.dart';
import 'package:flutter_app/screens/view_detail_task_screen.dart';
import 'package:flutter_app/themes-styles/app_style.dart';
import '../models/task.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  const TaskList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        var task = tasks[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TaskDetailsPage(task: task),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.titre,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Date: ${task.dateDebut.toLocal()}'),
                Text('Heure: ${task.dateDebut.hour}:${task.dateDebut.minute}'),
                Text('Groupe: ${task.groupe?.nom ?? "Aucun"}'),
                Row(
                  children: [
                    Icon(Icons.flag, color: _getPriorityColor(task.priorite)),
                    Radio(value: task.id, groupValue: null, onChanged: (_) {}),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Color _getPriorityColor(PrioriteTask priority) {
    switch (priority) {
      case PrioriteTask.basse:
        return Colors.green;
      case PrioriteTask.moyenne:
        return Colors.orange;
      case PrioriteTask.haute:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}

// Creation de Sous Tâche

class CreateSousTaskDialog extends StatefulWidget {
  final Task parentTask; // Ajoutez cette ligne pour recevoir la tâche parente
  final Function(SousTask) onSousTaskCreated;

  const CreateSousTaskDialog(
      {super.key, required this.parentTask, required this.onSousTaskCreated});

  @override
  CreateSousTaskDialogState createState() => CreateSousTaskDialogState();
}

class CreateSousTaskDialogState extends State<CreateSousTaskDialog> {
  final TextEditingController nameController = TextEditingController();
  bool _isComplete = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(253, 53, 52, 52),
      title: const Text(
        'Créer une Nouvelle Sous-tâche',
        style: TextStyle(color: AppColors.texteColor),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration:
                const InputDecoration(labelText: 'Nom de la Sous-tâche'),
          ),
          Row(
            children: [
              const Text('Est complété:',
                  style: TextStyle(color: AppColors.texteColor)),
              Checkbox(
                value: _isComplete,
                onChanged: (bool? value) {
                  setState(() {
                    _isComplete = value ?? false;
                  });
                },
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            final newSubTask = SousTask(
              nom: nameController.text,
              estComplete: _isComplete,
            );
            widget.onSousTaskCreated(newSubTask);
            widget.parentTask.ajouterSousTache(
                newSubTask); // Ajoute la sous-tâche à la tâche parente
            Navigator.of(context).pop(); // Ferme le dialogue
          },
          child: const Text('Créer'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Ferme le dialogue
          },
          child: const Text('Annuler'),
        ),
      ],
    );
  }
}
