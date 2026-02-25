🖼️ Windows Explorer Preview Unlocker
BAT script to manage file previews in Windows Explorer, including files downloaded from the Internet.

📋 Description
Windows Explorer Preview Unlocker is an interactive batch script that allows you to easily manage file preview settings in Windows Explorer. It solves the common issue of PDF, Word, Excel, and other document files not showing previews, especially those downloaded from the web.

🎯 Problem Solved
Following several Windows updates (particularly since October 2025), many users can no longer view file previews in the File Explorer preview pane. This occurs because:

Preview Handlers are disabled.

Windows automatically blocks files downloaded from the Internet for security.

The "Mark of the Web" (MOTW) prevents previews of files considered unsafe.

This script addresses all these issues through a simple and intuitive interface.

✨ Features
🔧 Preview Handlers Management
✅ Enable/Disable preview handlers for all file types.

📄 Supports PDF, Word, Excel, PowerPoint, images, and more.

🔄 Reversible changes at any time.

🌐 Internet File Management
🔓 Allow previews for files downloaded from the Internet.

🔒 Restore security blocking (recommended).

📂 Mass unlock all files within a folder.

🔍 Support for recursive subfolders.

🛠️ Diagnostic Tools
📊 Check current status of all settings.

⚙️ Full reset to Windows default settings.

💡 Informative messages and security warnings.

🎨 User Interface
📱 Easy-to-use interactive menu.

🇬🇧 Fully available in English.

⚠️ Clear and understandable security warnings.

✅ Detailed feedback for every operation.

🚀 Installation
Requirements
Windows 10 or Windows 11.

Administrator privileges.

PowerShell (already included in Windows).

Download
Option 1 - Release Download (Recommended):

Download the latest version from the Releases page.

Option 2 - Clone Repository:

Bash
git clone https://github.com/eddux/WindowsPreviewUnlocker.git
Option 3 - Direct Download:

Download the WindowsExplorerPreviewUnlocker.bat file directly.

📖 Usage
Running the Script
Right-click the WindowsExplorerPreviewUnlocker.bat file.

Select "Run as administrator".

Choose the desired option from the menu.

Main Menu
========================================================
    WINDOWS EXPLORER FILE PREVIEW MANAGEMENT
========================================================

PREVIEW HANDLERS MANAGEMENT:
[1] Enable File Preview (Activate Preview Handlers)
[2] Disable File Preview (Deactivate Preview Handlers)

INTERNET FILE MANAGEMENT:
[3] Allow Preview of Files Downloaded from Internet
[4] Block Preview of Internet Files (Default/Secure)
[5] Unlock Files in a Specific Folder

DIAGNOSTICS:
[6] Check Current Status
[7] Restore Windows Default Settings

[0] Exit
========================================================
🎓 Quick Guide
To enable previews for all files:
Run the script as administrator.

Choose option [1] - Enable Preview Handlers.

Activate the preview pane in File Explorer (View → Preview pane).

To see previews of files downloaded from the Internet:
Choose option [3] - Allow preview of Internet files.

Confirm with Y (read the security warnings!).

Restart your browser.

To unlock already downloaded files:
Choose option [5] - Unlock folder.

Enter the path (e.g., C:\Users\YourName\Downloads).

Choose whether to include subfolders.

🔑 Modified Registry Keys
The script modifies only 3 registry keys:

1. Preview Handlers (Current User)
HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced
Value: ShowPreviewHandlers
- 0 = Disabled (default)
- 1 = Enabled
Controls whether preview handlers display file content.

2. Internet File Blocking (Current User)
HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments
Value: SaveZoneInformation
- 1 = DO NOT block (allow preview)
- 2 = Block (default, secure)
Determines if Windows marks files downloaded by the current user.

3. Internet File Blocking (System)
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments
Value: SaveZoneInformation
- 1 = DO NOT block (allow preview)
- 2 = Block (default, secure)
Determines if Windows marks downloaded files for all users.

⚠️ Security Warnings
🔓 Disabling Internet File Blocking
⚠️ WARNING: Option [3] disables a Windows security protection!

