import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title:
            Text('Settings', style: Theme.of(context).textTheme.displayLarge),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey[50]!, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ListTile(
                  title: Text('Default Company Name',
                      style: Theme.of(context).textTheme.bodyLarge),
                  subtitle: Text(appState.companyName),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      _showEditDialog(context, appState);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, AppState appState) {
    String newCompanyName = appState.companyName;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Default Company Name'),
          content: TextField(
            onChanged: (value) {
              newCompanyName = value;
            },
            decoration: InputDecoration(
              labelText: 'Company Name',
              border: OutlineInputBorder(),
            ),
            controller: TextEditingController(text: appState.companyName),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                if (newCompanyName.isNotEmpty) {
                  appState.updateCompanyName(newCompanyName);
                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Company Name cannot be empty')),
                  );
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
