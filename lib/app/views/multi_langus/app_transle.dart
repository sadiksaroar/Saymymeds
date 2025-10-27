import 'package:get/get_navigation/src/root/internacionalization.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      // home screen
      'hello': 'Hello',
      "scan_medication": "Scan Medication",
      "scan_instruction":
          "Point your camera at the label to identify your medication.",
      "scan_button": "Scan",
      "recently_scanned": "Recently Scanned",
      "font": "Open Sans",
      // end here
      // 2nd  recently screen can be added here

      // end 2nd screen
      //bottom nav bar can be added here
      'home': 'Home',
      'scan': 'Scan',
      'medications': 'Medications',
      'settings': 'Settings',
      // end bottom nav bar
    },

    'es': {
      // home screen
      'hello': 'Hola',
      "scan_medication": "Escanear medicamento",
      "scan_instruction":
          "Apunta tu cámara a la etiqueta para identificar tu medicamento.",
      "scan_button": "Escanear",
      "recently_scanned": "Escaneado recientemente",
      "font": "Open Sans",

      // home end here
      // 2nd screen can be added here
      'home': 'Inicio',
      'scan': 'Escanear',
      'medications': 'Medicamentos',
      'settings': 'Configuración',
      // end 2nd screen
    },
    'fr': {
      "hello": "Bonjour",
      "scan_medication": "Numériser le médicament",
      "scan_instruction":
          "Pointez votre caméra sur l'étiquette pour identifier votre médicament.",
      "scan_button": "Numériser",
      "recently_scanned": "Récemment numérisé",
      "font": "Open Sans",
      // custom translations for 2nd screen can be added here
      'home': 'Accueil',
      'scan': 'Scanner',
      'medications': 'Médicaments',
      'settings': 'Paramètres',
      // end 2nd screen
    },
    'pt': {
      "hello": "Olá",
      "scan_medication": "Escanear medicamento",
      "scan_instruction":
          "Aponte sua câmera para o rótulo para identificar o seu medicamento.",
      "scan_button": "Escanear",
      "recently_scanned": "Escaneado recentemente",
      "font": "Open Sans",
      // 2nd screen can be added here

      // end 2nd screen
      // custom translations for bottom nav bar
      'home': 'Início',
      'scan': 'Escanear',
      'medications': 'Medicamentos',
      'settings': 'Configurações',
      // end bottom nav bar
    },
    'ht': {
      "hello": "Bonjou",
      "scan_medication": "Eskane medikaman",
      "scan_instruction":
          "Pwen kamera ou sou etikèt la pou idantifye medikaman ou.",
      "scan_button": "Eskane",
      "recently_scanned": "Eskane dènyèman",
      "font": "Open Sans",
      // 2nd screen can be added here

      // end 2nd screen
      // custom translations for bottom nav bar
      'home': 'Lakay',
      'scan': 'Eskane',
      'medications': 'Medikaman',
      'settings': 'Paramèt',
      // end bottom nav bar
    },

    'ru': {
      "hello": "Здравствуйте",
      "scan_medication": "Сканировать медикамент",
      "scan_instruction":
          "Направьте камеру на этикетку, чтобы определить ваше лекарство.",
      "scan_button": "Сканировать",
      "recently_scanned": "Недавнее сканирование",
      "font": "Open Sans",
      // 2nd screen can be added here

      // end 2nd screen
      // custom translations for bottom nav bar
      'home': 'Главная',
      'scan': 'Сканировать',
      'medications': 'Лекарства',
      'settings': 'Настройки',
      // end bottom nav bar
    },
    'cn': {
      "hello": "你好",
      "scan_medication": "扫描药物",
      "scan_instruction": "将您的摄像头对准标签以识别药物。",
      "scan_button": "扫描",
      "recently_scanned": "最近扫描",
      "font": "Open Sans",
      // 2nd screen can be added here

      // end 2nd screen
      // custom translations for bottom nav bar
      'home': '首页',
      'scan': '扫描',
      'medications': '药物',
      'settings': '设置',
      // end bottom nav bar
    },
  };
}
