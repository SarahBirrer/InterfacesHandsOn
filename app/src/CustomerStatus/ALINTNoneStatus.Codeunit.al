codeunit 50002 "ALINTNoneStatus" implements ALINTCustomerStatus
{
    procedure RaiseMessage()
    begin
        Message('This Customer has no Status.');
    end;
}
