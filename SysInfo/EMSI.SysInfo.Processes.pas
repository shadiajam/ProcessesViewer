{********************************************}
{        EMSI System Info                    }
{    Windows Processes Handle Unit           }
{Last modified:                              }
{Revision:                                   }
{Author:         Shadi AJAM                  }
{********************************************}


unit EMSI.SysInfo.Processes;

interface

uses
  System.SysUtils,
  Winapi.Windows,
  Winapi.PsAPI,
  Winapi.TlHelp32, {https://learn.microsoft.com/en-us/windows/win32/toolhelp/tool-help-library}
  EMSI.SysInfo.Base,
  EMSI.SysInfo.Consts

  ;


type

  /// Forwarding Classes
  TEMSI_WinProcess = class;
  TEMSI_WinProcessList = class;

  TEMSI_WinProcess = class(TEMSI_SysInfoObj)
  private
    FSubProcesses: TEMSI_WinProcessList;
    function FillFromProcessEntry32(var ProcessEntry32 : TProcessEntry32):TEMSI_Result;
    function FillProcessInfo:TEMSI_Result;
  public
    ProcessID : Cardinal; {PID: The process identifier.}
    ParentPID : Cardinal; {ParentPID: The identifier of the process that created this process (its parent process).}
    ThreadsCount : Cardinal; {The number of execution threads started by the process.}
    ExeFile : string; {The name of the executable file for the process}

    {Extended Info}
    Description: string;
    CompanyName: string;
    VerifiedSigner: string;
    UserName: string;
    FullPath: string;
    Version: string;

    RootNode:boolean;
    RelatedObject:TObject; // Save TreeNode for use it on update
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    procedure Assign(Source:TEMSI_SysInfoObj);override;
    function IsSameObject(Obj: TEMSI_SysInfoObj):boolean;override;

    property SubProcesses : TEMSI_WinProcessList read FSubProcesses;
  end;

  TEMSI_WinProcessList = class(TEMSI_SysInfoList<TEMSI_WinProcess>)
  strict private
    function NewFromProcessEntry32(var ProcessEntry32 : TProcessEntry32):TEMSI_WinProcess;
    procedure ResolveNewProccessParents;
    function FindProcess(PID:Cardinal;SearchChildren:boolean):TEMSI_WinProcess;
  protected
    function NewObject:TEMSI_WinProcess;override;
  public
    function FillList:TEMSI_Result; override;
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
  end;

implementation

{ TEMSI_WinProcessList }

procedure TEMSI_WinProcessList.AfterConstruction;
begin
  inherited;

end;

procedure TEMSI_WinProcessList.BeforeDestruction;
begin
  inherited;

end;

function TEMSI_WinProcessList.FillList: TEMSI_Result;
var
  SnapProcHandle: THandle;
  PE32: TProcessEntry32;
  NextProc: Boolean;
  WP : TEMSI_WinProcess;
  WPList : TEMSI_WinProcessList;
begin
  Result := inherited;

  // Take a snapshot of all processes in the system.
  SnapProcHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  //
  if SnapProcHandle = INVALID_HANDLE_VALUE then exit(emsi_err_CreateToolhelp32Snapshot);

  try
    // Create Internal List to Fill All Processes inside it
    WPList := TEMSI_WinProcessList.Create;

    // Set the size of the structure before using it.
    PE32.dwSize := SizeOf(PE32);

    // Retrieve information about the first process,
    // and exit if unsuccessful
    if not Process32First(SnapProcHandle, PE32) then exit(emsi_err_Process32First);

    NextProc := True;
    while NextProc do
    begin
      WP := WPList.NewFromProcessEntry32(PE32);
      WP.FillProcessInfo;
      NextProc := Process32Next(SnapProcHandle, PE32);
    end;

    // Fill Internal List For Comparing (Non Own objects list)
    MergeWithNewList(WPList);

    ResolveNewProccessParents;

    Result := emsi_ValidResult;
  finally
    WPList.Free;
    CloseHandle(SnapProcHandle);
  end;

end;

procedure TEMSI_WinProcessList.ResolveNewProccessParents;
var I : integer;
    WP,ParentWP : TEMSI_WinProcess;
begin

  for i := 0 to Count-1 do
  begin
    WP := Items[I];
    if WP.ChangeStatus = ocsNewObject then
    begin
      wp.RootNode := true;
      ParentWP := FindProcess(WP.ParentPID,True);
      if Assigned(ParentWP) then
      begin
        ParentWP.SubProcesses.Add(WP);
        WP.RootNode := false;
      end;


    end;
  end;

end;

function TEMSI_WinProcessList.FindProcess(PID: Cardinal;
  SearchChildren: boolean): TEMSI_WinProcess;
var i:integer;
begin
  Result := nil;
  if PID = 0 then exit;
  /// Search in root
  for I := 0 to Count-1 do
  begin
    if Items[I].ProcessID = PID then
      exit(Items[I]);
  end;

  /// Search in Children
  if SearchChildren then
    for I := 0 to Count-1 do
    begin
      Result := Items[I].SubProcesses.FindProcess(PID,SearchChildren);
      if Assigned(Result) then exit;
    end;

end;

function TEMSI_WinProcessList.NewFromProcessEntry32(
  var ProcessEntry32: TProcessEntry32): TEMSI_WinProcess;
begin
  Result := TEMSI_WinProcess.Create;
  Result.FillFromProcessEntry32(ProcessEntry32);
  Add(Result);
end;

function TEMSI_WinProcessList.NewObject: TEMSI_WinProcess;
begin
  Result := TEMSI_WinProcess.Create;
end;

{ TEMSI_WinProcess }

procedure TEMSI_WinProcess.AfterConstruction;
begin
  inherited;
  ProcessID := 0;
  ParentPID := 0;
  ThreadsCount := 0;
  FSubProcesses := TEMSI_WinProcessList.Create(False);
  RelatedObject := nil;
end;

procedure TEMSI_WinProcess.Assign(Source: TEMSI_SysInfoObj);
begin
  inherited;
  ProcessID := TEMSI_WinProcess(Source).ProcessID;
  ParentPID := TEMSI_WinProcess(Source).ParentPID;
  ThreadsCount := TEMSI_WinProcess(Source).ThreadsCount;
  ExeFile := TEMSI_WinProcess(Source).ExeFile;

  Description := TEMSI_WinProcess(Source).Description;
  CompanyName := TEMSI_WinProcess(Source).CompanyName;
  VerifiedSigner := TEMSI_WinProcess(Source).VerifiedSigner;
  UserName := TEMSI_WinProcess(Source).UserName;
  FullPath := TEMSI_WinProcess(Source).FullPath;
  Version := TEMSI_WinProcess(Source).Version;



end;

procedure TEMSI_WinProcess.BeforeDestruction;
begin
  inherited;
  FreeAndNil(FSubProcesses);
end;

function TEMSI_WinProcess.FillFromProcessEntry32(
  var ProcessEntry32: TProcessEntry32): TEMSI_Result;
begin
  Result := emsi_Unknown;
  ProcessID := ProcessEntry32.th32ProcessID;
  ParentPID := ProcessEntry32.th32ParentProcessID;
  ThreadsCount := ProcessEntry32.cntThreads;
  ExeFile := string(ProcessEntry32.szExeFile);
  Result := emsi_ValidResult;
end;

function TEMSI_WinProcess.FillProcessInfo: TEMSI_Result;
var ProcessHandle: THandle;
  FileName: array[0..MAX_PATH - 1] of Char;
  Lang, SubLang: LANGID;
  Buffer: array[0..$FF] of Char;
begin
  Result := emsi_Unknown;

  if ProcessID = 0 then exit(emsi_err_NoProcesssID);

  // Open a handle to the process
  ProcessHandle := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ, False, ProcessID);
  if ProcessHandle = 0 then exit(emsi_err_ProcesssOpenError);

  try
    // Get the process image file name
    if GetModuleFileNameEx(ProcessHandle, 0, @FileName, MAX_PATH) > 0 then
       FullPath := FileName;


