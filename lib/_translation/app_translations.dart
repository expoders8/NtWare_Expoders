import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          /// home
          "welcome": "Welcome",
          "noMatchDevice": "No matching device found",
          "logInToDevice": "Log in to your device",
          "holdYourPhone": "Hold your phone to the reader and tap \n Log in",
          "logIn": "Log in",
          "scanning": "Scanning",
          "holdPhoneToReaderAndTap":
              "Hold phone to a @name reader and tap the ID button below.",
          "holdPhoneToReaderAndTapAppropriate":
              "Hold phone to a @name reader and tap the appropriate ID button below.",
          "loadYourCards": "LOAD YOUR CARDS",

          /// home_screen_x
          "bluetoothRequired": "Bluetooth Required!",
          "turnOnBluetooth": "Please Turn ON the bluetooth to proceed.",
          "goToSettings": "GO TO SETTINGS",
          "authenticated": "Authenticated",
          "unableToAuthenticate": "Unable to authenticate",

          /// auth view\
          ///
          /// otp_input_view
          "otpSendToMobileNumber":
              "We sent an OTP on your registered mobile number.",
          "required": "Required",
          "invalidOtp": "Invalid Otp",
          "resendOTP": "Resend OTP",
          "resendOTPInNSec": "Resend in @n s",
          "verifyOTP": "VERIFY OTP",
          "otpResent": "OTP resent!",

          /// auth_screen_x
          "sorrySomethingWentWrong":
              "Something went wrong. Please try again later.",
          "invalidQrCode":
              "QR Code is invalid or expired. Please try again generating new QR Code.",

          /// qr_code_scanner
          "scanQrCodeByAdmin":
              "Please scan the QR code provided by the company admin.",

          /// about_us_screen
          "aboutUs": "About Us",
          "ntwareAboutUsText":
              "NT-ware, a Canon Europe company, develops the market-leading print and scan management applications uniFLOW and uniFLOW Online. Our products provide secure (cloud-based) printing, scanning, and cost control of multi-functional devices in the office. By combining a BLE card reader with uniFLOW or uniFLOW Online, organizations can lock devices while allowing authorized users quick and easy access to a device. The MiCard PLUS BLE card reader includes Bluetooth® Low Energy technology, enabling users to identify at a device by using their smartphone. They need to download the NT-ware MiCard PLUS BLE Badge app from Apple App Store or Google Play Store and can start using the BLE functionality of the card reader.",
          "waveIdAboutUsText":
              "rf IDEAS is your go-to authority for access control, partnering with leading technology companies to provide authentication, identification and logical access control solutions for single sign-on, multifunction printing, manufacturing processes, dispensing, computer and network access, attendance tracking, interactive kiosks and other secure identity applications. Together with our partners, we support a broad range of enterprises, including healthcare, manufacturing, government, education and more.This app is created and designed by our partner, TNETIC. Visit @website for more information about their services and contact details.",

          /// rssi_setting_dialog
          "rssiThreshhold": "RSSI Threshhold",
          "dbi": "dbi",
          "invalidValue": "Invalid value.",
          "ok": "Ok",
          "cancel": "Cancel",

          /// eula screen
          "EULA": "EULA",

          /// settings_screen
          "settings": "Settings",
          "resetApp": "Reset App",

          /// settings_screen_x
          "resetApplication": "Reset Application?",
          "resetApplicationMessage":
              "This action will clear all your cards, and log you out.",
          "reset": "RESET",

          /// ble_utils
          "locationRequired": "Location Permission Required!",
          "locationRequiredMessage":
              "Please grant Location Permissions in order for the BLE to work.",

          /// language
          "Japanese": "Japanese",
          "French": "French",
          "Italian": "Italian",
          "German": "German",
          "Spanish": "Spanish",
          "English": "English",
        },
        'es_Es': {
          "welcome": "Bienvenido",
          "noMatchDevice": "No se han encontrado dispositivos que coincidan",
          "logInToDevice": "Inicie sesión en el dispositivo",
          "holdYourPhone":
              "Acerque el teléfono al lector y toque \n Iniciar sesión",
          "logIn": "Iniciar sesión",
          "scanning": "Escaneado",
          "holdPhoneToReaderAndTap":
              "Acerque el teléfono a un lector @name y toque el botón ID.",
          "holdPhoneToReaderAndTapAppropriate":
              "Acerque el teléfono a un lector @name y toque el botón ID correspondiente.",
          "loadYourCards": "CARGAR TARJETAS",
          "bluetoothRequired": "¡Se requiere Bluetooth!",
          "turnOnBluetooth": "Active Bluetooth para continuar.",
          "goToSettings": "VAYA A CONFIGURACIÓN",
          "authenticated": "Autenticado",
          "unableToAuthenticate": "No se puede autenticar",
          "otpSendToMobileNumber":
              "Hemos enviado una contraseña de un solo uso a su número de móvil registrado.",
          "required": "Requerido",
          "invalidOtp": "Contraseña de un solo uso no válida",
          "resendOTP": "Reenviar contraseña de un solo uso",
          "resendOTPInNSec": "Reenviar en @n s",
          "verifyOTP": "VERIFICAR CONTRASEÑA DE UN SOLO USO ",
          "otpResent": "¡Contraseña de un solo uso reenviada!",
          "sorrySomethingWentWrong":
              "Se ha producido un error. Vuelva a intentarlo más tarde.",
          "invalidQrCode":
              "Código QR no válido o caducado. Vuelva a intentar generar un nuevo código QR.",
          "scanQrCodeByAdmin":
              "Escanee el código QR suministrado por el administrador de la empresa.",
          "aboutUs": "Acerca de nosotros",
          "ntwareAboutUsText":
              "NT-ware es una compañía de Canon Europe que desarrolla uniFLOW y uniFLOW Online, aplicaciones de gestión de impresión y escaneado líderes del mercado. Nuestros productos brindan funciones seguras a través de la nube para la impresión, el escaneado y el control de costes de dispositivos multifunción en la oficina. La combinación de un lector de tarjetas BLE con uniFLOW o uniFLOW Online permite a las organizaciones bloquear dispositivos al tiempo que proporcionan a los usuarios autorizados acceso rápido y fácil a un dispositivo. El lector de tarjetas MiCard PLUS BLE incluye tecnología Bluetooth® Low Energy, que permite a los usuarios identificarse en un dispositivo con su smartphone. Solo tienen que descargar la aplicación NT-ware MiCard PLUS BLE Badge desde Apple App Store o Google Play Store para empezar a utilizar las funciones de BLE del lector de tarjetas.",
          "waveIdAboutUsText":
              "rf IDEAS es un experto reconocido en control de accesos que colabora con empresas tecnológicas líderes para proporcionar soluciones de autenticación, identificación y control lógico de accesos para inicio de sesión, impresión multifunción, procesos de fabricación, dispensación, acceso a ordenadores y redes, control de asistencias, kioscos interactivos y otras aplicaciones de identidad segura. En colaboración con nuestros socios, ofrecemos apoyo a una amplia gama de empresas, incluidas de asistencia sanitaria, fabricación, administración del Estado, educación, etc. Esta aplicación ha sido creada y diseñada por nuestro socio TNETIC. Visite @website para obtener más información sobre sus servicios y datos de contacto.",
          "rssiThreshhold": "Umbral de RSSI",
          "dbi": "dbi",
          "invalidValue": "Valor no válido.",
          "ok": "Aceptar",
          "cancel": "Cancelar",
          "EULA": "EULA",
          "settings": "Configuración",
          "resetApp": "Reiniciar aplicación",
          "resetApplication": "¿Reiniciar aplicación?",
          "resetApplicationMessage":
              "Esta acción borrará todas las tarjetas y cerrará la sesión.",
          "reset": "REINICIAR",
          "locationRequired": "¡Se requieren permisos de localización!",
          "locationRequiredMessage":
              "Conceda permisos de localización para que BLE pueda funcionar.",
          "Japanese": "Japanese",
          "French": "French",
          "Italian": "Italian",
          "German": "German",
          "Spanish": "Spanish",
          "English": "English",
        },
        'ja_JP': {
          "welcome": "ようこそ",
          "noMatchDevice": "適合するデバイスが見つかりません",
          "logInToDevice": "デバイスにログインしてください",
          "holdYourPhone": "スマートフォンをリーダーにタッチし、ログインをタップしてください",
          "logIn": "ログイン",
          "scanning": "スキャン",
          "holdPhoneToReaderAndTap": "スマートフォンをリーダーにタッチし、ログインをタップしてください",
          "holdPhoneToReaderAndTapAppropriate":
              "スマートフォンを@nameリーダーにタッチして、 下の適切なIDボタンをタップしてください。",
          "loadYourCards": "カードを読み込む",
          "bluetoothRequired": "Bluetoothが必要です。",
          "turnOnBluetooth": "Bluetoothをオンにしてください。",
          "goToSettings": "［設定］に進む",
          "authenticated": "認証されました",
          "unableToAuthenticate": "認証できません",
          "otpSendToMobileNumber": "ご登録の電話番号にOTPを送信しました",
          "required": "必須",
          "invalidOtp": "無効なOTP",
          "resendOTP": "OTPの再送信",
          "resendOTPInNSec": "@n秒以内に再送信します",
          "verifyOTP": "OTPの検証",
          "otpResent": "OTPを再送信しました。",
          "sorrySomethingWentWrong": "問題が発生しました。後で再試行してください。",
          "invalidQrCode": "QRコードが無効か、期限が切れています。新しいQRコードを再度生成してください。",
          "scanQrCodeByAdmin": "会社の管理者から提供されたQRコードをスキャンしてください。",
          "aboutUs": "アプリについて",
          "ntwareAboutUsText":
              "NT-wareは、キヤノンの欧州地域グループ会社で、市場をリードする印刷/スキャンの管理アプリケーションであるuniFLOWとuniFLOW Onlineを開発しています。当社の製品は、オフィスの複合機でのセキュアな（クラウドベース含め）印刷、スキャン、コスト管理を行うためのものです。BLEカードリーダーをuniFLOWまたはuniFLOW Onlineと組み合わせて使うことで、組織はデバイスをロックしながら、承認されたユーザーがデバイスに迅速かつ簡単にアクセスできるようにすることができるようになります。MiCard PLUS BLEカードリーダーには、BlueTooth® Low Energyテクノロジーが搭載されており、ユーザーは自分のスマートフォンをつかってデバイスで認証することができます。ユーザーはApple App Store またはGoogle PlayストアからNT-ware MiCard PLUS BLE Badge アプリをダウンロードする必要があり、そのアプリでカードリーダーのBLE機能を使うことができるようになります。",
          "waveIdAboutUsText":
              "アクセス制御の認証はrf IDEASが行っており、先端テクノロジー企業と提携しながら、シングルサインオン、多機能印刷、製造工程、調剤、コンピューター/ネットワークアクセス、出欠記録、インタラクティブキオスク、その他のID保護アプリケーション向けの認証、身元特定、論理アクセス制御ソリューションを提供しています。当社はパートナーと提携することで、医療、製造、行政、教育などの多様な分野の企業を支援しています。このアプリは、当社のパートナーであるTNETICによって開発、設計されたものです。同社のサービスおよびお問い合わせ先については、@websiteをご覧ください。",
          "rssiThreshhold": "RSSIしきい値",
          "dbi": "dbi",
          "invalidValue": "無効な値です。",
          "ok": "OK",
          "cancel": "キャンセル",
          "EULA": "使用許諾契約",
          "settings": "設定",
          "resetApp": "アプリのリセット",
          "resetApplication": "アプリケーションをリセットしますか?",
          "resetApplicationMessage": "リセットすると、カード情報がクリアされ、ログアウトします。",
          "reset": "リセット",
          "locationRequired": "ロケーションの権限が必要です。",
          "locationRequiredMessage": "BLEを機能させるには、ロケーションの権限を取得してください。",
          // "Language": "言語",
          "Japanese": "Japanese",
          "French": "French",
          "Italian": "Italian",
          "German": "German",
          "Spanish": "Spanish",
          "English": "English",
        },
        'fr_FR': {
          "welcome": "Bienvenue",
          "noMatchDevice": "Aucun périphérique correspondant détecté",
          "logInToDevice": "Connectez-vous à votre périphérique",
          "holdYourPhone":
              "Approchez votre téléphone du lecteur et appuyez sur \n Connexion",
          "logIn": "Connexion",
          "scanning": "Numérisation",
          "holdPhoneToReaderAndTap":
              "Approchez le téléphone d'un lecteur @name et appuyez sur le bouton ID ci-dessous.",
          "holdPhoneToReaderAndTapAppropriate":
              "Approchez le téléphone d'un lecteur @name et appuyez sur le bouton ID approprié ci-dessous.",
          "loadYourCards": "CHARGEZ VOS CARTES",
          "bluetoothRequired": "Bluetooth requis !",
          "turnOnBluetooth": "Activez la fonction Bluetooth pour continuer.",
          "goToSettings": "ACCEDEZ AUX PARAMETRES",
          "authenticated": "Authentifié",
          "unableToAuthenticate": "Authentification impossible",
          "otpSendToMobileNumber":
              "Nous avons envoyé un mot de passe à usage unique (OTP) à votre numéro de téléphone portable enregistré.",
          "required": "Obligatoire",
          "invalidOtp": "OTP non valide",
          "resendOTP": "Renvoyer OTP",
          "resendOTPInNSec": "Renvoyer dans @n s",
          "verifyOTP": "VERIFIER OTP",
          "otpResent": "OTP renvoyé !",
          "sorrySomethingWentWrong":
              "Une erreur est survenue. Veuillez réessayer ultérieurement.",
          "invalidQrCode":
              "Le code QR n'est pas valide ou a expiré. Tentez à nouveau de générer un code QR.",
          "scanQrCodeByAdmin":
              "Lisez le code QR fourni par l'administrateur de l'entreprise.",
          "aboutUs": "Informations nous concernant",
          "ntwareAboutUsText":
              "NT-ware, une société Canon Europe, développe les applications de gestion de l'impression et de la numérisation de pointe uniFLOW et uniFLOW Online. Ses produits fournissent des fonctions d'impression (Cloud) sécurisée, de numérisation et de contrôle des coûts des périphériques multifonctions dans un bureau. En associant un lecteur de cartes BLE à uniFLOW ou uniFLOW Online, les entreprises peuvent verrouiller les périphériques tout en autorisant les utilisateurs habilités à accéder rapidement et facilement à un matériel. Le lecteur de cartes MiCard PLUS BLE intègre la technologie Bluetooth® Low Energy, qui permet aux utilisateurs de s'identifier sur un périphérique à l'aide de leur smartphone. Ils doivent télécharger l'application NT-ware MiCard PLUS BLE Badge depuis l'Apple App Store ou Google Play Store pour commencer à utiliser la fonctionnalité BLE du lecteur de cartes.",
          "waveIdAboutUsText":
              "rf IDEAS est l'organisme de référence en matière de contrôle d'accès. Il collabore avec les entreprises de technologies de pointe pour fournir des solutions d'authentification, d'identification et de contrôle d'accès logique afin de prendre en charge l'authentification unique, l'impression multifonction, les processus industriels, la gestion des ordonnances, l'accès informatique et réseau, le suivi des présences, les kiosques interactifs et autres applications d'identité sécurisées. En tandem avec nos partenaires, nous accompagnons un large éventail d'entreprises dans les secteurs de la santé, de l'industrie, des administrations publiques, de l'enseignement, etc. Cette application est créée et conçue par notre partenaire, TNETIC. Rendez-vous sur @website pour obtenir des informations complémentaires concernant ses services et coordonnées.",
          "rssiThreshhold": "Seuil RSSI",
          "dbi": "dbi",
          "invalidValue": "Valeur non valide.",
          "ok": "OK",
          "cancel": "Annuler",
          "EULA": "CLUF",
          "settings": "Paramètres",
          "resetApp": "Réinitialiser l'application",
          "resetApplication": "Voulez-vous réinitialiser l'application ?",
          "resetApplicationMessage":
              "Cette action effacera toutes vos cartes et vous déconnectera.",
          "reset": "REINITIALISER",
          "locationRequired": "Autorisation d'emplacement requise !",
          "locationRequiredMessage":
              "Veuillez accorder les autorisations d'emplacement pour que BLE fonctionne.",
          "Japanese": "Japanese",
          "French": "French",
          "Italian": "Italian",
          "German": "German",
          "Spanish": "Spanish",
          "English": "English",
        },
        'it_IT': {
          "welcome": "Benvenuto",
          "noMatchDevice": "Nessun dispositivo corrispondente trovato",
          "logInToDevice": "Accedi al dispositivo",
          "holdYourPhone": "Avvicina il telefono al lettore e tocca \n Accedi",
          "logIn": "Accedi",
          "scanning": "Scansione",
          "holdPhoneToReaderAndTap":
              "Avvicina il telefono a un lettore @name e tocca il pulsante ID qui sotto.",
          "holdPhoneToReaderAndTapAppropriate":
              "Avvicina il telefono a un lettore @name e tocca il pulsante ID appropriato qui sotto.",
          "loadYourCards": "CARICA LE CARD",
          "bluetoothRequired": "È richiesta la connettività Bluetooth.",
          "turnOnBluetooth": "Attiva Bluetooth per procedere.",
          "goToSettings": "VAI ALLE IMPOSTAZIONI",
          "authenticated": "Autenticazione eseguita",
          "unableToAuthenticate": "Impossibile autenticare",
          "otpSendToMobileNumber":
              "Abbiamo inviato un codice OTP al tuo numero di cellulare registrato.",
          "required": "Obbligatorio",
          "invalidOtp": "OTP non valido",
          "resendOTP": "Reinvia OTP",
          "resendOTPInNSec": "Reinvio tra @n sec.",
          "verifyOTP": "VERIFICA OTP",
          "otpResent": "OTP reinviato!",
          "sorrySomethingWentWrong":
              "Si è verificato un problema. Riprova più tardi.",
          "invalidQrCode":
              "QR code non valido o scaduto. Prova a generare un nuovo QR code.",
          "scanQrCodeByAdmin":
              "Scansiona il QR code fornito dall'amministratore aziendale.",
          "aboutUs": "Informazioni sull'azienda",
          "ntwareAboutUsText":
              "NT-ware, un'azienda Canon Europe, sviluppa le applicazioni leader di mercato per la gestione della stampa e della scansione uniFLOW e uniFLOW Online. I nostri prodotti forniscono servizi protetti (via cloud) di stampa, scansione e controllo dei costi per i dispositivi multifunzione utilizzati negli uffici. Combinando un lettore di schede BLE con uniFLOW o uniFLOW Online, le aziende possono bloccare i dispositivi e consentire agli utenti autorizzati di accedervi in modo semplice e rapido. Il lettore di schede MiCard PLUS BLE include la tecnologia Bluetooth® Low Energy, che permette di identificarsi su un dispositivo utilizzando il proprio smartphone. L'utente deve semplicemente scaricare l'app NT-ware MiCard PLUS BLE Badge da Apple App Store o Google Play Store per iniziare a utilizzare la funzionalità BLE del lettore di schede.",
          "waveIdAboutUsText":
              "rf IDEAS è un software ideale per il controllo degli accessi, che grazie a partnership con aziende tecnologiche di primo piano fornisce soluzioni di autenticazione, identificazione e controllo accessi logico per contesti quali single sign-on, stampa multifunzione, processi di produzione, prescrizioni mediche, accesso a computer e reti, registrazione delle presenze, chioschi interattivi e altre applicazioni di sicurezza basate sull'identità. In collaborazione con i nostri partner, supportiamo un'ampia gamma di aziende in settori quali sanità, produzione industriale, pubblica amministrazione, istruzione, ecc. Questa app è stata progettata e creata dal nostro partner TNETIC. Visita @website per maggiori informazioni sui loro servizi e per i dati di contatto.",
          "rssiThreshhold": "Soglia RSSI",
          "dbi": "dbi",
          "invalidValue": "Valore non valido.",
          "ok": "OK",
          "cancel": "Annulla",
          "EULA": "EULA",
          "settings": "Impostazioni",
          "resetApp": "Ripristina app",
          "resetApplication": "Ripristinare l'applicazione?",
          "resetApplicationMessage":
              "A seguito di questa operazione, tutte le tue schede saranno cancellate e sarai disconnesso.",
          "reset": "RIPRISTINA",
          "locationRequired":
              "Sono richieste le autorizzazioni relative alla posizione.",
          "locationRequiredMessage":
              "Per abilitare la funzionalità BLE, concedi le autorizzazioni per la posizione.",
          "Japanese": "Japanese",
          "French": "French",
          "Italian": "Italian",
          "German": "German",
          "Spanish": "Spanish",
          "English": "English",
        },
        'de_DE': {
          "welcome": "Willkommen",
          "noMatchDevice": "Kein entsprechendes Gerät gefunden",
          "logInToDevice": "Melden Sie sich bei Ihrem Gerät an",
          "holdYourPhone":
              "Halten Sie Ihr Smartphone an das Lesegerät und tippen Sie auf \n Anmelden",
          "logIn": "Anmelden",
          "scanning": "Scannen",
          "holdPhoneToReaderAndTap":
              "Halten Sie Ihr Smartphone an ein @name-Lesegerät und tippen Sie auf die ID-Schaltfläche unten.",
          "holdPhoneToReaderAndTapAppropriate":
              "Halten Sie Ihr Smartphone an ein @name-Lesegerät und tippen Sie auf die passende ID-Schaltfläche unten.",
          "loadYourCards": "KARTEN LADEN",
          "bluetoothRequired": "Bluetooth erforderlich!",
          "turnOnBluetooth": "Schalten Sie Bluetooth EIN, um fortzufahren.",
          "goToSettings": "ZU EINSTELLUNGEN GEHEN",
          "authenticated": "Authentifiziert",
          "unableToAuthenticate": "Authentifizierung fehlgeschlagen",
          "otpSendToMobileNumber":
              "Wir haben einen OTP an Ihre registrierte Handynummer gesendet.",
          "required": "Erforderlich",
          "invalidOtp": "Ungültiger OTP",
          "resendOTP": "OTP erneut senden",
          "resendOTPInNSec": "In @n Sekunden erneut senden",
          "verifyOTP": "OTP VERIFIZIEREN",
          "otpResent": "OTP erneut gesendet!",
          "sorrySomethingWentWrong":
              "Es ist ein Fehler aufgetreten. Bitte versuchen Sie es später noch einmal.",
          "invalidQrCode":
              "QR-Code ist ungültig oder abgelaufen. Bitte generieren Sie einen neuen QR-Code.",
          "scanQrCodeByAdmin":
              "Scannen Sie den von Ihrem Systemadministrator bereitgestellten QR-Code ein.",
          "aboutUs": "Über uns",
          "ntwareAboutUsText":
              "NT-ware, ein Unternehmen von Canon Europe, entwickelt die marktführenden Anwendungen uniFLOW und uniFLOW Online zur Verwaltung von Druck- und Scanvorgängen. Unsere Produkte bieten sicheres (cloud-basiertes) Drucken und Scannen sowie Kostenkontrolle für Multifunktionsgeräte in Büroumgebungen. Durch die Kombination eines BLE-Kartenlesers mit uniFLOW oder uniFLOW Online können Unternehmen Geräte sperren und autorisierten Benutzern gleichzeitig schnellen und einfachen Zugriff auf ein Gerät ermöglichen. Der MiCard PLUS BLE-Kartenleser verwendet Bluetooth® Low Energy-Technologie, die Benutzern ermöglicht, sich über ihr Smartphone bei einem Gerät zu identifizieren. Sie müssen die NT-ware MiCard PLUS BLE Badge-App aus dem Apple App Store oder dem Google Play Store herunterladen, um die BLE-Funktionalität des Kartenlesers nutzen zu können.",
          "waveIdAboutUsText":
              "rf IDEAS ist Ihr Ansprechpartner für die Zugriffskontrolle. In Zusammenarbeit mit führenden Technologieunternehmen bieten wir Lösungen für Authentifizierung, Identifizierung und logische Zugriffskontrolle für Single Sign-On, Multifunktionsdruck, Fertigungsprozesse, Dispensieren, Computer- und Netzwerkzugriff, Anwesenheitsverfolgung, interaktive Kioske und andere sichere Identitätsanwendungen. Gemeinsam mit unseren Partnern unterstützen wir eine breite Palette von Sektoren wie Gesundheitswesen, Fertigung, Verwaltungsbehörden, Bildungswesen und viele mehr. Diese App wurde von unserem Partner TNETIC entworfen und entwickelt. Besuchen Sie @website für nähere Informationen zu ihren Leistungen und Kontaktdaten.",
          "rssiThreshhold": "RSSI-Schwellenwert",
          "dbi": "dBi",
          "invalidValue": "Ungültiger Wert.",
          "ok": "OK",
          "cancel": "Abbrechen",
          "EULA": "EULA",
          "settings": "Einstellungen",
          "resetApp": "App zurücksetzen",
          "resetApplication": "Anwendung zurücksetzen?",
          "resetApplicationMessage":
              "Mit dieser Aktion werden alle Ihre Karten gelöscht und Sie werden abgemeldet.",
          "reset": "ZURÜCKSETZEN",
          "locationRequired": "Standortberechtigung erforderlich!",
          "locationRequiredMessage":
              "Bitte gewähren Sie Standortberechtigungen, damit BLE funktionieren kann.",
          "Japanese": "Japanese",
          "French": "French",
          "Italian": "Italian",
          "German": "German",
          "Spanish": "Spanish",
          "English": "English",
        },
      };
}
