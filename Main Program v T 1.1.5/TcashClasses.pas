unit TcashClasses;

interface

Uses Controls,Windows,SysUtils,Contnrs,Classes,Graphics,Forms,
  IdMessage,IdSMTP;

Type

  TcReportCols = Class
  Private
    FCount : Integer;
    FValues:Array [0..10] of String;
    FNames:Array [0..10] of String;
    Function GetCol(Index:Integer):String;
    Procedure SetCol(Index:Integer;Name,Value:String);
    Function  GetIndex(Name:String):integer;
    Function  GetValue(Index:integer):String;
    Function GetCount:Integer;
  Public
    Constructor Create;
    Property  Items[index:integer]:String Read GetCol ;
    Procedure Add(Name,Value:String);
    Property  Value[Index:Integer]:String Read GetValue;
    Function  ValueByName(Name:String):String;
    Property  IndexOf[Name:string]:Integer Read GetIndex;
    Property  Count:Integer Read GetCount;
    Procedure Clear;
  end;


  TIntegerList=Class(TPersistent)
  Private
    FList:TList;
    Procedure Delete(Const Index:Integer);
    Function GetItem(Index:integer):Integer;
  Public
    Constructor Create;
    Destructor  Destroy;Override;
    Procedure   Add(Const Value:Integer);
    Procedure Addex(ListValue:String);
    Function  IndexOf(Const Value:integer):Integer;
    Function  Exists(Const Value:Integer):Boolean;
    Function  Count:Integer;
    Procedure Clear;
    Property Items[Index:integer]:integer Read GetItem;Default;
  end;


//  Books collection so we can write out the database at startup.
//
//
  TBooksCollectionItem = Class(TCollectionItem)
  private
    FPassword: String;
    FConnectionType: String;
    FServer: String;
    FUserName: String;
    Fdriver: String;
    FDatabase: String;
    FName: String;
     published
       // display name of the books
       property Name : String  read FName write FName;
       // connection type as string so it can be used for manny
       // will be used to get the directory of specific SQL
       property ConnectionType : String  read FConnectionType write FConnectionType;
       // full path or
       property Database : String  read FDatabase write FDatabase;
       // server if needed
       property Server : String  read FServer write FServer;
       // username
       property UserName : String  read FUserName write FUserName;
       // password
       property Password : String  read FPassword write FPassword;
       // ZEOS driver
       property driver : String  read Fdriver write Fdriver;
  end;
TBooksCollection = class (TOwnedCollection)
  private
    function GetBooks(index: Integer): TBooksCollectionItem;
    procedure SetBooks(index: Integer; const Value: TBooksCollectionItem);
   public
      property Books [index : Integer]: TBooksCollectionItem  read GetBooks write SetBooks; default ;
end;

// Registration class

TRegistration = class(tPersistent)
  private
    FRegistered: Boolean;
    FCompanyName: String;
    FSerialNumber: String;
    published
      property CompanyName : String read FCompanyName write FCompanyName;
      property SerialNumber : String read FSerialNumber write FSerialNumber;
      property Registered : Boolean  read FRegistered write FRegistered;
end;
// Translation object
TTranslationCollectionItem = Class(TCollectionItem)
  private
    FIndexID: Integer;
    FText: String;
    published
      property IndexID : Integer  read FIndexID write FIndexID;
      property Text : String  read FText write FText;
end;

TTranslationCollection = class (TOwnedCollection)
  private
    function Gettranslation(index: Integer): TTranslationCollectionItem;
    procedure Settranslation(index: Integer;
      const Value: TTranslationCollectionItem);
   public
      property translation [index : Integer]: TTranslationCollectionItem   read Gettranslation write Settranslation; default ;
end;

TLanguageCollectionItem = Class(TCollectionItem)
  private
    FName: String;
    fFilename: String;
    published
      property Name : String   read FName write FName;
      property filename : String   read fFilename write fFilename;
end;

TLanguageCollection = class (TOwnedCollection)
  private
    function GetLanguage(index: Integer): TLanguageCollectionItem;
    procedure SetLanguage(index: Integer;
      const Value: TLanguageCollectionItem);
   public
      property Language [index : Integer]: TLanguageCollectionItem   read GetLanguage write SetLanguage; default ;
end;

TGlobalDataObject = class (TComponent)
  private
    FBooks: TBooksCollection;
    FRegistration: TRegistration;
    FCurrentLanguage: TTranslationCollection;
    FLanguages: TLanguageCollection;
    procedure SetBooks(const Value: TBooksCollection);
    procedure SetCurrentLanguage(const Value: TTranslationCollection);
    procedure SetRegistration(const Value: TRegistration);
    procedure SetLanguages(const Value: TLanguageCollection);
    public
      procedure Clear ;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;

    published
      property CurrentLanguage : TTranslationCollection  read FCurrentLanguage write SetCurrentLanguage;
      property Languages : TLanguageCollection  read FLanguages write SetLanguages;
      property Registration : TRegistration  read FRegistration write SetRegistration;
      property Books : TBooksCollection  read FBooks write SetBooks;
end;



implementation

Constructor tcReportCols.Create;
begin
  Inherited;
  FCount:=-1; 
end;

Function tcReportCols.GetCol(Index:Integer):String;
begin
  Result :='';
  if Index in [0..Count-1] then
  begin
    if FNames[Index]<>'' then
      Result := FNames[Index]+'=';
    Result := Result + FValues[index];
  end;
end;

Procedure tcReportCols.SetCol(Index:Integer;Name,Value:String);
begin
  if Index in [0..10] then
  begin
    FValues[FCount]:=Value;
    FNames[FCount]:= Name;
  end;
