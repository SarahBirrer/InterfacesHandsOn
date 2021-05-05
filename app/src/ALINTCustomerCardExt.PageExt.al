pageextension 50001 "ALINTCustomerCardExt" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field(ALINTStatus; Rec.ALINTStatus)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addfirst(processing)
        {
            action(ALINTTestInterface)
            {
                Caption = 'Test Interface';
                Image = ExportMessage;
                ApplicationArea = All;

                trigger OnAction()
                var
                    ALINTCustomerBalance: Interface ALINTCustomerStatus;
                begin
                    ALINTCustomerBalance := Rec.ALINTStatus;
                    ALINTCustomerBalance.RaiseMessage();
                end;
            }
        }
    }
}

