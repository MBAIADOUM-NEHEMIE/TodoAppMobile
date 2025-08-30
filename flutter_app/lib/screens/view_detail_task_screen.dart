import 'package:flutter/material.dart';
import 'package:flutter_app/screens/view_edit_task_screen.dart';
import 'package:flutter_app/themes-styles/app_style.dart';
import 'package:flutter_app/widgets/widget_tache.dart';
import '../models/task.dart';

class TaskDetailsPage extends StatefulWidget {
  final Task task;

  const TaskDetailsPage({super.key, required this.task});

  @override
  TaskDetailsPageState createState() => TaskDetailsPageState();
}

class TaskDetailsPageState extends State<TaskDetailsPage> {
  late Task task;

  @override
  void initState() {
    super.initState();
    task = widget.task; // Initialiser la tâche à partir des props
  }

  void _addSubTask(SousTask newSubTask) {
    setState(() {
      task.ajouterSousTache(newSubTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Détails de la tâche')),
      body: Container(
        color: AppColors.backgrounColor, // Fond blanc clair
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    'Titre: ${task.titre}',
                    style: const TextStyle(fontSize: 18),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.description, color: Colors.grey[700]),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    'Description: ${task.description ?? 'Aucune description'}',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.flag, color: Colors.grey[700]),
                const SizedBox(width: 8.0),
                Text('Priorité: ${task.priorite.name}'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.calendar_today, color: Colors.grey[700]),
                const SizedBox(width: 8.0),
                Text(
                    'Date de début: ${task.dateDebut.toLocal().toString().split(' ')[0]}'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.calendar_today, color: Colors.grey[700]),
                const SizedBox(width: 8.0),
                Text(
                    'Date de fin: ${task.dateFin.toLocal().toString().split(' ')[0]}'),
              ],
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CreateSousTaskDialog(
                      parentTask: task,
                      onSousTaskCreated: (SousTask newSubTask) {
                        _addSubTask(
                            newSubTask); // Utiliser la méthode pour mettre à jour la tâche
                      },
                    );
                  },
                );
              },
              child: const Row(
                children: [
                  Icon(Icons.add_task, color: Colors.blue),
                  SizedBox(width: 8.0),
                  Text(
                    'Ajouter une sous-tâche',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const EditeTaskFormDialog(
                                // Vous pouvez passer la tâche actuelle si nécessaire
                                // taskToEdit: task,
                                );
                          },
                        );
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.edit, color: Colors.white),
                          SizedBox(width: 8.0),
                          Text('Éditer la tâche'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
