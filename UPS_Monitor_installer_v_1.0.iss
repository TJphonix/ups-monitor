; -------------------------
; UPS Monitor Installer
; -------------------------

[Setup]
AppName=UPS Monitor
AppVersion=1.0
DefaultDirName={userappdata}\UPS Monitor
DefaultGroupName=UPS Monitor
DisableProgramGroupPage=no
OutputDir=output
OutputBaseFilename=UPS_Monitor_Setup
Compression=lzma
SolidCompression=yes
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
PrivilegesRequired=lowest
;PrivilegesRequiredOverridesAllowed=dialog
UninstallDisplayIcon={app}\ups_tray.exe
Uninstallable=yes
WizardStyle=modern
SetupIconFile=dist\UPS_Monitor\resources\ups.ico
SetupLogging=yes

; -------------------------
; Files da installare
; -------------------------
[Files]
Source: "dist\UPS_Monitor\ups_tray.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "dist\UPS_Monitor\ups_dashboard_digital_display.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "dist\UPS_Monitor\_internal\*"; DestDir: "{app}\_internal"; Flags: recursesubdirs ignoreversion skipifsourcedoesntexist
Source: "dist\UPS_Monitor\resources\languages\*"; DestDir: "{app}\resources\languages"; Flags: recursesubdirs ignoreversion
Source: "dist\UPS_Monitor\resources\paypal.gif"; DestDir: "{app}\resources"; Flags: ignoreversion
; config.json NON sovrascritto se già esiste
Source: "dist\UPS_Monitor\resources\config.json"; DestDir: "{app}\resources"; Flags: onlyifdoesntexist uninsneveruninstall
Source: "dist\UPS_Monitor\resources\ups.ico"; DestDir: "{app}\resources"; Flags: ignoreversion
Source: "dist\UPS_Monitor\resources\ups.png"; DestDir: "{app}\resources"; Flags: ignoreversion
Source: "dist\UPS_Monitor\resources\batteria-carica-50.png"; DestDir: "{app}\resources"; Flags: ignoreversion
Source: "dist\UPS_Monitor\resources\batteria-carica-a-metà-50.png"; DestDir: "{app}\resources"; Flags: ignoreversion
Source: "dist\UPS_Monitor\resources\batteria-in-carica-50.png"; DestDir: "{app}\resources"; Flags: ignoreversion
Source: "dist\UPS_Monitor\resources\batteria-scarica-50.png"; DestDir: "{app}\resources"; Flags: ignoreversion

; -------------------------
; Menu Start
; -------------------------
[Icons]
Name: "{group}\UPS Monitor"; Filename: "{app}\ups_tray.exe"
Name: "{group}\Disinstalla UPS Monitor"; Filename: "{uninstallexe}"
Name: "{userdesktop}\UPS Monitor"; Filename: "{app}\ups_tray.exe"; IconFilename: "{app}\resources\ups.ico"; Tasks: desktopicon

; -------------------------
; Avvio automatico
; -------------------------
[Run]
Filename: "{app}\ups_tray.exe"; Description: "{cm:RunDescription}"; Flags: nowait postinstall skipifsilent

[Registry]
; Imposta avvio automatico per l’utente corrente (chiave HKCU)
Root: HKCU; Subkey: "Software\Microsoft\Windows\CurrentVersion\Run"; ValueType: string; ValueName: "UPS Monitor"; ValueData: """{app}\ups_tray.exe"""; Flags: uninsdeletevalue

; -------------------------
; Forza chiusura app in esecuzione prima di cancellare i file
; -------------------------
[UninstallRun]
Filename: "taskkill"; Parameters: "/IM ups_tray.exe /F"; Flags: runhidden
Filename: "taskkill"; Parameters: "/IM ups_dashboard_digital_display.exe /F"; Flags: runhidden

