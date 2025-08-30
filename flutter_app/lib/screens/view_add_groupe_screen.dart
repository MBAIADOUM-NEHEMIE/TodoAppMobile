import 'package:flutter/material.dart';
import 'package:flutter_app/models/groupe_task.dart';
import 'package:flutter_app/widgets/widget_alls_create.dart';

class CreateGroupDialog extends StatefulWidget {
  final Function(GroupeTask) onGroupCreated;

  const CreateGroupDialog({super.key, required this.onGroupCreated});

  @override
  CreateGroupDialogState createState() => CreateGroupDialogState();
}

class CreateGroupDialogState extends State<CreateGroupDialog> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  IconData _selectedIcon = Icons.star; // Icône par défaut

  void _pickIcon() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SelectIconDialog(
          onIconSelected: (icon) {
            setState(() {
              _selectedIcon = icon; // Met à jour l'icône sélectionnée
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Créer un Nouveau Groupe'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: _pickIcon,
            child: Icon(
              _selectedIcon,
              size: 50.0, // Taille de l'icône sélectionnée
              color: Colors.blue, // Couleur de l'icône
            ),
          ),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Nom du Groupe'),
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(labelText: 'Description'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            final newGroup = GroupeTask(
              id: DateTime.now()
                  .millisecondsSinceEpoch, // ID unique basé sur le temps
              nom: nameController.text,
              description: descriptionController.text,
              icon: _selectedIcon.codePoint
                  .toString(), // Convertir IconData en chaîne
            );
            widget.onGroupCreated(newGroup);
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