Risks:

🦠 Files downloaded from the Internet may contain malware.

🚫 You will no longer receive security warnings for potentially dangerous files.

🔓 Increases the attack surface of your system.

Use this option ONLY if:

✅ You only download files from completely trusted sources.

✅ You have an updated and active antivirus.

✅ You fully understand the security risks.

Recommendation: Use option [5] to unlock only specific folders instead of completely disabling protection.

🔄 Reversibility
All changes are fully reversible:

✅ Option [2] → Disable preview handlers.

✅ Option [4] → Restore Internet file blocking.

✅ Option [7] → Restore EVERYTHING to Windows defaults.

❓ FAQ (Frequently Asked Questions)
Q: Previews still don't work after enabling Preview Handlers.
A: Ensure you:

Enable the preview pane: File Explorer → View → Preview pane.

Have the appropriate software installed (Adobe Reader for PDF, Office for Word/Excel).

If the file is from the Internet, unlock it using option [5].

Q: Is it safe to disable Internet file blocking?
A: No, it reduces security. It is better to:

Keep blocking active (option [4]).

Unlock only specific folders with trusted files (option [5]).

Q: Do changes work only for me or for all users?
A: The script modifies both:

HKEY_CURRENT_USER (for you only).

HKEY_LOCAL_MACHINE (for all users, requires admin).

Q: Does it work on Windows Home?
A: Yes! The script interacts with the registry directly, not via Group Policy, so it works on all Windows editions.

Q: Can I use this script on multiple PCs?
A: Yes, it is fully portable. Just copy the BAT file to other PCs.

Q: Does the script modify other settings besides the registry?
A: No, it only modifies the 3 listed registry keys. Option [5] uses PowerShell to remove attributes from files but does not modify the registry.

Q: What exactly does option [5] do?
A: It uses the PowerShell command Unblock-File to remove the "Zone.Identifier" attribute from files, which is what causes the block.

🛠️ Troubleshooting
Problem: "Access Denied" when running the script.
Solution: Always run as administrator (Right-click → Run as administrator).

Problem: PDF preview does not work.
Solution:

Install Adobe Acrobat Reader DC (free).

Set Adobe as the default PDF reader.

In Adobe: Edit → Preferences → General → Enable PDF thumbnail previews in Windows Explorer.

Problem: Office files (Word/Excel) do not show previews.
Solution:

Install Microsoft Office.

Repair Office: Settings → Apps → Microsoft Office → Modify → Repair.

Ensure Office is up to date.

Problem: Preview works for some files but not others.
Solution: Files might be blocked individually:

Right-click the file → Properties → Unlock.

Or use option [5] to unlock the entire folder.

🤝 Contributing
Contributions, bug reports, and feature requests are welcome!

Fork the project.

Create a branch for your feature (git checkout -b feature/AmazingFeature).

Commit your changes (git commit -m 'Add some AmazingFeature').

Push to the branch (git push origin feature/AmazingFeature).

Open a Pull Request.

For more details, see CONTRIBUTING.md.

📝 Changelog
v1.0.0 (2026-02-04)
✨ Initial release.

✅ Preview Handlers management.

🌐 Internet file blocking management.

📂 Mass folder unlocking.

🔍 System status diagnostics.

⚙️ Default settings restoration.

📄 License
Distributed under the MIT License. See LICENSE for more information.

👨‍💻 Author
Created by eddux with ❤️ for the Windows community.

🙏 Acknowledgments
Microsoft for registry key documentation.

Windows community for feedback on preview issues.

All users who tested the script.

📞 Support
If you have issues or questions:

🐛 Open an Issue on GitHub.

💬 Join the Discussions.

⭐ If this helped you
If this project helped you, consider leaving a star ⭐ on GitHub!

Note: This script is provided "as is", without warranty of any kind. Use at your own risk. Always back up your registry before making modifications.

Would you like me to translate this into any other language, or perhaps help you draft the CONTRIBUTING.md file mentioned in the text?

# 🖼️ Windows Explorer Preview Unlocker

> Script BAT per gestire l'anteprima dei file in Windows Explorer, inclusi i file scaricati da Internet

