import 'package:flutter/material.dart';
import 'template_editor.dart';

class TemplateSelectionScreen extends StatelessWidget {
  final String defaultCompanyName;

  TemplateSelectionScreen({required this.defaultCompanyName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Template', style: Theme.of(context).textTheme.displayLarge),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildTemplateCard(context, 'Template 1', 'assets/images/janmastmi1.jpeg'),
            _buildTemplateCard(context, 'Template 2', 'assets/images/janmastmi2.jpeg'),
            _buildTemplateCard(context, 'Template 3', 'assets/images/janmastmi3.jpeg'),
            _buildTemplateCard(context, 'Template 4', 'assets/images/janmastmi4.jpeg'),
          ],
        ),
      ),
    );
  }

  Widget _buildTemplateCard(BuildContext context, String title, String imagePath) {
    return Card(
      elevation: 8.0,
      margin: EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        leading: Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
        trailing: Icon(Icons.edit, color: Colors.blueGrey[700]),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TemplateEditor(
                templateName: title,
                defaultCompanyName: defaultCompanyName,
                imagePath: imagePath,
              ),
            ),
          );
        },
      ),
    );
  }
}
