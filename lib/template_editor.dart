import 'package:flutter/material.dart';

class TemplateEditor extends StatefulWidget {
  final String templateName;
  final String defaultCompanyName;
  final String imagePath;

  TemplateEditor({
    required this.templateName,
    required this.defaultCompanyName,
    required this.imagePath,
  });

  @override
  _TemplateEditorState createState() => _TemplateEditorState();
}

class _TemplateEditorState extends State<TemplateEditor> {
  late String _companyName;
  String _customText = 'Enter your text here';

  @override
  void initState() {
    super.initState();
    _companyName = widget.defaultCompanyName;
  }

  void _captureScreenshot() {
    // Implement screenshot functionality
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editing: ${widget.templateName}',
            style: Theme.of(context).textTheme.displayLarge),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _captureScreenshot,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildTextField('Company Name', (value) {
              setState(() {
                _companyName = value;
              });
            }, _companyName),
            SizedBox(height: 20),
            _buildTextField('Custom Text', (value) {
              setState(() {
                _customText = value;
              });
            }, _customText),
            SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Image.asset(
                      widget.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          _companyName,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey[800],
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          _customText,
                          style: TextStyle(
                              fontSize: 22, color: Colors.blueGrey[600]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _captureScreenshot,
                  child: Text('Export'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _companyName = widget.defaultCompanyName;
                      _customText = 'Enter your text here';
                    });
                  },
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, Function(String) onChanged, String initialValue) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      onChanged: onChanged,
      controller: TextEditingController(text: initialValue),
    );
  }
}
