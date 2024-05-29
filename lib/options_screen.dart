import 'package:flutter/material.dart';

class OptionsScreen extends StatefulWidget {
  @override
  _OptionsScreenState createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  bool isDarkMode = false;
  bool isVibrationOn = false;
  String selectedLanguage = 'English';
  List<String> languages = ['English', 'Spanish', 'French', 'German'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Options'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Options'),
              Tab(text: 'Themes'),
              Tab(text: 'About'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            OptionsTab(
              isDarkMode: isDarkMode,
              isVibrationOn: isVibrationOn,
              selectedLanguage: selectedLanguage,
              languages: languages,
              onDarkModeChanged: (value) {
                setState(() {
                  isDarkMode = value;
                });
              },
              onVibrationChanged: (value) {
                setState(() {
                  isVibrationOn = value;
                });
              },
              onLanguageChanged: (value) {
                setState(() {
                  selectedLanguage = value!;
                });
              },
            ),
            ThemesTab(),
            AboutTab(),
          ],
        ),
      ),
    );
  }
}

class OptionsTab extends StatelessWidget {
  final bool isDarkMode;
  final bool isVibrationOn;
  final String selectedLanguage;
  final List<String> languages;
  final ValueChanged<bool> onDarkModeChanged;
  final ValueChanged<bool> onVibrationChanged;
  final ValueChanged<String?> onLanguageChanged;

  OptionsTab({
    required this.isDarkMode,
    required this.isVibrationOn,
    required this.selectedLanguage,
    required this.languages,
    required this.onDarkModeChanged,
    required this.onVibrationChanged,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwitchListTile(
            title: Text('Dark Mode'),
            value: isDarkMode,
            onChanged: onDarkModeChanged,
          ),
          SwitchListTile(
            title: Text('Vibrations'),
            value: isVibrationOn,
            onChanged: onVibrationChanged,
          ),
          DropdownButtonFormField<String>(
            value: selectedLanguage,
            items: languages.map((String language) {
              return DropdownMenuItem<String>(
                value: language,
                child: Text(language),
              );
            }).toList(),
            onChanged: onLanguageChanged,
            decoration: InputDecoration(
              labelText: 'Select Language',
            ),
          ),
        ],
      ),
    );
  }
}

class ThemesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Themes Tab'),
    );
  }
}

class AboutTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('About Tab'),
    );
  }
}
