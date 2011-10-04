package se.stade.colligo
{
	/**
	 * A countable collection reflects the number of items in it.
	 * 
	 * @author Marcus Stade
	 */
	public interface Countable extends Collection
	{
		/**
		 * The number of items in this collection.
		 * 
		 * @return  
		 */
		function get length():uint;
	}
}