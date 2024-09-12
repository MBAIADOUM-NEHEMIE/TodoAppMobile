import 'package:flutter/material.dart';
import 'package:flutter_app/themes-styles/app-style.dart';

class TaskWidget extends StatelessWidget {
  final bool isSelected;
  final String title;
  final DateTime startDate;
  final String group;
  final String priority;
  final ValueChanged<bool?> onSelected;

  const TaskWidget({
    Key? key,
    this.isSelected = false,
    this.title = "Titre de la tâche",
    required this.startDate,
    this.group = "Groupe 1",
    this.priority = "Priorité moyenne",
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[850]?.withOpacity(1.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TaskSelectionButton(
            isSelected: isSelected,
            onSelected: onSelected,
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TaskTitle(title: title),
                SizedBox(height: 4.0),
                TaskDateTime(startDate: startDate ?? DateTime.now()),
                SizedBox(height: 4.0),
                TaskGroup(group: group),
                SizedBox(height: 4.0),
                TaskPriority(priority: priority),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TaskSelectionButton extends StatelessWidget {
  final bool isSelected;
  final ValueChanged<bool?> onSelected;

  const TaskSelectionButton({
    Key? key,
    this.isSelected = false,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Radio<bool>(
      value: true,
      groupValue: isSelected,
      onChanged: onSelected,
      activeColor: AppColors.texteColor,
    );
  }
}

class TaskTitle extends StatelessWidget {
  final String title;

  const TaskTitle({
    Key? key,
    this.title = "Titre de la tâche",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: AppColors.texteColor,
      ),
    );
  }
}

class TaskDateTime extends StatelessWidget {
  final DateTime startDate;

  const TaskDateTime({
    Key? key,
    required this.startDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Icon(Icons.calendar_today, size: 14.0, color: Colors.white),
        SizedBox(width: 4.0),
        Text(
          "${startDate.day}/${startDate.month}/${startDate.year}",
          style: TextStyle(color: AppColors.texteColor, fontSize: 14.0),
        ),
        SizedBox(width: 8.0),
        // Icon(Icons.access_time, size: 14.0, color: Colors.white),
        SizedBox(width: 4.0),
        Text(
          "${startDate.hour}:${startDate.minute.toString().padLeft(2, '0')}",
          style: TextStyle(color: AppColors.texteColor, fontSize: 14.0),
        ),
      ],
    );
  }
}

class TaskGroup extends StatelessWidget {
  final String group;

  const TaskGroup({
    Key? key,
    this.group = "Groupe par défaut",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Groupe : $group',
      style: TextStyle(color: AppColors.texteColor, fontSize: 14.0),
    );
  }
}

class TaskPriority extends StatelessWidget {
  final String priority;

  const TaskPriority({
    Key? key,
    this.priority = "Priorité par défaut",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.flag, size: 14.0, color: Color.fromARGB(255, 126, 245, 96)),
        SizedBox(width: 4.0),
        Text(
          'Priorité : $priority',
          style: TextStyle(color: AppColors.texteColor, fontSize: 14.0),
        ),
      ],
    );
  }
}
