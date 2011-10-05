package se.stade.colligo
{

    /**
     * A queue defines a collection with a specific order. It is
     * possible to pop items from the queue, one at a time, in
     * an order defined by the queue itself. 
     * 
     * @author Marcus Stade
     */
    public interface Queue extends List, Collection
    {
        /**
         * Removes the next item from the queue and returns it.
         * If there are no more items left in the queue, <c>Nothing</c>
         * is returned.
         * 
         * @return The next item in the queue.
         * @see se.boon.types.Nothing
         */
        function pop():*;
    }
}
