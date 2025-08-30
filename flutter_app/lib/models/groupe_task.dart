import 'package:json_annotation/json_annotation.dart';

part 'groupe-task.g.dart';

@JsonSerializable()
class GroupeTask {
  //-------------------------- Déclaration des Variables -----------------//

  final int id;
  final String nom;
  final String description;
  final String icon;

  // -----------  Constructeur pour Initialiser une Instance de Groupe de Tâche ---------------//

  GroupeTask({
    required this.id,
    required this.nom,
    required this.description,
    required this.icon,
  });

  // -----------  Méthodes pour sérialisation et désérialisation ---------------//

  factory GroupeTask.fromJson(Map<String, dynamic> json) =>
      _$GroupeTaskFromJson(json);
  Map<String, dynamic> toJson() => _$GroupeTaskToJson(this);
}
