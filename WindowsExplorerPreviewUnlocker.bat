@echo off
:: =========================================================
:: Script per Abilitare/Disabilitare l'Anteprima dei File
:: Include supporto per file scaricati da Internet
:: Gestisce PDF, Word, Excel e altri documenti in Windows
:: =========================================================

:: Verifica privilegi amministrativi
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo.
    echo ====================================
    echo ATTENZIONE: Privilegi Amministrativi Richiesti
    echo ====================================
    echo.
    echo Questo script deve essere eseguito come Amministratore.
    echo Fai clic destro sul file e seleziona "Esegui come amministratore"
    echo.
    pause
    exit /b
)

:MENU
cls
echo.
echo ========================================================
echo    GESTIONE ANTEPRIMA FILE IN WINDOWS EXPLORER
echo ========================================================
echo.
echo Questo script gestisce i Preview Handlers che permettono
echo di visualizzare il contenuto dei file (PDF, Word, Excel,
echo PowerPoint, immagini, ecc.) nel riquadro di anteprima
echo di Esplora File senza aprirli.
echo.
echo ========================================================
echo.
echo GESTIONE PREVIEW HANDLERS:
echo [1] Abilita Anteprima File (Attiva Preview Handlers)
echo [2] Disabilita Anteprima File (Disattiva Preview Handlers)
echo.
echo GESTIONE FILE DA INTERNET:
echo [3] Permetti Anteprima File Scaricati da Internet
echo [4] Blocca Anteprima File da Internet (Predefinito/Sicuro)
echo [5] Sblocca File in una Cartella Specifica
echo.
echo DIAGNOSTICA:
echo [6] Verifica Stato Attuale
echo [7] Ripristina Impostazioni Predefinite Windows
echo.
echo [0] Esci
echo.
echo ========================================================
echo.
set /p scelta="Inserisci la tua scelta (0-7): "

if "%scelta%"=="1" goto ABILITA
if "%scelta%"=="2" goto DISABILITA
if "%scelta%"=="3" goto PERMETTI_INTERNET
if "%scelta%"=="4" goto BLOCCA_INTERNET
if "%scelta%"=="5" goto SBLOCCA_CARTELLA
if "%scelta%"=="6" goto VERIFICA
if "%scelta%"=="7" goto RIPRISTINA
if "%scelta%"=="0" goto FINE
echo.
echo Scelta non valida. Riprova.
timeout /t 2 >nul
goto MENU

:ABILITA
cls
echo.
echo ========================================================
echo    ABILITAZIONE ANTEPRIMA FILE
echo ========================================================
echo.
echo Sto abilitando i gestori di anteprima nel registro...
echo.

:: Abilita ShowPreviewHandlers nel registro di sistema
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowPreviewHandlers /t REG_DWORD /d 1 /f >nul 2>&1

if %errorLevel% equ 0 (
    echo [OK] Gestori di anteprima ABILITATI con successo!
) else (
    echo [ERRORE] Si e verificato un problema durante l'abilitazione.
)

