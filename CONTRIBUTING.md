# 🤝 Guida per Contribuire

Grazie per il tuo interesse nel contribuire a **Windows Preview Unlocker**! 

## 📋 Come Contribuire

### 🐛 Segnalare Bug

Se hai trovato un bug, apri una [Issue](https://github.com/eddux/WindowsPreviewUnlocker/issues) includendo:

- **Descrizione del problema**: Cosa non funziona?
- **Versione di Windows**: Windows 10 o 11? Quale build?
- **Passaggi per riprodurre**: Come possiamo replicare il problema?
- **Comportamento atteso**: Cosa dovrebbe succedere?
- **Comportamento attuale**: Cosa succede invece?
- **Screenshot**: Se possibile, allega immagini
- **Log**: Eventuali messaggi di errore

### 💡 Suggerire Funzionalità

Hai un'idea per migliorare lo script? Perfetto!

1. Apri una [Issue](https://github.com/eddux/WindowsPreviewUnlocker/issues)
2. Usa il tag `enhancement`
3. Descrivi dettagliatamente la funzionalità
4. Spiega perché sarebbe utile
5. Proponi un'implementazione se hai idee

### 🔧 Contribuire al Codice

#### Setup Sviluppo

1. Fai un **fork** del repository
2. Clona il tuo fork:
   ```bash
   git clone https://github.com/tuo-username/WindowsPreviewUnlocker.git
   ```
3. Crea un branch per la tua feature:
   ```bash
   git checkout -b feature/nome-feature
   ```

#### Standard di Codifica

Per mantenere il codice pulito e consistente:

**Commenti:**
- Usa commenti chiari in italiano
- Documenta le sezioni complesse
- Spiega il "perché", non solo il "cosa"

**Stile:**
- Mantieni l'indentazione consistente
- Usa nomi di variabili descrittivi
- Mantieni le righe sotto gli 80 caratteri quando possibile

**Best Practices:**
- Testa su Windows 10 e Windows 11
- Verifica che funzioni come utente normale e amministratore
- Assicurati che tutte le modifiche siano reversibili
- Aggiungi messaggi di feedback chiari

**Sicurezza:**
- Non aggiungere modifiche che riducono la sicurezza senza avvisi chiari
- Documenta tutti i rischi di sicurezza
- Non raccogliere dati utente
- Non eseguire codice esterno

#### Process di Sviluppo

1. **Scrivi il codice**
   - Implementa la tua feature/fix
   - Segui gli standard di codifica

2. **Testa**
   - Testa su diverse configurazioni Windows
   - Verifica che le modifiche al registro funzionino
   - Controlla la reversibilità

3. **Documenta**
   - Aggiorna il README.md se necessario
   - Aggiungi commenti nel codice
   - Documenta eventuali nuove chiavi di registro

4. **Committa**
   ```bash
   git add .
   git commit -m "✨ Aggiungi [descrizione breve della feature]"
   ```
   
   Usa emoji nei commit:
   - ✨ `:sparkles:` Nuova feature
   - 🐛 `:bug:` Bug fix
   - 📝 `:memo:` Documentazione
   - 🔧 `:wrench:` Configurazione
   - ⚡ `:zap:` Performance
   - 🔒 `:lock:` Sicurezza
   - ♻️ `:recycle:` Refactoring

5. **Push**
   ```bash
   git push origin feature/nome-feature
   ```

6. **Pull Request**
   - Vai su GitHub
   - Apri una Pull Request verso il branch `main`
   - Descrivi cosa hai cambiato e perché
   - Referenzia eventuali issue correlate (#numero)

### 📝 Checklist Pull Request

Prima di inviare la PR, assicurati:

- [ ] Il codice è stato testato su Windows 10 e/o 11
- [ ] Tutti i menu funzionano correttamente
- [ ] Le modifiche sono documentate nel codice
- [ ] Il README.md è aggiornato (se necessario)
- [ ] Le modifiche sono reversibili
- [ ] Non ci sono errori di sintassi
- [ ] I messaggi sono in italiano corretto
- [ ] Gli avvisi di sicurezza sono presenti (se applicabile)

## 🎨 Linee Guida per l'UI

Se modifichi l'interfaccia utente:

- Mantieni lo stile ASCII art esistente
- Usa linee `=` per separatori principali
- Usa linee `-` per separatori secondari
- Mantieni i messaggi chiari e concisi
- Usa emoji per migliorare la leggibilità (opzionale)

## 🧪 Testing

### Test Manuali

Testa almeno questi scenari:

1. **Abilita/Disabilita Preview Handlers**
   - Verifica che l'anteprima funzioni/non funzioni

2. **Gestione File Internet**
   - Scarica un file da Internet
   - Verifica che venga bloccato/sbloccato correttamente

3. **Sblocco Cartella**
   - Crea una cartella con file bloccati
   - Sblocca con e senza sottocartelle

4. **Verifica Stato**
   - Controlla che mostri lo stato corretto

5. **Ripristino**
   - Verifica che riporti tutto ai default

## 📖 Documentazione

Se aggiungi funzionalità:

1. Aggiorna il README.md:
   - Sezione caratteristiche
   - Sezione utilizzo
   - FAQ se necessario

2. Aggiorna i commenti nel codice

3. Se modifichi chiavi di registro:
   - Documenta nella sezione "Chiavi di Registro"
   - Spiega cosa fa la chiave
   - Indica i valori possibili

## ❓ Domande?

Hai domande su come contribuire?

- Apri una [Discussion](https://github.com/eddux/WindowsPreviewUnlocker/discussions)
- Chiedi nella sezione Q&A

## 🙏 Grazie!

Ogni contributo è apprezzato, che sia:
- 🐛 Segnalare un bug
- 💡 Suggerire una feature
- 📝 Migliorare la documentazione
- 🔧 Contribuire codice
- ⭐ Mettere una stella al progetto
- 📢 Condividere il progetto

Il tuo aiuto rende questo progetto migliore per tutti! 🎉

---

**Nota:** Tutti i contributori sono tenuti a rispettare il nostro [Code of Conduct](CODE_OF_CONDUCT.md) (da creare).
