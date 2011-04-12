package se.stade.colligo
{
	/**
	 * An inspectable collection can be asked wether or not it
	 * contains an item.
	 * 
	 * @author Marcus Stade
	 */
	public interface Inspectable extends Collection
	{
		/**
		 * Determines wether the given item exists in the collection.
		 * 
		 * @param item The item to look for.
		 * @return True if the collection contains the item; false otherwise.
		 */
		function contains(item:*):Boolean;
		
		/**
		 * Determines wether the collection is empty or not.
		 * 
		 * @return True if the collection is empty; false otherwise.
		 */
		function get isEmpty():Boolean;
	}
}