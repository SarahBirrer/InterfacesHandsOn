pageextension 50000 "ALINTCustomerListExt" extends "Customer List"
{
    layout
    {

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
                    ALINTHighBalance: Codeunit ALINTHighBalance;
                    ALINTLowBalance: Codeunit ALINTLowBalance;
                    ALINTCustomerBalance: Interface "ALINTCustomerBalance";
                begin
                    if Rec."Balance (LCY)" > 15000 then
                        ALINTCustomerBalance := ALINTHighBalance
                    else
                        ALINTCustomerBalance := ALINTLowBalance;
                    OnAfterCheckBalance(ALINTCustomerBalance);
                    ALINTCustomerBalance.RaiseMessage();
                end;
            }
        }
    }

    [BusinessEvent(false)]
    local procedure OnAfterCheckBalance(var ALINTCustomerBalance: Interface ALINTCustomerBalance)
    begin
    end;
}

