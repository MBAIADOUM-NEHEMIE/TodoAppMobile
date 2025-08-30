import 'package:flutter_app/models/groupe_task.dart';
import 'package:json_annotation/json_annotation.dart';
part 'task.g.dart';

enum PrioriteTask { basse, moyenne, haute }

@JsonSerializable()
class SousTask {
  final String nom;
  final bool estComplete;

  SousTask({
    required this.nom,
    required this.estComplete,
  });

  factory SousTask.fromJson(Map<String, dynamic> json) =>
      _$SousTaskFromJson(json);
  Map<String, dynamic> toJson() => _$SousTaskToJson(this);
}

@JsonSerializable()
class Task {
  //-------------------------- Déclaration des Variables -----------------//

  final int id;
  String titre;
  String? description;
  PrioriteTask priorite;
  DateTime dateDebut;
  DateTime dateFin;
  List<SousTask>? sousTasks; // Liste de sous-tâches
  GroupeTask? groupe;

  // -----------  Constructeur pour Initialiser une Instance de Tâche ---------------//

  Task({
    required this.id,
    required this.titre,
    this.description,
    required this.priorite,
    required this.dateDebut,
    required this.dateFin,
    this.sousTasks,
    this.groupe,
  });

  // Méthodes générées pour la sérialisation et désérialisation

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  Map<String, dynamic> toJson() => _$TaskToJson(this);

  // Méthode pour ajouter une sous-tâche à la liste
  void ajouterSousTache(SousTask sousTask) {
    sousTasks ??= []; // Initialise la liste si elle est null
    sousTasks!.add(sousTask);
  }
}
