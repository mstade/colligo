package se.stade.colligo
{

	/**
	 * A set garuantees that there is only ever a single reference to
	 * the same value in the collection.
	 * 
	 * @author Marcus Stade
	 */
	public interface Set extends List, Collection
	{
		/**
		 * Compares another set with this one to produce a merge of the two.
		 * The merged set includes any items from the other set that is
		 * not in this set.
		 * 
		 * @param other The other set to merge with this one.
		 * @return A new set representing a merge between this set and the one given as argument. 
		 */
		function merge(other:Set):Set;
		
		/**
		 * Compares another set with this one to produce an intersection of the two.
		 * The intersected set only includes items that are included in both this and
		 * the given set.
		 * 
		 * @param other The other set to intersect with this one.
		 * @return A new set representing the intersection between this set and the one given as argument. 
		 */
		function intersect(other:Set):Set;
		
		/**
		 * Compares another set with this one to produce the difference between the two.
		 * The resulting set excludes any common items between the sets, and can be
		 * considered as the opposite of a union.
		 * 
		 * @param other The other set to differentiate with this one.
		 * @return A new set representing the difference between this set and the one given as argument. 
		 */
		function difference(other:Set):Set;
		
		/**
		 * Compares another set with this one to determine wether the items in the given
		 * set is included in this one. If either set is empty, this method will return
		 * false.
		 * 
		 * @param other The other set to differentiate with this one.
		 * @return True if all the items of the other set are included in this one; false otherwise. 
		 */
		function includes(other:Set):Boolean;
	}
}