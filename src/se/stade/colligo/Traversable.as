package se.stade.colligo
{
	public interface Traversable
	{
		/**
		 * For each item in the collection, the given method is called. The item
		 * being traversed will be the first parameter given to the list of
		 * parameters. If no parameters are specified, the item will be the only
		 * parameter given to the method.
		 * 
		 * @see Function#apply()
		 * 
		 * @param method An method to call for each item in the collection.
		 * @param parameters An optional comma separated list of parameters, the current item will be prepended to this list.
		 */
		function forEachItem(method:Function, ... parameters):void;
	}
}