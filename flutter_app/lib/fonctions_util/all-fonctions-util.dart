import 'package:flutter/material.dart';
import 'package:flutter_app/models/task.dart';
import 'package:flutter_app/pages/page-home.dart';
import 'package:flutter_app/models/groupe-task.dart';
import 'package:flutter_app/screens/view-add-groupe-screen.dart';
import 'package:flutter_app/themes-styles/app-style.dart';
import 'package:flutter_app/screens/view-add-task-screen.dart';
import 'package:flutter_app/widgets/widget-groupe.dart';

// fonction pour actualiser la page

void refreshPage(BuildContext context) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (BuildContext context) => HomePage(),
    ),
  );
}

// fonction pour le titre de la page

Widget builderTitle({required String titleText}) {
  return Text(
    titleText,
    style: AppTextStyles.titre1,
    textAlign: TextAlign.center,
  );
}

// fonction pour les sous-titres

Widget builderSubtitle(
    {required String subtitleText1, required String subtitleText2}) {
  return Column(
    children: [
      Text(subtitleText1, style: AppTextStyles.titre2),
      SizedBox(height: 20),
      Text(subtitleText2, style: AppTextStyles.textbody3),
    ],
  );
}

// fonction pour les buttons

Widget builderLoginButton(
    {required VoidCallback onPressed, required String buttonText}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: AppButtonStyles.buttonNivau1,
    child: Text(buttonText),
  );
}

Widget builderForgotPasswordButton(
    {required VoidCallback onPressed, String text = 'Mot de passe oublié ?'}) {
  return TextButton(
    onPressed: onPressed,
    child: Text(text, style: TextStyle(color: Colors.blue)),
  );
}

// fonction pour le trai separateur

Widget builderDividerWithText(String text) {
  return Row(
    children: [
      Expanded(child: Divider(thickness: 1)),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(text, style: AppTextStyles.textbody4),
      ),
      Expanded(child: Divider(thickness: 1)),
    ],
  );
}

// fonction pour l'icon de retour en arrière

Widget builderBackButton(BuildContext context,
    {Color iconColor = Colors.black}) {
  return IconButton(
    icon: Icon(Icons.arrow_back, color: iconColor),
    onPressed: () {
      Navigator.pop(context); // Revenir en arrière
    },
  );
}

// fonction pour le text de l'option de connexion

Widget buildTextWithLink({
  required BuildContext context,
  required String staticText,
  required String clickableText,
  required VoidCallback onTap,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        staticText,
        style: AppTextStyles.textbody4,
      ),
      GestureDetector(
        onTap: onTap,
        child: Text(
          clickableText,
          style: AppTextStyles.textbody4.copyWith(color: Colors.blue[800]),
        ),
      ),
    ],
  );
}

// fontion pour la gestion du AppBar

AppBar buildAppBar(BuildContext context,
    {required Function onMenuTap, required Function onUserTap}) {
  return AppBar(
    title: Text('To-Do List'),
    actions: [
      IconButton(
        icon: Icon(Icons.menu),
        onPressed: () =>
            onMenuTap(), // Appel de fonction pour ouvrir le menu latéral
      ),
      IconButton(
        icon: Icon(Icons.account_circle),
        onPressed: () =>
            onUserTap(), // Appel de la fonction pour gérer l'utilisateur
      ),
    ],
  );
}

// Fonction pour le navebar

Widget buildNavbar({
  required Function onHomeTap,
  required Function onCalendarTap,
  required Function onClockTap,
  required Function onProfileTap,
}) {
  return BottomAppBar(
    shape:
        CircularNotchedRectangle(), // Fonction qui permet de réaliser la forme avec une encoche pour le bouton flottant
    notchMargin: 0.0, // Marge autour de la forme ou de l'encoche
    color: AppColors.navbarColor,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.home),
          color: AppColors.primaryColor,
          onPressed: () => onHomeTap(),
        ),
        IconButton(
          icon: Icon(Icons.calendar_today),
          color: AppColors.primaryColor,
          onPressed: () => onCalendarTap(),
        ),
        SizedBox(width: 40), // Espace pour le bouton flottant
        IconButton(
          icon: Icon(Icons.access_time),
          color: AppColors.primaryColor, // Couleur de l'icône
          onPressed: () => onClockTap(),
        ),
        IconButton(
          icon: Icon(Icons.account_circle),
          color: AppColors.primaryColor,
          onPressed: () => onProfileTap(),
        ),
      ],
    ),
  );
}