//    // Get the process file version information
//    if GetFileVersionInfo(FileName, 0, SizeOf(Buffer), @Buffer) then
//    begin
//      if VerQueryValue(@Buffer, '\VarFileInfo\Translation', Pointer(Lang), SizeOf(Lang)) then
//      begin
//        VerLanguageName(Lang, Buffer, SizeOf(Buffer));
//        if VerQueryValue(@Buffer, PChar(Format('\StringFileInfo\%04X%04X\FileVersion', [Lang, SubLang])), Pointer(Version), SizeOf(Version)) then
//          Version := Trim(Version);
//      end;
//    end;
//
//    // Get the process module information
//    if GetModuleFileNameEx(ProcessHandle, 0, FileName, Length(FileName)) > 0 then
//    begin
//      // Get the process description and company name
//      if GetFileDescription(FileName, Description) and GetCompanyName(FileName, CompanyName) then
//      begin
//        // Get the process verified signer information
//        if IsFileDigitallySigned(FileName) then
//          VerifiedSigner := 'Yes'
//        else
//          VerifiedSigner := 'No';
//
//        // Get the process user name
//        UserName := GetProcessUserName(PID);
//
//        // Get the process path
//        Path := ExtractFilePath(FileName);
//      end;
//    end;
//
//    // Create the process information record
//    Result.ProcessID := PID;
//    Result.Description := Description;
//    Result.CompanyName := CompanyName;
//    Result.VerifiedSigner := VerifiedSigner;
//    Result.UserName := UserName;
//    Result.Path := Path;
//    Result.Version := Version;
  finally
    // Close the handle to the process
    CloseHandle(ProcessHandle);
  end;


   {ToDo : https://learn.microsoft.com/en-us/windows/win32/toolhelp/taking-a-snapshot-and-viewing-processes}
    // Retrieve the priority class.
//    dwPriorityClass = 0;
//    hProcess = OpenProcess( PROCESS_ALL_ACCESS, FALSE, pe32.th32ProcessID );
//    if( hProcess == NULL )
//      printError( TEXT("OpenProcess") );
//    else
//
//      dwPriorityClass = GetPriorityClass( hProcess );
//      if( !dwPriorityClass )
//        printError( TEXT("GetPriorityClass") );
//      CloseHandle( hProcess );


  Result := emsi_ValidResult;
end;

function TEMSI_WinProcess.IsSameObject(Obj: TEMSI_SysInfoObj): boolean;
begin
  if Obj = nil then exit(False);
  Result := ProcessID = TEMSI_WinProcess(Obj).ProcessID;
end;

end.
