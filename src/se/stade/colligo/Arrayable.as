package se.stade.colligo
{
    /**
     * An arrayable collection can be copied into a mutable array.
     * The array is guaranteed to be a copy and no modifications to
     * it will have any effect on the original collection. However,
     * it should be noted that this only applies to the integrity
     * of the collection and is not guaranteed for the items
     * contained within the collection. 
     * 
     * @author Marcus Stade
     */
    public interface Arrayable extends Collection
    {
        /**
         * Returns a copy of the collection. The copy is mutable but since
         * it is guaranteed to be a copy any modifications to it will have
         * no effect on the original collection.
         * 
         * @return A copy of the collection.
         */
        function toArray():Array;
    }
}
