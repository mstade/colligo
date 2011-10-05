package se.stade.colligo.iterators
{
    import se.stade.colligo.Traversable;

    /**
     * An iterator is used to walk through a collection. While the iterator
     * interface does not expose how the iteration works, it suggests that
     * it is unidirectional.
     * 
     * @author Marcus Stade
     */
    public interface Iterator extends Traversable
    {
        /**
         * Determines wether or not there is a next item in the collection.
         * 
         * @return True if there is a next item in the collection; false otherwise. 
         */
        function get hasNext():Boolean;
        
        /**
         * Gets the last item returned by <code>getNext()</code>.
         */
        function get current():*;
        
        /**
         * Steps the iterator one step forward and returns the item in that
         * position.
         */
        function getNext():*;
        
        /**
         * Resets the state of the iterator.
         */
        function rewind():void;
    }
}
