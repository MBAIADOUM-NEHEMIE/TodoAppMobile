// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SousTask _$SousTaskFromJson(Map<String, dynamic> json) => SousTask(
      nom: json['nom'] as String,
      estComplete: json['estComplete'] as bool,
    );

Map<String, dynamic> _$SousTaskToJson(SousTask instance) => <String, dynamic>{
      'nom': instance.nom,
      'estComplete': instance.estComplete,
    };

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      id: (json['id'] as num).toInt(),
      titre: json['titre'] as String,
      description: json['description'] as String?,
      priorite: $enumDecode(_$PrioriteTaskEnumMap, json['priorite']),
      dateDebut: DateTime.parse(json['dateDebut'] as String),
      dateFin: DateTime.parse(json['dateFin'] as String),
      sousTasks: (json['sousTasks'] as List<dynamic>?)
          ?.map((e) => SousTask.fromJson(e as Map<String, dynamic>))
          .toList(),
      groupe: json['groupe'] == null
          ? null
          : GroupeTask.fromJson(json['groupe'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'titre': instance.titre,
      'description': instance.description,
      'priorite': _$PrioriteTaskEnumMap[instance.priorite]!,
      'dateDebut': instance.dateDebut.toIso8601String(),
      'dateFin': instance.dateFin.toIso8601String(),
      'sousTasks': instance.sousTasks,
      'groupe': instance.groupe,
    };

const _$PrioriteTaskEnumMap = {
  PrioriteTask.basse: 'basse',
  PrioriteTask.moyenne: 'moyenne',
  PrioriteTask.haute: 'haute',
};
