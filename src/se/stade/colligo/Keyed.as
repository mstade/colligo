package se.stade.colligo
{
	public interface Keyed extends Inspectable, Collection
	{
		/**
		 * Determines wether the given key exists in the collection.
		 * 
		 * @param key The key to look for.
		 * @return True if the collection contains the key; false otherwise.
		 */
		function containsKey(key:*):Boolean;
		
		/**
		 * Returns the item associated with the given key.
		 * 
		 * @param key The key of the item to retrieve.
		 * @return The item associated with the given key; Nothing if no item is found.
		 * 
		 * @see se.stade.types.Nothing
		 */
		function get(key:*):*
		
		/**
		 * Returns the keys associated with the given item.
		 * 
		 * @param item The item with which the keys are associated.
		 * @return The keys associated with the given item; an empty array if no keys are found.
		 */
		function getKeys(item:*):Array;
	}
}