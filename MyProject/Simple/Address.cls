Class Simple.Address Extends (%SerialObject,%Library.Populate)
{
/// Street
Property Street As %String ;
/// City
Property City As %String ;
/// State
Property State As %String ;
/// Zip
Property Zip As %String ;
Storage Default
{
<Data name="AddressState">
<Value name="1">
<Value>Street</Value>
</Value>
<Value name="2">
<Value>City</Value>
</Value>
<Value name="3">
<Value>State</Value>
</Value>
<Value name="4">
<Value>Zip</Value>
</Value>
</Data>
<State>AddressState</State>
<StreamLocation>^Simple.AddressS</StreamLocation>
<Type>%Library.CacheSerialState</Type>
}

}