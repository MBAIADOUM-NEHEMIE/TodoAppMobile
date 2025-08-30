import 'package:flutter/material.dart';

class MenusLateral extends StatelessWidget {
  const MenusLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('Nom d\'Utilisateur'),
            accountEmail: Text('email@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                'U',
                style: TextStyle(fontSize: 40.0, color: Colors.blue),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Accueil'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.assignment),
            title: const Text('Mes Tâches'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/tasks');
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Ajouter une Tâche'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/add-task');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Paramètres'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/settings');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Déconnexion'),
            onTap: () {
              // logique pour déconnexion
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
