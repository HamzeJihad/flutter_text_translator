import 'package:flutter/material.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class CustomDropDownMenu extends StatelessWidget {
  const CustomDropDownMenu({
    super.key, this.onSelected, this.dropdownMenuEntries,
    this.initialSelection,
  });

  final void Function(dynamic)? onSelected;
  final List<TranslateLanguage>? dropdownMenuEntries ;
  final TranslateLanguage? initialSelection;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DropdownMenu<TranslateLanguage>(
      dropdownMenuEntries: dropdownMenuEntries
        ?.map((lang) => DropdownMenuEntry<TranslateLanguage>(
              value: lang,
              label: _getLanguageLabel(lang),
            ))
        .toList() ?? [],
        onSelected:onSelected,
        menuStyle: MenuStyle(alignment: AlignmentDirectional.centerStart),
        textAlign: TextAlign.center,
        textStyle: TextStyle(color: Colors.white), 
        initialSelection: initialSelection?? TranslateLanguage.english,
        trailingIcon: const Icon(Icons.arrow_drop_down, color: Colors.white,),
        selectedTrailingIcon: Icon(Icons.arrow_drop_down, color: Colors.white) ,
        inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none
        ),
      ),
    );
  }
}
String _getLanguageLabel(TranslateLanguage lang) {
  switch (lang) {
    case TranslateLanguage.afrikaans:
      return 'Africâner';
    case TranslateLanguage.albanian:
      return 'Albanês';
    case TranslateLanguage.arabic:
      return 'Árabe';
    case TranslateLanguage.belarusian:
      return 'Bielorrusso';
    case TranslateLanguage.bengali:
      return 'Bengali';
    case TranslateLanguage.bulgarian:
      return 'Búlgaro';
    case TranslateLanguage.catalan:
      return 'Catalão';
    case TranslateLanguage.chinese:
      return 'Chinês';
    case TranslateLanguage.croatian:
      return 'Croata';
    case TranslateLanguage.czech:
      return 'Tcheco';
    case TranslateLanguage.danish:
      return 'Dinamarquês';
    case TranslateLanguage.dutch:
      return 'Holandês';
    case TranslateLanguage.english:
      return 'Inglês';
    case TranslateLanguage.esperanto:
      return 'Esperanto';
    case TranslateLanguage.estonian:
      return 'Estoniano';
    case TranslateLanguage.finnish:
      return 'Finlandês';
    case TranslateLanguage.french:
      return 'Francês';
    case TranslateLanguage.galician:
      return 'Galego';
    case TranslateLanguage.georgian:
      return 'Georgiano';
    case TranslateLanguage.german:
      return 'Alemão';
    case TranslateLanguage.greek:
      return 'Grego';
    case TranslateLanguage.gujarati:
      return 'Gujarati';
    case TranslateLanguage.haitian:
      return 'Crioulo haitiano';
    case TranslateLanguage.hebrew:
      return 'Hebraico';
    case TranslateLanguage.hindi:
      return 'Hindi';
    case TranslateLanguage.hungarian:
      return 'Húngaro';
    case TranslateLanguage.icelandic:
      return 'Islandês';
    case TranslateLanguage.indonesian:
      return 'Indonésio';
    case TranslateLanguage.irish:
      return 'Irlandês';
    case TranslateLanguage.italian:
      return 'Italiano';
    case TranslateLanguage.japanese:
      return 'Japonês';
    case TranslateLanguage.kannada:
      return 'Canarês';
    case TranslateLanguage.korean:
      return 'Coreano';
    case TranslateLanguage.latvian:
      return 'Letão';
    case TranslateLanguage.lithuanian:
      return 'Lituano';
    case TranslateLanguage.macedonian:
      return 'Macedônio';
    case TranslateLanguage.malay:
      return 'Malaio';
    case TranslateLanguage.maltese:
      return 'Maltês';
    case TranslateLanguage.marathi:
      return 'Marata';
    case TranslateLanguage.norwegian:
      return 'Norueguês';
    case TranslateLanguage.persian:
      return 'Persa';
    case TranslateLanguage.polish:
      return 'Polonês';
    case TranslateLanguage.portuguese:
      return 'Português';
    case TranslateLanguage.romanian:
      return 'Romeno';
    case TranslateLanguage.russian:
      return 'Russo';
    case TranslateLanguage.slovak:
      return 'Eslovaco';
    case TranslateLanguage.slovenian:
      return 'Esloveno';
    case TranslateLanguage.spanish:
      return 'Espanhol';
    case TranslateLanguage.swahili:
      return 'Suaíli';
    case TranslateLanguage.swedish:
      return 'Sueco';
    case TranslateLanguage.tagalog:
      return 'Tagalo';
    case TranslateLanguage.tamil:
      return 'Tâmil';
    case TranslateLanguage.telugu:
      return 'Télugo';
    case TranslateLanguage.thai:
      return 'Tailandês';
    case TranslateLanguage.turkish:
      return 'Turco';
    case TranslateLanguage.ukrainian:
      return 'Ucraniano';
    case TranslateLanguage.urdu:
      return 'Urdu';
    case TranslateLanguage.vietnamese:
      return 'Vietnamita';
    case TranslateLanguage.welsh:
      return 'Galês';
    }

}