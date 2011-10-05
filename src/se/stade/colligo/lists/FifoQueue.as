package se.stade.colligo.lists
{
    import se.stade.colligo.Arrayable;
    import se.stade.colligo.Countable;
    import se.stade.colligo.Inspectable;
    import se.stade.colligo.iterators.Iterator;
    import se.stade.colligo.Queue;
    import se.stade.colligo.iterators.LinearIterator;
    import se.stade.colligo.operators.toEnumerable;
    
    /**
     * A first-in first-out queue.
     * 
     * @author Marcus Stade
     */
    public class FifoQueue implements Queue, Inspectable, Countable, Arrayable
    {
        /**
         * Constructs a first-in first-out queue with the given items
         * as initial values.
         * 
         * @param items An optional list of values to populate this queue.
         */
        public function FifoQueue(... items)
        {
            list = se.stade.colligo.operators.toEnumerable(items);
        }
        
        private var list:Array;
        
        /**
         * @inheritDoc
         */
        public function add(item:*):void
        {
            list.push(item);
        }
        
        /**
         * @inheritDoc
         */
        public function remove(item:*):void
        {
            var index:int = list.indexOf(item);
            
            if (index >= 0)
                list.splice(index, 0);
        }
        
        /**
         * @inheritDoc
         */
        public function pop():*
        {
            if (length == 0)
                return null;
                
            return list.shift();
        }
        
        /**
         * @inheritDoc
         */
        public function contains(item:*):Boolean
        {
            return list.indexOf(item) >= 0;
        }
        
        /**
         * @inheritDoc
         */
        public function clear():void
        {
            list = [];
        }
        
        /**
         * @inheritDoc
         */
        public function get length():uint
        {
            return list.length;
        }
        
        /**
         * @inheritDoc
         */
        public function get isEmpty():Boolean
        {
            return length == 0;
        }

        /**
         * @inheritDoc
         */
        public function iterate():Iterator
        {
            return new LinearIterator(list);
        }
        
        /**
         * @inheritDoc 
         */
        public function toArray():Array
        {
            return list.slice();
        }
    }
}
