package se.stade.colligo
{
    /**
     * An indexable collection can return an item at a given index,
     * as well as finding the index of a given item.
     * 
     * @author marcus
     */
    public interface Indexable extends Collection
    {
        /**
         * Returns the item at the given index.
         * 
         * @param index The index of the item to retrieve.
         * @return The item at the given index.
         */
        function getItemAt(index:int):*;
        
        /**
         * Returns the first index of a given item, or -1 if the item is not a
         * part of this collection.
         * 
         * @param item The item to find the first index for.
         * @param fromIndex The index from where the search begins.
         * @return The first index of the item; -1 if the item  isn't a part of this collection.
         */
        function indexOf(item:*, fromIndex:int = 0):int;
        
        /**
         * Returns the last index of a given item, or -1 if the item is not
         * a part of this collection.
         * 
         * @param item The item to find the last index for. 
         * @param fromIndex The index from where the search begins.
         * @return The last index of the item; -1 if the item isn't a part of this collection.
         */
        function lastIndexOf(item:*, fromIndex:int = 0x7fffffff):int;
    }
}