[![Windows](https://img.shields.io/badge/Windows-10%2F11-0078D6?logo=windows&logoColor=white)](https://www.microsoft.com/windows)
[![Batch](https://img.shields.io/badge/Batch-Script-4EAA25?logo=windowsterminal&logoColor=white)](https://en.wikipedia.org/wiki/Batch_file)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/eddux/WindowsPreviewUnlocker/blob/main/LICENSE)
[![Language](https://img.shields.io/badge/Language-Italian-green.svg)](README.md)
[![Release](https://img.shields.io/github/v/release/eddux/WindowsPreviewUnlocker)](https://github.com/eddux/WindowsPreviewUnlocker/releases)
[![Downloads](https://img.shields.io/github/downloads/eddux/WindowsPreviewUnlocker/total)](https://github.com/eddux/WindowsPreviewUnlocker/releases)

## 📋 Descrizione

**Windows Explorer Preview Unlocker** è uno script batch interattivo che permette di gestire facilmente le impostazioni di anteprima dei file in Windows Explorer. Risolve il problema comune dei file PDF, Word, Excel e altri documenti che non mostrano l'anteprima, specialmente quelli scaricati da Internet.

### 🎯 Problema Risolto

Dopo alcuni aggiornamenti di Windows (specialmente da ottobre 2025), molti utenti non riescono più a visualizzare l'anteprima dei file nel riquadro di anteprima di Esplora File. Questo accade perché:

1. I **Preview Handlers** sono disabilitati
2. Windows **blocca automaticamente** i file scaricati da Internet per sicurezza
3. Il "Mark of the Web" (MOTW) impedisce l'anteprima dei file considerati non sicuri

Questo script risolve tutti questi problemi con un'interfaccia semplice e intuitiva.

## ✨ Caratteristiche

### 🔧 Gestione Preview Handlers
- ✅ Abilita/Disabilita i gestori di anteprima per tutti i tipi di file
- 📄 Supporta PDF, Word, Excel, PowerPoint, immagini e altro
- 🔄 Modifiche reversibili in qualsiasi momento

### 🌐 Gestione File da Internet
- 🔓 Permetti l'anteprima dei file scaricati da Internet
- 🔒 Ripristina il blocco di sicurezza (raccomandato)
- 📂 Sblocca massivamente tutti i file in una cartella
- 🔍 Supporto per sottocartelle ricorsive

### 🛠️ Strumenti di Diagnostica
- 📊 Verifica lo stato corrente di tutte le impostazioni
- ⚙️ Ripristino completo alle impostazioni predefinite di Windows
- 💡 Messaggi informativi e avvisi di sicurezza

### 🎨 Interfaccia Utente
- 📱 Menu interattivo facile da usare
- 🇮🇹 Completamente in italiano
- ⚠️ Avvisi di sicurezza chiari e comprensibili
- ✅ Feedback dettagliato per ogni operazione

## 🚀 Installazione

### Requisiti
- Windows 10 o Windows 11
- Privilegi di amministratore
- PowerShell (già incluso in Windows)

### Download

**Opzione 1 - Download Release (Consigliato):**

Scarica l'ultima versione dalla pagina [Releases](https://github.com/eddux/WindowsPreviewUnlocker/releases/latest)

**Opzione 2 - Clone Repository:**
```bash
git clone https://github.com/eddux/WindowsPreviewUnlocker.git
```

**Opzione 3 - Download Diretto:**

Scarica il file [`WindowsExplorerPreviewUnlocker.bat`](https://github.com/eddux/WindowsPreviewUnlocker/raw/main/WindowsExplorerPreviewUnlocker.bat) direttamente

## 📖 Utilizzo

### Avvio dello Script

1. **Fai clic destro** sul file `WindowsExplorerPreviewUnlocker.bat`
2. Seleziona **"Esegui come amministratore"**
3. Scegli l'opzione desiderata dal menu

### Menu Principale

```
========================================================
   GESTIONE ANTEPRIMA FILE IN WINDOWS EXPLORER
========================================================

GESTIONE PREVIEW HANDLERS:
[1] Abilita Anteprima File (Attiva Preview Handlers)
[2] Disabilita Anteprima File (Disattiva Preview Handlers)

GESTIONE FILE DA INTERNET:
[3] Permetti Anteprima File Scaricati da Internet
[4] Blocca Anteprima File da Internet (Predefinito/Sicuro)
[5] Sblocca File in una Cartella Specifica

DIAGNOSTICA:
[6] Verifica Stato Attuale
[7] Ripristina Impostazioni Predefinite Windows

[0] Esci
========================================================
```

### 🎓 Guida Rapida

#### Per abilitare l'anteprima di tutti i file:
1. Esegui lo script come amministratore
2. Scegli opzione **[1]** - Abilita Preview Handlers
3. Attiva il riquadro di anteprima in Esplora File (Visualizza → Riquadro di anteprima)

#### Per vedere l'anteprima dei file scaricati da Internet:
1. Scegli opzione **[3]** - Permetti anteprima file da Internet
2. Conferma con **S** (leggi gli avvisi di sicurezza!)
3. Riavvia il browser

#### Per sbloccare file già scaricati:
1. Scegli opzione **[5]** - Sblocca cartella
2. Inserisci il percorso (es: `C:\Users\TuoNome\Downloads`)
3. Scegli se includere le sottocartelle

## 🔑 Chiavi di Registro Modificate

Lo script modifica **solo 3 chiavi di registro**:

### 1. Preview Handlers (Utente Corrente)
```
HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced
Valore: ShowPreviewHandlers
- 0 = Disabilitato (default)
- 1 = Abilitato
```
Controlla se i gestori di anteprima mostrano il contenuto dei file

### 2. Blocco File Internet (Utente Corrente)
```
HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments
Valore: SaveZoneInformation
- 1 = NON bloccare (permetti anteprima)
- 2 = Blocca (default, sicuro)
```
Determina se Windows marca i file scaricati dall'utente corrente

### 3. Blocco File Internet (Sistema)
```
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments
Valore: SaveZoneInformation
- 1 = NON bloccare (permetti anteprima)
- 2 = Blocca (default, sicuro)
```
Determina se Windows marca i file scaricati per tutti gli utenti

## ⚠️ Avvisi di Sicurezza

### 🔓 Disabilitare il Blocco dei File da Internet

**⚠️ ATTENZIONE:** L'opzione **[3]** disabilita una protezione di sicurezza di Windows!

**Rischi:**
- 🦠 I file scaricati da Internet potrebbero contenere malware
- 🚫 Non riceverai più avvisi di sicurezza per file potenzialmente pericolosi
- 🔓 Aumenta la superficie di attacco del tuo sistema

**Usa questa opzione SOLO se:**
- ✅ Scarichi file solo da fonti completamente fidate
- ✅ Hai un antivirus aggiornato e sempre attivo
- ✅ Comprendi completamente i rischi di sicurezza

**Raccomandazione:** Usa l'opzione **[5]** per sbloccare solo cartelle specifiche invece di disabilitare completamente la protezione.

## 🔄 Reversibilità

**Tutte le modifiche sono completamente reversibili:**

- ✅ Opzione **[2]** → Disabilita preview handlers
- ✅ Opzione **[4]** → Ripristina blocco file Internet
- ✅ Opzione **[7]** → Ripristina TUTTO ai default di Windows

## ❓ FAQ (Domande Frequenti)

### Q: L'anteprima non funziona ancora dopo aver abilitato i Preview Handlers
**A:** Assicurati di:
1. Attivare il riquadro di anteprima: Esplora File → Visualizza → Riquadro di anteprima
2. Avere installato il software appropriato (Adobe Reader per PDF, Office per Word/Excel)
3. Se il file è scaricato da Internet, sbloccalo con l'opzione [5]

### Q: È sicuro disabilitare il blocco dei file da Internet?
**A:** No, riduce la sicurezza. È meglio:
- Mantenere il blocco attivo (opzione [4])
- Sbloccare solo le cartelle specifiche con file fidati (opzione [5])

### Q: Le modifiche funzionano solo per me o per tutti gli utenti?
**A:** Lo script modifica entrambi:
- `HKEY_CURRENT_USER` (solo per te)
- `HKEY_LOCAL_MACHINE` (per tutti gli utenti, richiede admin)

### Q: Funziona su Windows Home?
**A:** Sì! Lo script usa il registro direttamente, non Group Policy, quindi funziona su tutte le edizioni di Windows.

### Q: Posso usare questo script su più PC?
**A:** Sì, è completamente portatile. Basta copiare il file BAT su altri PC.

### Q: Lo script modifica altre impostazioni oltre al registro?
**A:** No, modifica solo le 3 chiavi di registro elencate. L'opzione [5] usa PowerShell per rimuovere gli attributi dai file, ma non modifica il registro.

### Q: Cosa fa esattamente l'opzione [5]?
**A:** Usa il comando PowerShell `Unblock-File` per rimuovere l'attributo "Zone.Identifier" dai file, che è ciò che causa il blocco.

## 🛠️ Troubleshooting

### Problema: "Accesso negato" quando eseguo lo script
**Soluzione:** Esegui sempre come amministratore (clic destro → Esegui come amministratore)

### Problema: L'anteprima PDF non funziona
**Soluzione:**
1. Installa Adobe Acrobat Reader DC (gratuito)
2. Imposta Adobe come lettore PDF predefinito
3. In Adobe: Modifica → Preferenze → Generale → Abilita miniature PDF in Explorer

### Problema: I file Office (Word/Excel) non mostrano anteprima
**Soluzione:**
1. Installa Microsoft Office
2. Ripara Office: Impostazioni → App → Microsoft Office → Modifica → Ripara
3. Assicurati che Office sia aggiornato

### Problema: L'anteprima funziona per alcuni file ma non per altri
**Soluzione:** I file potrebbero essere bloccati individualmente:
- Clic destro sul file → Proprietà → Sblocca
- Oppure usa l'opzione [5] per sbloccare l'intera cartella

## 🤝 Contribuire

Contributi, segnalazioni di bug e richieste di funzionalità sono benvenuti!

1. Fai un fork del progetto
2. Crea un branch per la tua feature (`git checkout -b feature/AmazingFeature`)
3. Committa le modifiche (`git commit -m 'Add some AmazingFeature'`)
4. Pusha sul branch (`git push origin feature/AmazingFeature`)
5. Apri una Pull Request

Per maggiori dettagli, consulta [CONTRIBUTING.md](CONTRIBUTING.md)

## 📝 Changelog

### v1.0.0 (2026-02-04)
- ✨ Release iniziale
- ✅ Gestione Preview Handlers
- 🌐 Gestione blocco file da Internet
- 📂 Sblocco massivo cartelle
- 🔍 Diagnostica stato sistema
- ⚙️ Ripristino impostazioni default

## 📄 Licenza

Distribuito sotto licenza MIT. Vedi [LICENSE](LICENSE) per maggiori informazioni.

## 👨‍💻 Autore

Creato da [eddux](https://github.com/eddux) con ❤️ per la community italiana di Windows

## 🙏 Ringraziamenti

- Microsoft per la documentazione delle chiavi di registro
- Community di Windows per i feedback sui problemi di anteprima
- Tutti gli utenti che hanno testato lo script

## 📞 Supporto

Se hai problemi o domande:
- 🐛 Apri una [Issue su GitHub](https://github.com/eddux/WindowsPreviewUnlocker/issues)
- 💬 Partecipa alle [Discussioni](https://github.com/eddux/WindowsPreviewUnlocker/discussions)

## ⭐ Se ti è stato utile

Se questo progetto ti ha aiutato, considera di lasciare una stella ⭐ su GitHub!

[![Stargazers](https://reporoster.com/stars/eddux/WindowsPreviewUnlocker)](https://github.com/eddux/WindowsPreviewUnlocker/stargazers)

---

**Nota:** Questo script è fornito "così com'è", senza garanzie di alcun tipo. Usa a tuo rischio e pericolo. Fai sempre un backup del registro prima di modificarlo.
