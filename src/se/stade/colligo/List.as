package se.stade.colligo
{
    /**
     * A list stores it's items in a defined order.
     * 
     * @author Marcus Stade
     */
    public interface List extends Inspectable, Clearable, Collection
    {
        /**
         * Adds an item to the list.
         * 
         * @param item The item to add.
         */
        function add(item:*):void;
        
        /**
         * Removes an item from the list.
         *  
         * @param item The item to remove.
         */
        function remove(item:*):void;
    }
}
