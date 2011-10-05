package se.stade.colligo
{
    /**
     * An associative collection refers to its items by a key.
     * The keys may be of any type. Only one key is necessary
     * to retrieve the associated item, but any given item may
     * be stored multiple times under different keys.
     *  
     * @author Marcus Stade
     */
    public interface Associative extends Clearable, Keyed, Collection
    {
        /**
         * Adds an item using the specified key as index. Should
         * the item already exist in the table, the key is added
         * as an additional index for the specified item. Should
         * the specified key be used by another item, the key
         * will no longer be associated with that item. In the
         * case that the key was the sole reference to that item
         * then the item will be removed from the table.
         */
        function add(key:*, item:*):void;
        
        /**
         * Removes an item and all it's associated keys from
         * this collection.
         */
        function remove(item:*):void;
        
        /**
         * Removes the specified keys from this collection.
         * Items that are associated with the specified keys but
         * no others will be removed as well.
         * 
         * @param keys A list of keys to be removed.
         */
        function removeKey(key:*):void;
    }
}
