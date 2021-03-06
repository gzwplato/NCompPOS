unit BatchTypeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, JvExButtons, JvBitBtn, DBGrids,
  JvExDBGrids, JvDBGrid;

type
  TBatchTypeForm = class(TForm)
    JvDBGrid1: TJvDBGrid;
    JvBitBtn1: TJvBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FromWhere: String;
  end;

var
  BatchTypeForm: TBatchTypeForm;

implementation
    uses TCDataMod, TCsettingsFrm;

{$R *.dfm}

procedure TBatchTypeForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        BatchTypeForm.FreeOnRelease;
end;

procedure TBatchTypeForm.FormShow(Sender: TObject);
begin
        BatchTypeForm.Left := 10;
        BatchTypeForm.Top := Screen.Height - 400;
end;

procedure TBatchTypeForm.JvDBGrid1DblClick(Sender: TObject);
begin
        If FromWhere = 'BatchType' then
        begin
          TCSettingsForm.Edit16.Text := InttoStr(TCData.TCBatTypesWBatchTypeID.Value);
          close;
        end;
end;

end.
