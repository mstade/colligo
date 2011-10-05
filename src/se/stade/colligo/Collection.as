package se.stade.colligo
{
    import se.stade.colligo.iterators.Iterator;

    /**
     * All collections must implement this interface. A collection groups one
     * or more items in a container. It's also common, but not required, for
     * collections to offer functionality to modify itself and/or its items.
     * 
     * @author Marcus Stade
     */
    public interface Collection
    {
        /**
         * Returns a new iterator for this collection.
         * The iterator is garuanteed to be new and
         * unused.
         *  
         * @return A new iterator for this collection.
         */
        function iterate():Iterator;
    }
}
