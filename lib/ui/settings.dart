import 'package:flutter/material.dart';
import 'package:involved/utils/customText.dart';
import 'package:involved/utils/themes.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: Theme.of(context).iconTheme,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title:const ModifiedText(text: 'Settings',size: 15),
          centerTitle: true,
          //backgroundColor: ,
        ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.start,
            children:  [
               Card(
                 shadowColor: Theme.of(context).splashColor,
                 elevation: 6,
                 margin: const EdgeInsets.all(15),
                 child:const ListTile(
                  leading: Icon(FontAwesomeIcons.moon),
                  title: ModifiedText(text: 'Dark mood',size: 15),
                  trailing: ChangeThemeButtonWidget(),
              ),
               ),
            ],
          ),
      ),
    );
  }
}

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(
      activeColor: Colors.blue.shade900,
        value: themeProvider.isDarkMode,
        onChanged: (value) {
          final provider = Provider.of<ThemeProvider>(context, listen: false);
          provider.toggleTheme(value);
        },
    );
  }
}

