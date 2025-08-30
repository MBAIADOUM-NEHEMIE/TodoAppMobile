// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groupe_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupeTask _$GroupeTaskFromJson(Map<String, dynamic> json) => GroupeTask(
      id: (json['id'] as num).toInt(),
      nom: json['nom'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$GroupeTaskToJson(GroupeTask instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'description': instance.description,
      'icon': instance.icon,
    };
