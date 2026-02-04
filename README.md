# 🖼️ Windows Preview Unlocker

> Script BAT per gestire l'anteprima dei file in Windows Explorer, inclusi i file scaricati da Internet

[![Windows](https://img.shields.io/badge/Windows-10%2F11-0078D6?logo=windows&logoColor=white)](https://www.microsoft.com/windows)
[![Batch](https://img.shields.io/badge/Batch-Script-4EAA25?logo=windowsterminal&logoColor=white)](https://en.wikipedia.org/wiki/Batch_file)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/eddux/WindowsPreviewUnlocker/blob/main/LICENSE)
[![Language](https://img.shields.io/badge/Language-Italian-green.svg)](README.md)
[![Release](https://img.shields.io/github/v/release/eddux/WindowsPreviewUnlocker)](https://github.com/eddux/WindowsPreviewUnlocker/releases)
[![Downloads](https://img.shields.io/github/downloads/eddux/WindowsPreviewUnlocker/total)](https://github.com/eddux/WindowsPreviewUnlocker/releases)

## 📋 Descrizione

**Windows Preview Unlocker** è uno script batch interattivo che permette di gestire facilmente le impostazioni di anteprima dei file in Windows Explorer. Risolve il problema comune dei file PDF, Word, Excel e altri documenti che non mostrano l'anteprima, specialmente quelli scaricati da Internet.

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