; -------------------------
; Disinstallazione completa
; -------------------------
[UninstallDelete]
Type: files; Name: "{app}\ups_tray.exe"
Type: files; Name: "{app}\ups_dashboard_digital_display.exe"
Type: files; Name: "{app}\resources\languages\*"
;Type: files; Name: "{app}\resources\*"
Type: files; Name: "{app}\resources\ups.ico"
Type: files; Name: "{app}\resources\ups.png"
Type: files; Name: "{app}\resources\batteria-carica-50.png"
Type: files; Name: "{app}\resources\batteria-carica-a-metà-50.png"
Type: files; Name: "{app}\resources\batteria-in-carica-50.png"
Type: files; Name: "{app}\resources\batteria-scarica-50.png"
Type: files; Name: "{app}\resources\paypal.gif"
Type: files; Name: "{app}\resources\languages\*"
Type: files; Name: "{app}\_internal\*"
Type: dirifempty; Name: "{app}\resources\languages"
Type: dirifempty; Name: "{app}\resources"
Type: dirifempty; Name: "{app}\_internal"
Type: dirifempty; Name: "{app}"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopLinkPrompt}"; Flags: unchecked

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl";
Name: "italian"; MessagesFile: "compiler:Languages\Italian.isl"
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"
Name: "french"; MessagesFile: "compiler:Languages\French.isl"
Name: "german"; MessagesFile: "compiler:Languages\German.isl"
Name: "portuguese"; MessagesFile: "compiler:Languages\Portuguese.isl"


[CustomMessages]
italian.DisclaimerTitle=Informazioni
italian.DisclaimerSubtitle=Supporta lo sviluppo di UPS Monitor
italian.DonateButton=Fai una donazione ❤️
italian.RunDescription=Avvia UPS Monitor
italian.KeepConfigPrompt=Vuoi mantenere la configurazione di UPS Monitor (config.json)?
italian.CreateDesktopLinkPrompt=Crea un collegamento sul desktop

english.DisclaimerTitle=Information
english.DisclaimerSubtitle=Support UPS Monitor development
english.DonateButton=Donate ❤️
english.RunDescription=Start UPS Monitor
english.KeepConfigPrompt=Do you want to keep UPS Monitor configuration (config.json)?
english.CreateDesktopLinkPrompt=Create a desktop shortcut

spanish.DisclaimerTitle=Información
spanish.DisclaimerSubtitle=Apoya el desarrollo de UPS Monitor
spanish.DonateButton=Donar ❤️
spanish.RunDescription=Iniciar UPS Monitor
spanish.KeepConfigPrompt=¿Desea conservar la configuración de UPS Monitor (config.json)?
spanish.CreateDesktopLinkPrompt=Crear un acceso directo en el escritorio

french.DisclaimerTitle=Informations
french.DisclaimerSubtitle=Soutenez le développement de UPS Monitor
french.DonateButton=Faire un don ❤️
french.RunDescription=Lancer UPS Monitor
french.KeepConfigPrompt=Voulez-vous conserver la configuration de UPS Monitor (config.json) ?
french.CreateDesktopLinkPrompt=Créer un raccourci sur le bureau

german.DisclaimerTitle=Informationen
german.DisclaimerSubtitle=Unterstützen Sie die Entwicklung von UPS Monitor
german.DonateButton=Spenden ❤️
german.RunDescription=UPS Monitor starten
german.KeepConfigPrompt=Möchten Sie die Konfiguration von UPS Monitor (config.json) behalten?
german.CreateDesktopLinkPrompt=Erstellen Sie eine Desktop-Verknüpfung

portuguese.DisclaimerTitle=Informações
portuguese.DisclaimerSubtitle=Apoie o desenvolvimento do UPS Monitor
portuguese.DonateButton=Doar ❤️
portuguese.RunDescription=Iniciar UPS Monitor
portuguese.KeepConfigPrompt=Deseja manter a configuração do UPS Monitor (config.json)?
portuguese.CreateDesktopLinkPrompt=Crie um atalho na área de trabalho


[Code]
var
  DisclaimerPage: TWizardPage;
  DisclaimerMemo: TMemo;
  DonateButton: TButton;

const
  PayPalURL = 'https://www.paypal.com/donate/?business=25B2PS8PWW4JU&no_recurring=0&item_name=%E2%9D%A4%EF%B8%8F+Supporta+lo+sviluppo&currency_code=EUR';

