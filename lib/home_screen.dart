import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';
import 'template_selection_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Marketing Templates',
            style: Theme.of(context).textTheme.displayLarge),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey[100]!, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildCard(
                context,
                'Select a Template',
                Icons.design_services,
                TemplateSelectionScreen(
                  defaultCompanyName: '',
                ),
              ),
              SizedBox(height: 16),
              _buildCard(
                context,
                'Settings',
                Icons.settings,
                SettingsScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(
      BuildContext context, String title, IconData icon, Widget route) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueGrey[700], size: 40),
        title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
        trailing: Icon(Icons.arrow_forward, color: Colors.blueGrey[700]),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => route),
          );
        },
      ),
    );
  }
}