// Fonction pour construire le bouton flottant central
Widget buildFloatingActionButton({
  required Function onPlusTap,
}) {
  return FloatingActionButton(
    onPressed: () =>
        onPlusTap(), // Appel de la fonction lors du clic sur le bouton flottant
    // Ajout de l'icône du bouton flottant
    child: Icon(Icons.add),
    // Couleur de fond du bouton flottant
    backgroundColor: AppColors.bouttonColor,
    shape: CircleBorder(), // Assure que le bouton est rond (par défaut)
  );
}

// Fonction pour Afficher la liste des tâches si elle existe

Widget buildListOrMessage(
    {required List<String> items, required String emptyMessage}) {
  if (items.isNotEmpty) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
        );
      },
    );
  } else {
    return Center(
      child: Text(emptyMessage),
    );
  }
}

// Fonction pour montrer le formulaire dans un Dialog
void _showCreateTaskFormDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CreateTaskFormDialog(); // Afficher le formulaire
    },
  );
}

// Fonction pour la création des champs de texte pour la creation des tâches et la fonction pour le button validé
//

// Widget pour le champ de texte
Widget buildTextField({
  required String label,
  required FormFieldSetter<String> onSaved,
  required TextStyle textStyle,
  required InputDecoration decoration,
}) {
  return TextFormField(
    style: textStyle,
    decoration: decoration.copyWith(labelText: label),
    onSaved: onSaved,
  );
}

// Widget pour le champ de date
Widget buildDateField({
  required String label,
  DateTime? date,
  required ValueChanged<DateTime?> onDateChanged,
  required Future<void> Function(BuildContext) selectDate,
  required TextStyle textStyle,
  required InputDecoration decoration,
  required BuildContext context, // Passer le context comme paramètre
}) {
  final TextEditingController _controller = TextEditingController(
    text: date != null ? date.toLocal().toString().split(' ')[0] : '',
  );

  return TextFormField(
    style: textStyle,
    decoration: decoration.copyWith(
      labelText: label,
      suffixIcon: IconButton(
        icon: Icon(Icons.calendar_today, color: textStyle.color),
        onPressed: () async {
          await selectDate(context);
          _controller.text =
              date != null ? date.toLocal().toString().split(' ')[0] : '';
        },
      ),
    ),
    controller: _controller,
    readOnly: true,
    onTap: () async {
      await selectDate(context);
      _controller.text =
          date != null ? date.toLocal().toString().split(' ')[0] : '';
    },
  );
}

// Widget pour les boutons d'action
Widget buildActionButtons({
  required VoidCallback onTimePickerPressed,
  required VoidCallback onGroupPickerPressed,
  required VoidCallback onSendPressed,
  required TextStyle actionTextStyle,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        children: [
          IconButton(
            icon: Icon(Icons.access_time, color: actionTextStyle.color),
            onPressed: onTimePickerPressed,
          ),
          Text('Heure', style: actionTextStyle),
        ],
      ),
      Column(
        children: [
          IconButton(
            icon: Icon(Icons.group, color: actionTextStyle.color),
            onPressed: onGroupPickerPressed,
          ),
          Text('Groupe', style: actionTextStyle),
        ],
      ),
      Column(
        children: [
          IconButton(
            icon: Icon(Icons.check, color: Colors.blueAccent),
            onPressed: onSendPressed,
          ),
          Text('Enregister',
              style: actionTextStyle.copyWith(color: Colors.blueAccent)),
        ],
      ),
    ],
  );
}

