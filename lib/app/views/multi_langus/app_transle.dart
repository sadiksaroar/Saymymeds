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

      // scane screen can be added here
      'camera': 'Camera',
      'photos': 'Photos',

      // end scane screen

      // medication page can be added here
      "deleteMedication": "Delete Medication",
      "areYouSureDelete": "Are you sure you want to delete?",
      "cancel": "Cancel",
      "delete": "Delete",
      // ignore: equal_keys_in_map
      "medications": "Medications",
      "searchMedications": "Search Medications",
      "noMedicationsFound": "No medications found.",
      "unknownMedication": "Unknown, this medication",
      "brandName": "Brand Name",
      "checkInfo": "Check info",
      // end medication page

      // setting page can be added here
      "settings": "Settings",
      "editProfile": "Edit Profile",
      "languageSelection": "Language Selection",
      "aboutUs": "About Us",
      "contactUs": "Contact Us",
      "logout": "Logout",
      "changePhoto": "Change photo",
      "fullName": "Full name",
      "error": "Error",
      "nameCannotBeEmpty": "Name cannot be empty",
      "success": "Success",
      "profileUpdated": "Profile updated successfully",
      "failedToUpdateProfile": "Failed to update profile",
      "saveChanges": "Save changes",
      "english": "English",
      "spanish": "Spanish (Español)",
      "french": "French (Français)",
      "creole": "Creole",
      "portugese": "Portuguese",
      "chinese": "Chinese",
      "russian": "Russian",
      // end setting page

      // recently screen can be added here
      "noMedicationsFound": "No medications found",
      "genericName": "Generic Name",
      "viewDetails": "View details",
      "seeAll": "See All",

      // end recently screen
      'generic_name': 'Generic Name',
      'brand_name': 'Brand Name',
      'manufacturer': 'Manufacturer',
      'drug_class': 'Drug Class',
      'uses': 'Uses',
      'dosage_information': 'Dosage Information',
      'adults': 'Adults',
      'children': 'Children',
      'elderly': 'Elderly',
      'how_to_take': 'How to Take',
      'side_effects': 'Side Effects',
      'common': 'Common',
      'serious': 'Serious',
      'warnings': 'Warnings',
      'storage_instructions': 'Storage Instructions',
      'interactions': 'Interactions',
      'add_notes': 'Add notes',
      'save_note': 'Save Note',
      'play': 'Play',
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

      // scane screen can be added here
      'camera': 'Cámara',
      'photos': 'Fotos',
      // end scane screen

      // medication page can be added here
      "deleteMedication": "Eliminar Medicamento",
      "areYouSureDelete": "¿Está seguro de que desea eliminar?",
      "cancel": "Cancelar",
      "delete": "Eliminar",
      "medications": "Medicamentos",
      "searchMedications": "Buscar Medicamentos",
      "noMedicationsFound": "No se encontraron medicamentos.",
      "unknownMedication": "Desconocido, este medicamento",
      "brandName": "Nombre de la Marca",
      "checkInfo": "Verificar información",
      // end medication page

      // setting page can be added here
      "settings": "Configuración",
      "editProfile": "Editar perfil",
      "languageSelection": "Selección de idioma",
      "aboutUs": "Acerca de nosotros",
      "contactUs": "Contáctenos",
      "logout": "Cerrar sesión",
      "changePhoto": "Cambiar foto",
      "fullName": "Nombre completo",
      "error": "Error",
      "nameCannotBeEmpty": "El nombre no puede estar vacío",
      "success": "Éxito",
      "profileUpdated": "Perfil actualizado con éxito",
      "failedToUpdateProfile": "Error al actualizar el perfil",
      "saveChanges": "Guardar cambios",
      "english": "Inglés",
      "spanish": "Español (Español)",
      "french": "Francés (Français)",
      "creole": "Criollo",
      "portugese": "Portugués",
      "chinese": "Chino",
      "russian": "Ruso",

      // end setting page

      // recently screen can be added here
      "noMedicationsFound": "No se encontraron medicamentos",
      "genericName": "Nombre genérico",
      "viewDetails": "Ver detalles",
      "seeAll": "Ver todo",
      // end recently screen
      'generic_name': 'Nombre Genérico',
      'brand_name': 'Nombre de Marca',
      'manufacturer': 'Fabricante',
      'drug_class': 'Clase de Droga',
      'uses': 'Usos',
      'dosage_information': 'Información de Dosificación',
      'adults': 'Adultos',
      'children': 'Niños',
      'elderly': 'Ancianos',
      'how_to_take': 'Cómo Tomar',
      'side_effects': 'Efectos Secundarios',
      'common': 'Común',
      'serious': 'Serio',
      'warnings': 'Advertencias',
      'storage_instructions': 'Instrucciones de Almacenamiento',
      'interactions': 'Interacciones',
      'add_notes': 'Agregar Notas',
      'save_note': 'Guardar Nota',
      'play': 'Reproducir',
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
      // scane screen can be added here
      'camera': 'Caméra',
      'photos': 'Photos',
      // end scane screen

      // medication page can be added here
      "deleteMedication": "Supprimer le Médicament",
      "areYouSureDelete": "Êtes-vous sûr de vouloir supprimer ?",
      "cancel": "Annuler",
      "delete": "Supprimer",
      "medications": "Médicaments",
      "searchMedications": "Rechercher des Médicaments",
      "noMedicationsFound": "Aucun médicament trouvé.",
      "unknownMedication": "Inconnu, ce médicament",
      "brandName": "Nom de la Marque",
      "checkInfo": "Vérifier les informations",
      // end medication page

      // setting page can be added here
      "settings": "Paramètres",
      "editProfile": "Modifier le profil",
      "languageSelection": "Sélection de la langue",
      "aboutUs": "À propos de nous",
      "contactUs": "Contactez-nous",
      "logout": "Se déconnecter",
      "changePhoto": "Changer la photo",
      "fullName": "Nom complet",
      "error": "Erreur",
      "nameCannotBeEmpty": "Le nom ne peut pas être vide",
      "success": "Succès",
      "profileUpdated": "Profil mis à jour avec succès",
      "failedToUpdateProfile": "Échec de la mise à jour du profil",
      "saveChanges": "Sauvegarder les modifications",
      "english": "Anglais",
      "spanish": "Espagnol (Español)",
      "french": "Français (Français)",
      "creole": "Créole",
      "portugese": "Portugais",
      "chinese": "Chinois",
      "russian": "Russe",

      // end setting page

      // recently screen can be added here
      "noMedicationsFound": "Aucun médicament trouvé",
      "genericName": "Nom générique",
      "viewDetails": "Voir les détails",
      "seeAll": "Voir tout",
      // end recently screen
      'generic_name': 'Nom Générique',
      'brand_name': 'Nom de Marque',
      'manufacturer': 'Fabricant',
      'drug_class': 'Classe de Médicament',
      'uses': 'Utilisations',
      'dosage_information': 'Informations sur la Posologie',
      'adults': 'Adultes',
      'children': 'Enfants',
      'elderly': 'Personnes Âgées',
      'how_to_take': 'Comment Prendre',
      'side_effects': 'Effets Secondaires',
      'common': 'Commun',
      'serious': 'Grave',
      'warnings': 'Avertissements',
      'storage_instructions': 'Instructions de Stockage',
      'interactions': 'Interactions',
      'add_notes': 'Ajouter des Notes',
      'save_note': 'Enregistrer la Note',
      'play': 'Jouer',
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
      // scane screen can be added here
      'camera': 'Cámara',
      'photos': 'Fotos',
      // end scane screen

      // medication page can be added here
      "deleteMedication": "Excluir Medicamento",
      "areYouSureDelete": "Tem certeza de que deseja excluir?",
      "cancel": "Cancelar",
      "delete": "Excluir",
      "medications": "Medicamentos",
      "searchMedications": "Buscar Medicamentos",
      "noMedicationsFound": "Nenhum medicamento encontrado.",
      "unknownMedication": "Desconhecido, este medicamento",
      "brandName": "Nome da Marca",
      "checkInfo": "Verificar informações",
      // end medication page

      // setting page can be added here
      "settings": "Configurações",
      "editProfile": "Editar perfil",
      "languageSelection": "Seleção de idioma",
      "aboutUs": "Sobre nós",
      "contactUs": "Contate-nos",
      "logout": "Sair",
      "changePhoto": "Mudar foto",
      "fullName": "Nome completo",
      "error": "Erro",
      "nameCannotBeEmpty": "O nome não pode estar vazio",
      "success": "Sucesso",
      "profileUpdated": "Perfil atualizado com sucesso",
      "failedToUpdateProfile": "Falha ao atualizar o perfil",
      "saveChanges": "Salvar alterações",
      "english": "Inglês",
      "spanish": "Espanhol (Español)",
      "french": "Francês (Français)",
      "creole": "Criolo",
      "portugese": "Português",
      "chinese": "Chinês",
      "russian": "Russo",
      // end setting page

      // recently screen can be added here
      "noMedicationsFound": "Nenhum medicamento encontrado",
      "genericName": "Nome genérico",
      "viewDetails": "Ver detalhes",
      "seeAll": "Ver tudo",

      // end recently screen
      'generic_name': 'Nome Genérico',
      'brand_name': 'Nome da Marca',
      'manufacturer': 'Fabricante',
      'drug_class': 'Classe de Droga',
      'uses': 'Usos',
      'dosage_information': 'Informação de Dosagem',
      'adults': 'Adultos',
      'children': 'Crianças',
      'elderly': 'Idosos',
      'how_to_take': 'Como Tomar',
      'side_effects': 'Efeitos Colaterais',
      'common': 'Comum',
      'serious': 'Sério',
      'warnings': 'Avisos',
      'storage_instructions': 'Instruções de Armazenamento',
      'interactions': 'Interações',
      'add_notes': 'Adicionar Notas',
      'save_note': 'Salvar Nota',
      'play': 'Tocar',
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
      // scane screen can be added here
      'camera': 'Kamera',
      'photos': 'Foto',
      // end scane screen
      // medication page can be added here
      "deleteMedication": "Efase Medikaman",
      "areYouSureDelete": "Eske ou sèten ou vle efase?",
      "cancel": "Anile",
      "delete": "Efase",
      "medications": "Medikaman",
      "searchMedications": "Rechèch Medikaman",
      "noMedicationsFound": "Pataje pa jwenn okenn medikaman.",
      "unknownMedication": "Enkonu, sa a medikaman",
      "brandName": "Non Mak",
      "checkInfo": "Tcheke enfòmasyon",

      // end medication page

      // setting page can be added here
      "settings": "Anviwònman",
      "editProfile": "Modifye pwofil",
      "languageSelection": "Seleksyon lang",
      "aboutUs": "Sou nou",
      "contactUs": "Kontakte nou",
      "logout": "Dekonekte",
      "changePhoto": "Chanje foto",
      "fullName": "Non konplè",
      "error": "Erè",
      "nameCannotBeEmpty": "Non pa ka vid",
      "success": "Siksè",
      "profileUpdated": "Pwofil mete ajou avèk siksè",
      "failedToUpdateProfile": "Echwe mete ajou pwofil la",
      "saveChanges": "Sove chanjman yo",
      "english": "Angle",
      "spanish": "Panyòl (Español)",
      "french": "Franse (Français)",
      "creole": "Kreyòl",
      "portugese": "Pòtigè",
      "chinese": "Chinwa",
      "russian": "Ris",
      // end setting page

      // recently screen can be added here
      "noMedicationsFound": "Pa gen medikaman jwenn",
      "genericName": "Non jeneral",
      "viewDetails": "Gade detay",
      "seeAll": "Gade tout",
      // end recently screen
      'generic_name': 'Non Jenerik',
      'brand_name': 'Non Mak',
      'manufacturer': 'Manifakti',
      'drug_class': 'Klas Dwòg',
      'uses': 'Itilizasyon',
      'dosage_information': 'Enfòmasyon sou Dozaj',
      'adults': 'Granmoun',
      'children': 'Timoun',
      'elderly': 'Granmoun Aje',
      'how_to_take': 'Kijan pou Pran',
      'side_effects': 'Efè Segondè',
      'common': 'Komen',
      'serious': 'Grav',
      'warnings': 'Avètisman',
      'storage_instructions': 'Enstriksyon pou Estoke',
      'interactions': 'Entèraksyon',
      'add_notes': 'Ajoute Nòt',
      'save_note': 'Anrejistre Nòt',
      'play': 'Jwe',
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
      // scane screen can be added here
      'camera': 'Камера',
      'photos': 'Фотографии',
      // end scane screen
      // medication page can be added here
      "deleteMedication": "Удалить лекарство",
      "areYouSureDelete": "Вы уверены, что хотите удалить?",
      "cancel": "Отменить",
      "delete": "Удалить",
      "medications": "Лекарства",
      "searchMedications": "Поиск лекарств",
      "noMedicationsFound": "Лекарства не найдены.",
      "unknownMedication": "Неизвестно, это лекарство",
      "brandName": "Марка",
      "checkInfo": "Проверить информацию",
      // end medication page

      // setting page can be added here
      "settings": "Настройки",
      "editProfile": "Редактировать профиль",
      "languageSelection": "Выбор языка",
      "aboutUs": "О нас",
      "contactUs": "Свяжитесь с нами",
      "logout": "Выйти",
      "changePhoto": "Изменить фото",
      "fullName": "Полное имя",
      "error": "Ошибка",
      "nameCannotBeEmpty": "Имя не может быть пустым",
      "success": "Успех",
      "profileUpdated": "Профиль успешно обновлен",
      "failedToUpdateProfile": "Не удалось обновить профиль",
      "saveChanges": "Сохранить изменения",
      "english": "Английский",
      "spanish": "Испанский (Español)",
      "french": "Французский (Français)",
      "creole": "Креольский",
      "portugese": "Португальский",
      "chinese": "Китайский",
      "russian": "Русский",
      // end setting page

      // recently screen can be added here
      "noMedicationsFound": "Медикаменты не найдены",
      "genericName": "Общее название",
      "viewDetails": "Посмотреть детали",
      "seeAll": "Посмотреть все",
      // end recently screen
      'generic_name': 'Общее Название',
      'brand_name': 'Торговая Марка',
      'manufacturer': 'Производитель',
      'drug_class': 'Класс Препарата',
      'uses': 'Применение',
      'dosage_information': 'Информация о Дозировке',
      'adults': 'Взрослые',
      'children': 'Дети',
      'elderly': 'Пожилые',
      'how_to_take': 'Как Принимать',
      'side_effects': 'Побочные Эффекты',
      'common': 'Обычные',
      'serious': 'Серьёзные',
      'warnings': 'Предупреждения',
      'storage_instructions': 'Инструкции по Хранению',
      'interactions': 'Взаимодействия',
      'add_notes': 'Добавить Заметки',
      'save_note': 'Сохранить Заметку',
      'play': 'Воспроизвести',
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
      // scane screen can be added here
      'camera': '相机',
      'photos': '照片',
      // end scane screen
      // medication page can be added here
      "deleteMedication": "删除药物",
      "areYouSureDelete": "您确定要删除吗？",
      "cancel": "取消",
      "delete": "删除",
      "medications": "药物",
      "searchMedications": "搜索药物",
      "noMedicationsFound": "未找到药物。",
      "unknownMedication": "未知，此药物",
      "brandName": "品牌名称",
      "checkInfo": "检查信息",
      // medication page can be added here

      // setting page can be added here
      "settings": "设置",
      "editProfile": "编辑个人资料",
      "languageSelection": "语言选择",
      "aboutUs": "关于我们",
      "contactUs": "联系我们",
      "logout": "退出",
      "changePhoto": "更改照片",
      "fullName": "全名",
      "error": "错误",
      "nameCannotBeEmpty": "姓名不能为空",
      "success": "成功",
      "profileUpdated": "个人资料更新成功",
      "failedToUpdateProfile": "更新个人资料失败",
      "saveChanges": "保存更改",
      "english": "英语",
      "spanish": "西班牙语 (Español)",
      "french": "法语 (Français)",
      "creole": "克里奥尔语",
      "portugese": "葡萄牙语",
      "chinese": "中文",
      "russian": "俄语",
      // end setting page

      // recently screen can be added here
      // ignore: equal_keys_in_map
      "noMedicationsFound": "未找到药物",
      "genericName": "通用名称",
      "viewDetails": "查看详情",
      "seeAll": "查看全部",

      // end recently screen
      'generic_name': '通用名称',
      'brand_name': '品牌名称',
      'manufacturer': '制造商',
      'drug_class': '药物类别',
      'uses': '用途',
      'dosage_information': '剂量信息',
      'adults': '成人',
      'children': '儿童',
      'elderly': '老年人',
      'how_to_take': '如何服用',
      'side_effects': '副作用',
      'common': '常见',
      'serious': '严重',
      'warnings': '警告',
      'storage_instructions': '存储说明',
      'interactions': '相互作用',
      'add_notes': '添加备注',
      'save_note': '保存备注',
      'play': '播放',
    },
  };
}
