package se.stade.colligo.filters
{
	public interface Filter
	{
		function validates(item:*):Boolean;
        
        function applyTo(enumerable:Object):Array;
	}
}