// Fonction pour montrer le calendrier dans un Dialog
Future<void> dateSelectionCalender(BuildContext context) async {
  DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.light().copyWith(
          primaryColor: AppColors
              .primaryColor, // Utilisez la couleur primaire de votre thème
          hintColor: AppColors
              .primaryColor, // Utilisez la couleur d'accent de votre thème
          buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
        ),
        child: child!,
      );
    },
  );

  if (selectedDate != null && selectedDate != DateTime.now()) {
    // Afficher la date sélectionnée
    print("Date sélectionnée: ${selectedDate.toLocal()}");
  }
}

// Fonction pour montrer le sélecteur d'heure dans un Dialog
Future<void> slecteTimeHorloge(BuildContext context) async {
  TimeOfDay? selectedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.light().copyWith(
          primaryColor: AppColors
              .primaryColor, // Utilisez la couleur primaire de votre thème
          hintColor: AppColors
              .primaryColor, // Utilisez la couleur d'accent de votre thème
          buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
        ),
        child: child!,
      );
    },
  );

  if (selectedTime != null) {
    // Action à effectuer avec l'heure sélectionnée
    print("Heure sélectionnée: ${selectedTime.format(context)}");
  }
}

// Fonction Pour laq selection d'un groupe
void showGroupSelector(
    BuildContext context, Function(GroupeTask?) onGroupSelected) {
  List<GroupeTask> groups = List.generate(
    10,
    (i) => GroupeTask(
      id: i,
      nom: 'Groupe $i',
      description: 'Description du groupe $i',
      icon: Icons.star.codePoint.toString(), // Convertir IconData en chaîne
    ),
  );

  void _addNewGroup(GroupeTask newGroup) {
    groups.add(newGroup); // Ajoute le nouveau groupe à la liste
  }

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Sélectionnez un Groupe'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: GroupGrid(
                groups: groups,
                onGroupSelected: onGroupSelected,
              ),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CreateGroupDialog(
                      onGroupCreated: (newGroup) {
                        _addNewGroup(newGroup);
                        Navigator.of(context)
                            .pop(); // Ferme le dialogue de création
                        Navigator.of(context)
                            .pop(); // Ferme le dialogue principal
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Sélectionnez un Groupe'),
                              content: GroupGrid(
                                groups: groups,
                                onGroupSelected: onGroupSelected,
                              ),
                            );
                          },
                        ); // Réaffiche le dialogue principal avec la liste mise à jour
                      },
                    );
                  },
                );
              },
              child: Text(
                'Créer un Nouveau Groupe',
                style: AppTextStyles
                    .textbutton1, // Assurez-vous que ce style est défini
              ),
            ),
          ],
        ),
      );
    },
  );
}
// gestion des priorités

PrioriteTask getPriority(int index) {
  // Alterne entre les priorités basse, moyenne et haute
  switch (index % 3) {
    case 0:
      return PrioriteTask.basse;
    case 1:
      return PrioriteTask.moyenne;
    case 2:
      return PrioriteTask.haute;
    default:
      return PrioriteTask.basse;
  }
}

// Fonction pour la selection de la date

Future<void> selectDate(BuildContext context, DateTime? initialDate,
    ValueChanged<DateTime?> onDateChanged) async {
  final DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: initialDate ?? DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
  );
  if (selectedDate != null) {
    onDateChanged(selectedDate);
  }
}

// Fonction pour la selection de l'heur

Future<void> selectTime(
    BuildContext context, ValueChanged<TimeOfDay> onTimeSelected) async {
  final TimeOfDay? selectedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
  if (selectedTime != null) {
    onTimeSelected(selectedTime);
  }
}

// Fonction pour montrer le formulaire de création d'une task dans un Dialog

void showCreateTaskFormDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CreateTaskFormDialog();
    },
  );
}
