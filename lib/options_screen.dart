import 'package:flutter/material.dart';
import 'themes.dart';

class OptionsScreen extends StatefulWidget {
  final bool isDarkMode;
  final bool isVibrationOn;
  final String selectedTheme;

  OptionsScreen({
    required this.isDarkMode,
    required this.isVibrationOn,
    required this.selectedTheme,
  });

  @override
  _OptionsScreenState createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  late bool isDarkMode;
  late bool isVibrationOn;
  late String selectedTheme;
  List<String> languages = ['English', 'Spanish', 'French', 'German'];
  String selectedLanguage = 'English';

  @override
  void initState() {
    super.initState();
    isDarkMode = widget.isDarkMode;
    isVibrationOn = widget.isVibrationOn;
    selectedTheme = widget.selectedTheme;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: DefaultTextStyle(
            style: TextStyle(color: Colors.white, fontSize: 16),
            child: Text('Options'),
          ),
          bottom: TabBar(
            indicatorColor: Colors.transparent,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(text: 'Options'),
              Tab(text: 'Themes'),
              Tab(text: 'About'),
            ],
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white, // set the color to white
            ),
            onPressed: () {
              Navigator.pop(context, {
                'isDarkMode': isDarkMode,
                'isVibrationOn': isVibrationOn,
                'selectedTheme': selectedTheme,
              });
            },
          ),
        ),
        body: Container(
          color: Colors.black87,
          child: TabBarView(
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
              ThemesTab(
                selectedTheme: selectedTheme,
                onThemeChanged: (value) {
                  setState(() {
                    selectedTheme = value;
                  });
                },
              ),
              AboutTab(),
            ],
          ),
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
            title: Text('Dark Mode', style: TextStyle(color: Colors.white)),
            value: isDarkMode,
            onChanged: onDarkModeChanged,
          ),
          SwitchListTile(
            title: Text('Vibrations', style: TextStyle(color: Colors.white)),
            value: isVibrationOn,
            onChanged: onVibrationChanged,
          ),
          Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.black54, // Background color of the dropdown
            ),
            child: DropdownButtonFormField<String>(
              value: selectedLanguage,
              items: languages.map((String language) {
                return DropdownMenuItem<String>(
                  value: language,
                  child: Text(language, style: TextStyle(color: Colors.white)),
                );
              }).toList(),
              onChanged: onLanguageChanged,
              dropdownColor: Color.fromARGB(
                  255, 55, 55, 55), // Background color for the dropdown
              decoration: InputDecoration(
                labelText: 'Language',
                labelStyle:
                    TextStyle(color: Colors.white), // Set color to white
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white), // Border color
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.white), // Focused border color
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ThemesTab extends StatelessWidget {
  final String selectedTheme;
  final ValueChanged<String> onThemeChanged;

  ThemesTab({required this.selectedTheme, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: AppThemes.themes.keys.map((String theme) {
                final ThemeData themeData = AppThemes.themes[theme]!;

                return ListTile(
                  leading: Icon(
                    Icons.palette,
                    color: themeData.colorScheme
                        .secondary, // Use the theme's primary color for the icon
                  ),
                  title: Text(
                    theme,
                    style: TextStyle(
                        color: Colors.white), // Set title text color to white
                  ),
                  trailing: selectedTheme == theme
                      ? Icon(Icons.check, color: Colors.green)
                      : null,
                  onTap: () {
                    onThemeChanged(theme);
                  },
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(height: 10),
          CalculatorPreview(selectedTheme: selectedTheme),
        ],
      ),
    );
  }
}

class CalculatorPreview extends StatelessWidget {
  final String selectedTheme;

  CalculatorPreview({required this.selectedTheme});

  Color getBgColor(String text, ThemeData themeData) {
    if (text == "=") {
      return themeData.colorScheme.secondary;
    }
    if (["/", "*", "-", "+", "%", "(", ")"].contains(text)) {
      return themeData.colorScheme.tertiary;
    }
    return themeData.primaryColor;
  }

  Color getTextColor(String text, ThemeData themeData) {
    if (text == "=") {
      return themeData.colorScheme.onSecondary;
    }
    if (["/", "*", "-", "+", "%", "(", ")"].contains(text)) {
      return themeData.colorScheme.onTertiary;
    }
    return themeData.textTheme.bodyText1?.color ?? Colors.white;
  }

  Widget CustomButton({
    required String text,
    required bool isVibrationOn,
    required ThemeData themeData,
  }) {
    return Expanded(
      flex: text == "=" ? 2 : 1,
      child: Container(
        height: 50.0, // Adjust as needed
        decoration: BoxDecoration(
          color: getBgColor(text, themeData),
          borderRadius: BorderRadius.all(
            Radius.circular(3),
          ),
        ),
        child: Center(
          child: Text(
            '$text',
            style: TextStyle(
              color: getTextColor(text, themeData),
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = AppThemes.themes[selectedTheme]!;

    return Theme(
      data: themeData,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(text: "+", isVibrationOn: true, themeData: themeData),
            SizedBox(width: 4),
            CustomButton(text: "1", isVibrationOn: true, themeData: themeData),
            SizedBox(width: 4),
            CustomButton(text: "2", isVibrationOn: true, themeData: themeData),
            SizedBox(width: 4),
            CustomButton(text: "3", isVibrationOn: true, themeData: themeData),
            SizedBox(width: 4),
            CustomButton(text: "=", isVibrationOn: true, themeData: themeData),
          ],
        ),
      ),
    );
  }
}

class AboutTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "About",
                style: TextStyle(color: Colors.white38, fontSize: 12),
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.info_outline, color: Colors.blue),
            title: Text(
              'Version',
              style: TextStyle(
                  color: Colors.white), // Set title text color to white
            ),
            subtitle: Text(
              '1.09',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.white60), // Set subtitle text color to white
            ),
            onTap: () {},
          ),
          Divider(
            color: Colors.black,
          ),
          ListTile(
            leading: Icon(Icons.info_outline, color: Colors.blue),
            title: Text(
              'For more information, please visit',
              style: TextStyle(
                  color: Colors.white), // Set title text color to white
            ),
            subtitle: Text(
              'FOTHONG.COM',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.white60), // Set subtitle text color to white
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
