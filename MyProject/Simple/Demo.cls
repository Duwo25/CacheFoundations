Class Simple.Demo
{
/// First method in my first class
	ClassMethod Hello(name As %String, Output nameReversed As %String) As %String
	{
		set affirmation = ""
		try {
			for i=1:1:$length(name) {write !, "Hello World!"}
			set nameReversed = $reverse(name)
			set affirmation = name _ " is your friend."
		}
		catch ex {
			write !, ex.name, " error. Affirmation requires an argument."
		}
		return affirmation
	}
}