package se.stade.colligo
{
    /**
     * A clearable collection can be cleared of all it's items.
     * 
     * @author Marcus Stade
     */
    public interface Clearable extends Collection
    {
        /**
         * Removes all items in this collection.
         */
        function clear():void;
    }
}