end;

Procedure tcReportCols.Add(Name,Value:String);
begin
  exit;
  if FCount<11 then
  begin
    Inc(FCount);
    SetCol(FCount,Name,Value);
  end;
end;

Function  tcReportCols.GetIndex(Name:String):integer;
Var
  i:integer;
begin
  For i:=0 to 10 do
  begin
    if SameText(Name,FNames[i]) then
    begin
      Result:=i;
      Break;
    end;
  end;
end;


Function tcReportCols.ValueByName(Name:String):String;
begin
  Result := GetValue(GetIndex(Name));
end;

Function  tcReportCols.GetValue(Index:integer):String;
begin
  if Index in [0..10] then
    Result := FValues[index]
  else
    Result :='';
end;

Function tcReportCols.GetCount:Integer;
begin
  Result :=FCount
end;

Procedure tcReportCols.Clear;
Var
  I:Integer;
begin
  Fcount:=-1;
  For i:=0 to 10 do
  begin
    FValues[i]:='';
    FNames[i]:='';
  end;
end;



{TIntegerList}
Constructor TIntegerList.Create;
begin
  Inherited;
  FList:=TList.Create;
end;


Destructor TIntegerList.Destroy;
Var
  i:integer;
begin
  For i:=0 to Flist.count-1 do
    Delete(i);
  FList.Free;
  Inherited;
end;

Procedure TIntegerList.Add(Const Value:Integer);
Var
  NewValue: PInteger;
begin
  New(NewValue);
  NewValue^:=Value;
  FList.Add(NewValue);
end;

Procedure TIntegerList.Delete(Const Index:Integer);
begin
  if Index In [0..Flist.Count-1] then begin
    Dispose(FList[Index]);
    FList.Delete(Index);
  end;
end;

Function TIntegerList.GetItem(Index:integer):Integer;
begin
  if Index in [0..FList.count-1] then begin
    Result := Integer(flist[Index]^);
  end
  else
    raise ERangeError.CreateFmt(
      'index ou of bounds %d',[Index]);
end;


Function TIntegerList.IndexOf(Const Value:integer):Integer;
Var
  I:Integer;
begin
  Result := -1;
  For i:=0 to FList.Count-1 do begin
    if Integer(flist[i]^)= Value then begin
      Result:=i;
      Break;
    end;
  end;
end;

Function TIntegerList.Exists(Const Value:Integer):Boolean;
begin
 Result := IndexOf(Value)>=0;
end;

Procedure TIntegerList.Addex(ListValue:String);
Var
  iPos:Integer;
begin
  iPos := Pos(',',ListValue);
  While iPos>0 do begin
    Self.Add(StrToIntDef(Copy(ListValue,1,iPos-1),0));
    System.Delete(ListValue,1,ipos);
    iPos := Pos(',',ListValue);
  end;
end;

Function TIntegerList.Count:Integer;
begin
  REsult := FList.COunt;
end;

Procedure TIntegerList.Clear;
begin
  FList.Clear;
end;


function TBooksCollection.GetBooks(index: Integer): TBooksCollectionItem;
begin
 result := TBooksCollectionItem(self.Items[index]);
end;

procedure TBooksCollection.SetBooks(index: Integer;
  const Value: TBooksCollectionItem);
begin
  self.Items[index].Assign(Value);
end;


{ TTranslationCollection }

function TTranslationCollection.Gettranslation(
  index: Integer): TTranslationCollectionItem;
begin
 result := TTranslationCollectionItem(self.Items[index]);
end;

procedure TTranslationCollection.Settranslation(index: Integer;
  const Value: TTranslationCollectionItem);
begin
  self.Items[index].Assign(Value);
end;

{ TGlobalDataObject }

procedure TGlobalDataObject.Clear;
begin
    FBooks.Clear;
    FRegistration.Registered := false ;
    FRegistration.CompanyName := '' ;
    FRegistration.SerialNumber := '' ;
    FCurrentLanguage.Clear;
end;

constructor TGlobalDataObject.Create(AOwner: TComponent);
begin
  inherited;
    FBooks:= TBooksCollection.Create(self,TBooksCollectionItem);
    FRegistration:= TRegistration.Create;
    FCurrentLanguage:= TTranslationCollection.Create(self,TTranslationCollectionItem);
    FLanguages:= TLanguageCollection.Create(self,TLanguageCollectionItem);
end;

destructor TGlobalDataObject.Destroy;
begin
    FBooks.Free ;
    FRegistration.Free ;
    FCurrentLanguage.Free ;
    FLanguages.free ;
  inherited;
end;

procedure TGlobalDataObject.SetBooks(const Value: TBooksCollection);
begin
  FBooks.Assign( Value);
end;

procedure TGlobalDataObject.SetCurrentLanguage(
  const Value: TTranslationCollection);
begin
  FCurrentLanguage.Assign(Value);
end;

procedure TGlobalDataObject.SetLanguages(const Value: TLanguageCollection);
begin
  FLanguages.Assign( Value);
end;

procedure TGlobalDataObject.SetRegistration(const Value: TRegistration);
begin
  FRegistration.Assign( Value);
end;


{ TLanguageCollection }

function TLanguageCollection.GetLanguage(
  index: Integer): TLanguageCollectionItem;
begin
 result := TLanguageCollectionItem(self.Items[index]);
end;

procedure TLanguageCollection.SetLanguage(index: Integer;
  const Value: TLanguageCollectionItem);
begin
  self.Items[index].Assign(Value);
end;


end.

