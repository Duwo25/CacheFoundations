Class Simple.Human Extends (%Persistent,%Library.Populate)
{
Property Name As %String [Required ];
Property Phone As %String;
/// Home address
Property Home As Simple.Address ;
/// Work address
Property Work As Simple.Address ;

/// SPECIES parameter
Parameter SPECIES = "Home Sapiens";

/// Print
Method Print(state As %String) 
{
	write !, ..Name, " lives in ", ..Home.State, ", and is "
	if (..Home.State = state) {
		write "a ", ..#SPECIES, ". "
	} else {
		write "an extra-terrestrial. "
	}
	write "Phone is: ", ..Phone, "."	
}
/// Insert method using embedded SQL
ClassMethod Insert(nm As %String = "", ph As %String = "", sta As %String = "") 
{
	set allEmpty = ((nm="") && (ph="") && (sta=""))
	quit:(allEmpty) // if all data is empty just quit
	&sql(insert into simple.human (name, phone, home_state)
		values (:nm, :ph, :sta))
	if (SQLCODE = 0) {
		&sql(select count(*) into :count from simple.human)
		write !, count, " records"
	}
	else {
		write !, "SQLCODE: ", SQLCODE, !, %msg
	}
}
/// return number of records in table
ClassMethod Count() As %Integer 
{
	#dim count As %Integer
	
	&sql(select count(*) into :count from simple.human)
	
	return count
}
Storage Default
{
<Data name="HumanDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Phone</Value>
</Value>
<Value name="4">
<Value>State</Value>
</Value>
<Value name="5">
<Value>Home</Value>
</Value>
<Value name="6">
<Value>Work</Value>
</Value>
</Data>
<DataLocation>^Simple.HumanD</DataLocation>
<DefaultData>HumanDefaultData</DefaultData>
<IdLocation>^Simple.HumanD</IdLocation>
<IndexLocation>^Simple.HumanI</IndexLocation>
<StreamLocation>^Simple.HumanS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}