import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['pt', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ptText = '',
    String? enText = '',
  }) =>
      [ptText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    '57b3gpnv': {
      'pt': 'Hoje é',
      'en': '',
    },
    'u7tynzwo': {
      'pt': 'Olá, ',
      'en': '',
    },
    'zxnwujv8': {
      'pt': 'Lista de Tarefas',
      'en': '',
    },
    'qz7u17ol': {
      'pt': 'Home',
      'en': '',
    },
  },
  // TermoUso
  {
    'mpf1rfih': {
      'pt':
          'Termo de uso Termo de uso Termo de e uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\n\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\n\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\n\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\n\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\n\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\n',
      'en': '',
    },
    'mwp5fg5j': {
      'pt': 'Termos de uso',
      'en': '',
    },
    's8tcl1cq': {
      'pt': 'Home',
      'en': '',
    },
  },
  // ListadeTarefas
  {
    'ml4npzqo': {
      'pt': 'MINHA LISTA DE TAREFAS',
      'en': '',
    },
    '7xty0tb7': {
      'pt': 'Pendentes',
      'en': '',
    },
    'yvpn3ddo': {
      'pt': 'Escolha uma categoria abaixo',
      'en': '',
    },
    '1r3ulmp1': {
      'pt': 'Buscar tarefa',
      'en': '',
    },
    '5qjv8xg8': {
      'pt': 'Data:',
      'en': '',
    },
    'goxovvdd': {
      'pt': 'Hora:',
      'en': '',
    },
    '2jcamqiu': {
      'pt': 'Ações',
      'en': '',
    },
    'ko43og50': {
      'pt': 'Concluidas',
      'en': '',
    },
    'rnv2yowz': {
      'pt': 'Escolha uma categoria abaixo ',
      'en': '',
    },
    '620j7es8': {
      'pt': 'Buscar tarefa',
      'en': '',
    },
    'ufvrtv92': {
      'pt': 'Concluida: ',
      'en': '',
    },
    'kljep671': {
      'pt': 'Hora:',
      'en': '',
    },
    'q8pepa7a': {
      'pt': 'Ações',
      'en': '',
    },
    '5e4jaz6b': {
      'pt': 'Home',
      'en': '',
    },
  },
  // EditarTarefas
  {
    'qc28fwuu': {
      'pt': 'Editar Tarefa',
      'en': '',
    },
    'b3okzppd': {
      'pt': 'Exemplo, comprar:   Arroz, Carne, Pão...',
      'en': '',
    },
    '7vmlw742': {
      'pt': 'Salvar',
      'en': '',
    },
    'k13fdaf8': {
      'pt': 'Esse campo é obrigatório',
      'en': '',
    },
    '3aipizzs': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // AcoesTarefasPendentes
  {
    'o1oxc6kn': {
      'pt': 'Concluir tarefa ?',
      'en': '',
    },
    'c9dpgm1r': {
      'pt': 'Editar tarefa ?',
      'en': '',
    },
    'de6tikke': {
      'pt': 'Deletar tarefa atual ?',
      'en': '',
    },
    'xg6681kp': {
      'pt': 'Deletar todas as tarefas ?',
      'en': '',
    },
    'onrub61z': {
      'pt': 'Cancelar ?',
      'en': '',
    },
  },
  // DeletarAllPendentes
  {
    'kerxdod4': {
      'pt': 'Tem certeza?',
      'en': '',
    },
    'qea0ienx': {
      'pt': 'Deletar todas',
      'en': '',
    },
    'f2do0jsp': {
      'pt': 'Cancel',
      'en': '',
    },
  },
  // DeletarAtualConcluidas
  {
    'y7gmkzqo': {
      'pt': 'Tem certeza?',
      'en': '',
    },
    '105bdaxf': {
      'pt': 'Deletar atual',
      'en': '',
    },
    'i1d07o4i': {
      'pt': 'Cancel',
      'en': '',
    },
  },
  // PerfilUser
  {
    'pr6u3ozd': {
      'pt': 'Meu Perfil',
      'en': '',
    },
    'vsldcj4y': {
      'pt': 'Nome: ',
      'en': '',
    },
    'qxix2y25': {
      'pt':
          '   Toque na imagem para carregar a\n foto em seguido no botão adicionar',
      'en': '',
    },
    '9p6znvo9': {
      'pt': 'Adicionar',
      'en': '',
    },
    'tj2ppox0': {
      'pt': 'Como você gostaria de ser chamado(a)?',
      'en': '',
    },
    'aaxiwmg9': {
      'pt': 'Digite seu nome ',
      'en': '',
    },
    '3f1kja2w': {
      'pt': 'Salvar/Editar',
      'en': '',
    },
    'cs0qrpjl': {
      'pt': 'Termos de uso',
      'en': '',
    },
  },
  // AcoesTarefasConcluidas
  {
    'x32p3oc4': {
      'pt': 'Refazer tarefa atual ?',
      'en': '',
    },
    '3n6jzi1q': {
      'pt': 'Refazer todas as tarefas ?\n',
      'en': '',
    },
    '8r6h9e71': {
      'pt': 'Deletar tarefa atual ?',
      'en': '',
    },
    'v2jm6a8z': {
      'pt': 'Deletar todas as tarefas?',
      'en': '',
    },
    'm2098ooc': {
      'pt': 'Cancelar ?',
      'en': '',
    },
  },
  // DeletarCategoria
  {
    '4g577y5y': {
      'pt': 'Tem certeza?',
      'en': '',
    },
    'yfyptq8g': {
      'pt': 'Deletar',
      'en': '',
    },
    'ctwkqouk': {
      'pt': 'Cancel',
      'en': '',
    },
  },
  // EditCategoria
  {
    'do5ism23': {
      'pt': 'Editar categoria ?',
      'en': '',
    },
    'q7mmv70o': {
      'pt': 'Digite o nome da categoria',
      'en': '',
    },
    'z8st3tdc': {
      'pt': 'Editar',
      'en': '',
    },
    'v0blal7g': {
      'pt': 'Esse campo é obrigatório!',
      'en': '',
    },
    'grfhrqbf': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // DeleteAllConcluidos
  {
    '7m9qvg60': {
      'pt': 'Tem certeza?',
      'en': '',
    },
    'gcaecxit': {
      'pt': 'Deletar Todas',
      'en': '',
    },
    't76n81xw': {
      'pt': 'Cancel',
      'en': '',
    },
  },
  // DeletarAtualPendentes
  {
    '006m46xn': {
      'pt': 'Tem certeza?',
      'en': '',
    },
    'lkygh9mq': {
      'pt': 'Deletar atual',
      'en': '',
    },
    '8m5r7y17': {
      'pt': 'Cancel',
      'en': '',
    },
  },
  // emptyListTarefas
  {
    '9hvp7b9w': {
      'pt': 'OPS! ',
      'en': '',
    },
    'sbz07975': {
      'pt': '         Parece que você não tem \n        tarefas cadastrados. ',
      'en': '',
    },
    '2te5x992': {
      'pt':
          ' Adicione categorias em seguida \n  as tarefas para começar usar o Task',
      'en': '',
    },
  },
  // AddTarefas
  {
    'e048rukf': {
      'pt': 'Adicionar categoria?',
      'en': '',
    },
    'aaqaejb0': {
      'pt':
          'Defina um nome para a sua lista de tarefas. Por exemplo, \'Lista de livros para ler\'',
      'en': '',
    },
    '53kwylsg': {
      'pt': 'Nome da categoria',
      'en': '',
    },
    '3g0n25kn': {
      'pt': 'Adicionar',
      'en': '',
    },
    'xvnxt59i': {
      'pt': 'Esse campo é obrigatório!',
      'en': '',
    },
    '2r80ja79': {
      'pt': 'Escolha uma opção no menu suspenso',
      'en': '',
    },
    'cjmikkgl': {
      'pt': 'Adicionar tarefas?',
      'en': '',
    },
    'c5jr358a': {
      'pt': 'Descrição da tarefa ',
      'en': '',
    },
    'rxava8be': {
      'pt': 'Selecione uma Categoria abaixo',
      'en': '',
    },
    '9j9jy0x7': {
      'pt': 'Adicionar',
      'en': '',
    },
    'v1gblysj': {
      'pt': 'Esse campo é obrigatório!',
      'en': '',
    },
    'uoy7wfo3': {
      'pt': 'Escolha uma opção no menu suspenso',
      'en': '',
    },
  },
  // DeletEditCategTarefas
  {
    'j627emah': {
      'pt': 'Editar',
      'en': '',
    },
    '7zozisa8': {
      'pt': 'Deletar',
      'en': '',
    },
  },
  // Miscellaneous
  {
    's23nrykf': {
      'pt': '',
      'en': '',
    },
    '447qdrlt': {
      'pt': '',
      'en': '',
    },
    'tbxc9j42': {
      'pt': '',
      'en': '',
    },
    'a6ycwg67': {
      'pt': '',
      'en': '',
    },
    '4w3gwd0l': {
      'pt': '',
      'en': '',
    },
    '5xkuykvt': {
      'pt': '',
      'en': '',
    },
    'bprioyu5': {
      'pt': '',
      'en': '',
    },
    'ct1cdp7y': {
      'pt': '',
      'en': '',
    },
    'adgbuxhd': {
      'pt': '',
      'en': '',
    },
    'so7oxu2h': {
      'pt': '',
      'en': '',
    },
    'ne6tyuaw': {
      'pt': '',
      'en': '',
    },
    'ic4pli1o': {
      'pt': '',
      'en': '',
    },
    'i0cwvt40': {
      'pt': '',
      'en': '',
    },
    'gvw7cvm8': {
      'pt': '',
      'en': '',
    },
    'u2c8033v': {
      'pt': '',
      'en': '',
    },
    '6ofexpn8': {
      'pt': '',
      'en': '',
    },
    'bpbxysn9': {
      'pt': '',
      'en': '',
    },
    'cyyaic1t': {
      'pt': '',
      'en': '',
    },
    'iub4weus': {
      'pt': '',
      'en': '',
    },
    'tfgi232f': {
      'pt': '',
      'en': '',
    },
    'oblvm7nd': {
      'pt': '',
      'en': '',
    },
    'xatmxfvz': {
      'pt': '',
      'en': '',
    },
    'pa6udxp1': {
      'pt': '',
      'en': '',
    },
    'su4rbwmd': {
      'pt': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
