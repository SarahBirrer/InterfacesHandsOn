enum 50000 "ALINTCustomer Status" implements ALINTCustomerStatus
{
    Caption = 'Customer Status';
    Extensible = true;
    DefaultImplementation = ALINTCustomerStatus = ALINTNoneStatus;

    value(0; None)
    {
        Caption = 'None';
        Implementation = ALINTCustomerStatus = ALINTNoneStatus;
    }
    value(1; Bronze)
    {
        Caption = 'Bronze Customer';
        Implementation = ALINTCustomerStatus = ALINTBronzeStatus;
    }
    value(2; Silver)
    {
        Caption = 'Silver Customer';
        Implementation = ALINTCustomerStatus = ALINTSilverStatus;
    }
    value(3; Gold)
    {
        Caption = 'Gold Customer';
        Implementation = ALINTCustomerStatus = ALINTGoldStatus;
    }
}