echo.
echo --------------------------------------------------------
echo NOTA IMPORTANTE:
echo --------------------------------------------------------
echo.
echo 1. Le modifiche sono state applicate al tuo profilo utente
echo 2. Potrebbe essere necessario riavviare Esplora Risorse
echo 3. Per attivare il riquadro anteprima:
echo    - Apri Esplora File
echo    - Menu Visualizza ^> Riquadro di anteprima
echo.
echo 4. Se alcuni file non mostrano l'anteprima:
echo    - Assicurati che il software appropriato sia installato
echo      (Adobe Reader per PDF, Microsoft Office per Word/Excel)
echo    - I file scaricati da Internet potrebbero essere bloccati
echo      (usa l'opzione 3 per risolverlo)
echo.
echo --------------------------------------------------------
echo.
pause
goto MENU

:DISABILITA
cls
echo.
echo ========================================================
echo    DISABILITAZIONE ANTEPRIMA FILE
echo ========================================================
echo.
echo Sto disabilitando i gestori di anteprima nel registro...
echo.

:: Disabilita ShowPreviewHandlers nel registro di sistema
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowPreviewHandlers /t REG_DWORD /d 0 /f >nul 2>&1

if %errorLevel% equ 0 (
    echo [OK] Gestori di anteprima DISABILITATI con successo!
) else (
    echo [ERRORE] Si e verificato un problema durante la disabilitazione.
)

echo.
echo --------------------------------------------------------
echo NOTA:
echo --------------------------------------------------------
echo.
echo L'anteprima dei file e stata disabilitata.
echo Le immagini continueranno a essere visualizzate nel
echo riquadro di anteprima, ma i documenti (PDF, Office, ecc.)
echo non mostreranno piu il loro contenuto.
echo.
echo Puoi riabilitare l'anteprima in qualsiasi momento
echo eseguendo nuovamente questo script e scegliendo
echo l'opzione 1.
echo.
echo --------------------------------------------------------
echo.
pause
goto MENU

:PERMETTI_INTERNET
cls
echo.
echo ========================================================
echo    PERMETTI ANTEPRIMA FILE DA INTERNET
echo ========================================================
echo.
echo ATTENZIONE - LEGGERE ATTENTAMENTE:
echo --------------------------------------------------------
echo.
echo Questa opzione DISABILITA il blocco di sicurezza di Windows
echo per i file scaricati da Internet, permettendone l'anteprima
echo immediata senza il messaggio di avviso.
echo.
echo RISCHI:
echo - I file scaricati da Internet potrebbero contenere malware
echo - Non riceverai piu avvisi di sicurezza per file potenzialmente
echo   pericolosi
echo - Aumenta la superficie di attacco del tuo sistema
echo.
echo CONSIGLIATO SOLO SE:
echo - Scarichi file solo da fonti fidate
echo - Hai un buon antivirus aggiornato
echo - Comprendi i rischi di sicurezza
echo.
echo --------------------------------------------------------
echo.
set /p conferma="Sei sicuro di voler continuare? (S/N): "
if /i not "%conferma%"=="S" (
    echo.
    echo Operazione annullata.
    timeout /t 2 >nul
    goto MENU
)

echo.
echo Sto modificando le impostazioni del registro...
echo.

:: Crea la chiave Attachments se non esiste
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments" /f >nul 2>&1

:: Imposta SaveZoneInformation a 1 per non salvare informazioni sulla zona
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v SaveZoneInformation /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v SaveZoneInformation /t REG_DWORD /d 1 /f >nul 2>&1

if %errorLevel% equ 0 (
    echo [OK] Impostazioni modificate con successo!
    echo.
    echo Da ora in poi, Windows NON marchera piu i file scaricati
    echo da Internet e permettera l'anteprima immediata.
) else (
    echo [ERRORE] Si e verificato un problema durante la modifica.
)

echo.
echo --------------------------------------------------------
echo IMPORTANTE:
echo --------------------------------------------------------
echo.
echo 1. Questa modifica si applica ai file scaricati DA ORA
echo 2. I file gia scaricati rimarranno bloccati
echo    (usa l'opzione 5 per sbloccarli)
echo 3. Riavvia il browser per applicare le modifiche
echo 4. Puoi ripristinare il blocco di sicurezza con l'opzione 4
echo.
echo --------------------------------------------------------
echo.
pause
goto MENU

:BLOCCA_INTERNET
cls
echo.
echo ========================================================
echo    BLOCCA ANTEPRIMA FILE DA INTERNET
echo ========================================================
echo.
echo Sto ripristinando il blocco di sicurezza per i file
echo scaricati da Internet...
echo.

:: Imposta SaveZoneInformation a 2 per salvare informazioni sulla zona (default Windows)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v SaveZoneInformation /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v SaveZoneInformation /t REG_DWORD /d 2 /f >nul 2>&1

if %errorLevel% equ 0 (
    echo [OK] Blocco di sicurezza RIPRISTINATO con successo!
    echo.
    echo Windows tornera a marcare i file scaricati da Internet
    echo e richiedera lo sblocco manuale per l'anteprima.
) else (
    echo [ERRORE] Si e verificato un problema durante il ripristino.
)

echo.
echo --------------------------------------------------------
echo NOTA:
echo --------------------------------------------------------
echo.
echo Hai ripristinato la protezione predefinita di Windows.
echo Questo e il comportamento raccomandato per la sicurezza.
echo.
echo I file scaricati da Internet richiederanno uno sblocco
echo manuale prima di poter essere visualizzati in anteprima.
echo.
echo --------------------------------------------------------
echo.
pause
goto MENU

:SBLOCCA_CARTELLA
cls
echo.
echo ========================================================
echo    SBLOCCA FILE IN UNA CARTELLA
echo ========================================================
echo.
echo Questa funzione sblocca tutti i file in una cartella
echo specifica, rimuovendo il blocco di sicurezza di Windows.
echo.
echo ATTENZIONE: Usa questa funzione solo per cartelle
echo contenenti file di cui ti fidi completamente.
echo.
echo --------------------------------------------------------
echo.
set /p percorso="Inserisci il percorso completo della cartella (es. C:\Download): "

if not exist "%percorso%" (
    echo.
    echo [ERRORE] La cartella specificata non esiste.
    echo.
    pause
    goto MENU
)

echo.
echo Vuoi sbloccare anche i file nelle sottocartelle?
set /p sottocartelle="(S per Si, N per No): "

echo.
echo Sto sbloccando i file...
echo.

if /i "%sottocartelle%"=="S" (
    :: Sblocca ricorsivamente
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-ChildItem -Path '%percorso%' -Recurse -File | Unblock-File -Confirm:$false"
) else (
    :: Sblocca solo la cartella principale
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-ChildItem -Path '%percorso%' -File | Unblock-File -Confirm:$false"
)

if %errorLevel% equ 0 (
    echo.
    echo [OK] File sbloccati con successo!
    echo.
    echo I file nella cartella specificata sono ora sbloccati
    echo e possono essere visualizzati in anteprima.
) else (
    echo.
    echo [AVVISO] L'operazione e stata completata con alcuni errori.
    echo Alcuni file potrebbero non essere stati sbloccati.
)

echo.
echo --------------------------------------------------------
echo.
pause
goto MENU

:VERIFICA
cls
echo.
echo ========================================================
echo    VERIFICA STATO ANTEPRIMA FILE
echo ========================================================
echo.
echo Controllo lo stato attuale delle impostazioni...
echo.
echo --------------------------------------------------------
echo.

:: 1. Verifica ShowPreviewHandlers
echo [1] GESTORI DI ANTEPRIMA:
for /f "tokens=3" %%a in ('reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowPreviewHandlers 2^>nul ^| find "ShowPreviewHandlers"') do set VALORE_PREVIEW=%%a

if not defined VALORE_PREVIEW (
    echo    Stato: NON CONFIGURATO (default: disabilitato)
) else (
    if "%VALORE_PREVIEW%"=="0x1" (
        echo    Stato: ABILITATO
    ) else (
        echo    Stato: DISABILITATO
    )
)

echo.
echo --------------------------------------------------------
echo.

:: 2. Verifica SaveZoneInformation (HKEY_CURRENT_USER)
echo [2] BLOCCO FILE DA INTERNET (Utente Corrente):
for /f "tokens=3" %%a in ('reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v SaveZoneInformation 2^>nul ^| find "SaveZoneInformation"') do set VALORE_ZONE_USER=%%a

if not defined VALORE_ZONE_USER (
    echo    Stato: NON CONFIGURATO (default: bloccato)
) else (
    if "%VALORE_ZONE_USER%"=="0x1" (
        echo    Stato: PERMESSO - File da Internet NON bloccati
        echo           ^(Anteprima permessa, sicurezza ridotta^)
    ) else if "%VALORE_ZONE_USER%"=="0x2" (
        echo    Stato: BLOCCATO - File da Internet bloccati
        echo           ^(Anteprima bloccata, sicurezza normale^)
    ) else (
        echo    Stato: Valore non standard: %VALORE_ZONE_USER%
    )
)

echo.
echo --------------------------------------------------------
echo.

:: 3. Verifica SaveZoneInformation (HKEY_LOCAL_MACHINE)
echo [3] BLOCCO FILE DA INTERNET (Sistema):
for /f "tokens=3" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v SaveZoneInformation 2^>nul ^| find "SaveZoneInformation"') do set VALORE_ZONE_SYSTEM=%%a

if not defined VALORE_ZONE_SYSTEM (
    echo    Stato: NON CONFIGURATO (default: bloccato)
) else (
    if "%VALORE_ZONE_SYSTEM%"=="0x1" (
        echo    Stato: PERMESSO - File da Internet NON bloccati
        echo           ^(Anteprima permessa, sicurezza ridotta^)
    ) else if "%VALORE_ZONE_SYSTEM%"=="0x2" (
        echo    Stato: BLOCCATO - File da Internet bloccati
        echo           ^(Anteprima bloccata, sicurezza normale^)
    ) else (
        echo    Stato: Valore non standard: %VALORE_ZONE_SYSTEM%
    )
)

echo.
echo ========================================================
echo.
echo RIEPILOGO:
echo.
if "%VALORE_PREVIEW%"=="0x1" (
    echo - Preview Handlers: ABILITATI
) else (
    echo - Preview Handlers: DISABILITATI
)
echo.
if "%VALORE_ZONE_USER%"=="0x1" (
    echo - Protezione File Internet: DISATTIVATA ^(meno sicuro^)
) else (
    echo - Protezione File Internet: ATTIVA ^(raccomandato^)
)
echo.
echo ========================================================
echo.
pause
goto MENU

:RIPRISTINA
cls
echo.
echo ========================================================
echo    RIPRISTINA IMPOSTAZIONI PREDEFINITE WINDOWS
echo ========================================================
echo.
echo Questa opzione ripristinera tutte le impostazioni
echo ai valori predefiniti di Windows:
echo.
echo - Preview Handlers: Disabilitati
echo - Blocco file da Internet: Abilitato (sicuro)
echo.
echo --------------------------------------------------------
echo.
set /p conferma="Sei sicuro di voler ripristinare? (S/N): "
if /i not "%conferma%"=="S" (
    echo.
    echo Operazione annullata.
    timeout /t 2 >nul
    goto MENU
)

echo.
echo Sto ripristinando le impostazioni predefinite...
echo.

:: Ripristina ShowPreviewHandlers (disabilitato)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowPreviewHandlers /t REG_DWORD /d 0 /f >nul 2>&1

:: Ripristina SaveZoneInformation (bloccato)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v SaveZoneInformation /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v SaveZoneInformation /t REG_DWORD /d 2 /f >nul 2>&1

if %errorLevel% equ 0 (
    echo [OK] Impostazioni ripristinate con successo!
    echo.
    echo Tutte le impostazioni sono state riportate ai valori
    echo predefiniti di Windows (sicuri).
) else (
    echo [ERRORE] Si e verificato un problema durante il ripristino.
)

echo.
echo --------------------------------------------------------
echo.
pause
goto MENU

:FINE
cls
echo.
echo ========================================================
echo Grazie per aver utilizzato questo script!
echo ========================================================
echo.
echo Per qualsiasi problema con l'anteprima dei file:
echo.
echo 1. Assicurati che il riquadro anteprima sia attivo
echo    in Esplora File (Visualizza ^> Riquadro anteprima)
echo.
echo 2. Verifica che i programmi appropriati siano installati:
echo    - Adobe Reader / Foxit / Edge per PDF
echo    - Microsoft Office per Word/Excel/PowerPoint
echo.
echo 3. Controlla le Opzioni cartella:
echo    - Visualizza ^> Opzioni ^> Visualizzazione
echo    - "Mostra gestori di anteprima nel riquadro Anteprima"
echo.
echo 4. Per i file scaricati da Internet:
echo    - Usa l'opzione 3 per permettere l'anteprima (meno sicuro)
echo    - Oppure sblocca manualmente: clic destro ^> Proprieta ^> Sblocca
echo.
echo ========================================================
echo.
echo RACCOMANDAZIONI SULLA SICUREZZA:
echo.
echo - Mantieni il blocco dei file da Internet ATTIVO se possibile
echo - Sblocca solo i file di cui ti fidi completamente
echo - Mantieni sempre un antivirus aggiornato
echo.
echo ========================================================
echo.
pause
exit