function GetDisclaimerText(lang: String): String;
begin
  if lang = 'italian' then
    Result :=
      'UPS Monitor è un software gratuito.' + #13#10#13#10 +
      'Se lo trovi utile, puoi supportarne lo sviluppo con una donazione volontaria.' + #13#10 +
      'Il tuo contributo aiuta a mantenere il progetto aggiornato.' + #13#10#13#10 +
      'Grazie per il tuo supporto!'
  else if lang = 'spanish' then
    Result :=
      'UPS Monitor es un software gratuito.' + #13#10#13#10 +
      'Si te resulta útil, puedes apoyar su desarrollo con una donación voluntaria.' + #13#10 +
      'Tu contribución ayuda a mantener el proyecto actualizado.' + #13#10#13#10 +
      '¡Gracias por tu apoyo!'
  else if lang = 'french' then
    Result :=
      'UPS Monitor est un logiciel gratuit.' + #13#10#13#10 +
      'Si vous le trouvez utile, vous pouvez soutenir son développement par un don volontaire.' + #13#10 +
      'Votre contribution aide à maintenir le projet à jour.' + #13#10#13#10 +
      'Merci pour votre soutien !'
  else if lang = 'german' then
    Result :=
      'UPS Monitor ist eine kostenlose Software.' + #13#10#13#10 +
      'Wenn Sie sie nützlich finden, können Sie die Entwicklung mit einer freiwilligen Spende unterstützen.' + #13#10 +
      'Ihr Beitrag hilft, das Projekt aktuell zu halten.' + #13#10#13#10 +
      'Vielen Dank für Ihre Unterstützung!'
  else if lang = 'portuguese' then
    Result :=
      'UPS Monitor é um software gratuito.' + #13#10#13#10 +
      'Se for útil para você, considere apoiar o desenvolvimento com uma doação voluntária.' + #13#10 +
      'Sua contribuição ajuda a manter o projeto atualizado.' + #13#10#13#10 +
      'Obrigado pelo seu apoio!'
  else
    Result :=
      'UPS Monitor is free software.' + #13#10#13#10 +
      'If you find it useful, consider supporting development with a voluntary donation.' + #13#10 +
      'Your contribution helps keep the project updated.' + #13#10#13#10 +
      'Thank you for your support!';
end;

procedure OpenDonate(Sender: TObject);
var
  ResultCode: Integer;
begin
  ShellExec('open', PayPalURL, '', '', SW_SHOWNORMAL, ewNoWait, ResultCode);
end;

procedure InitializeWizard;
begin
  DisclaimerPage := CreateCustomPage(
    wpWelcome,
    ExpandConstant('{cm:DisclaimerTitle}'),
    ExpandConstant('{cm:DisclaimerSubtitle}')
  );

  { Testo disclaimer }
  DisclaimerMemo := TMemo.Create(DisclaimerPage.Surface);
  DisclaimerMemo.Parent := DisclaimerPage.Surface;
  DisclaimerMemo.Left := 0;
  DisclaimerMemo.Top := 0;
  DisclaimerMemo.Width := DisclaimerPage.SurfaceWidth;
  DisclaimerMemo.Height := 150;
  DisclaimerMemo.ReadOnly := True;
  DisclaimerMemo.WordWrap := True;
  DisclaimerMemo.Lines.Text := GetDisclaimerText(ActiveLanguage);

  { Bottone Donazione centrato }
	DonateButton := TButton.Create(DisclaimerPage.Surface);
	DonateButton.Parent := DisclaimerPage.Surface;
	DonateButton.Width := 250;
	DonateButton.Height := 35;
	DonateButton.Top := 170;
	DonateButton.Left := (DisclaimerPage.SurfaceWidth - DonateButton.Width) div 2; // CENTRATO
	DonateButton.Caption := ExpandConstant('{cm:DonateButton}');
	DonateButton.OnClick := @OpenDonate;
	DonateButton.Font.Style := [fsBold];

  { Stile più moderno }
  DonateButton.Font.Style := [fsBold];
end;

function ShouldKeepConfig: Boolean;
begin
  if MsgBox(ExpandConstant('{cm:KeepConfigPrompt}'), mbConfirmation, MB_YESNO) = IDYES then
    Result := True
  else
    Result := False;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
var
  AppDir, ResDir, ConfigFile: String;
begin
  if CurUninstallStep = usPostUninstall then
  begin
    AppDir := ExpandConstant('{app}');
    ResDir := ExpandConstant('{app}\resources');
    ConfigFile := ResDir + '\config.json';

    if not ShouldKeepConfig then
    begin
      // Cancella config.json
      if FileExists(ConfigFile) then
        DeleteFile(ConfigFile);
    end;

    // Rimuove cartelle se vuote (DOPO tutto)
    if DirExists(ResDir) then
      RemoveDir(ResDir);

    if DirExists(AppDir) then
      RemoveDir(AppDir);
  end;
end;