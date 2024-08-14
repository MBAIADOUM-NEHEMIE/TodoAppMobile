enum PrioriteTask { basse, moyenne, haute, urgent }

class Task {
  //-------------------------- Declaration des Variables -----------------//

  final int id;
  final String titre;
  final String description;
  final PrioriteTask priorite;
  final DateTime dateDebut;
  final DateTime dateFin;
  final List<Map<String, dynamic>> sousTasks;
  // final GroupeTask?

// -----------  Constructeur pour Initialiser une Instance de Tâche ---------------//

  Task({
    required this.id,
    required this.titre,
    required this.description,
    required this.priorite,
    required this.dateDebut,
    required this.dateFin,
    required this.sousTasks,
    // this.groupe, // Uncomment if needed
  });
}
