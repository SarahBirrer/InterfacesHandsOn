tableextension 50000 "ALINTCustomerExt" extends Customer
{
    fields
    {
        field(50000; ALINTStatus; Enum "ALINTCustomer Status")
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
    }
}
