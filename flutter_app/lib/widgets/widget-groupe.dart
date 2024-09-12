import 'package:flutter/material.dart';
import 'package:flutter_app/models/groupe-task.dart';

class GroupGrid extends StatelessWidget {
  final List<GroupeTask> groups;
  final Function(GroupeTask) onGroupSelected;

  GroupGrid({required this.groups, required this.onGroupSelected});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Nombre de colonnes dans la grille
        crossAxisSpacing: 8.0, // Espacement horizontal entre les éléments
        mainAxisSpacing: 8.0, // Espacement vertical entre les éléments
      ),
      itemCount: groups.length,
      itemBuilder: (context, index) {
        final group = groups[index];
        return GestureDetector(
          onTap: () {
            onGroupSelected(
                group); // Appelle la fonction de rappel avec le groupe sélectionné
            Navigator.of(context).pop(); // Ferme le dialogue après sélection
          },
          child: Card(
            elevation: 4.0,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(group.nom,
                    textAlign: TextAlign.center), // Affiche le nom du groupe
              ),
            ),
          ),
        );
      },
    );
  }
}

class GroupSelectorDialog extends StatelessWidget {
  final List<GroupeTask> groups;
  final Function(GroupeTask?) onGroupSelected;

  GroupSelectorDialog({
    required this.groups,
    required this.onGroupSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Sélectionnez un groupe'),
      content: Container(
        width: double.minPositive,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: groups.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(groups[index].nom),
              subtitle: Text(groups[index].description ?? ''),
              onTap: () {
                onGroupSelected(groups[index]);
                Navigator.of(context).pop();
              },
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Annuler'),
        ),
      ],
    );
  }
}
