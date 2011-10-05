package se.stade.colligo.associative
{
    import flash.utils.Dictionary;
    
    import se.stade.colligo.Arrayable;
    import se.stade.colligo.Associative;
    import se.stade.colligo.Collection;
    import se.stade.colligo.iterators.Iterator;
    import se.stade.colligo.iterators.LinearIterator;
    import se.stade.colligo.lists.LinearSet;
    
    public class Table implements Associative, Collection, Arrayable
    {
        public function Table(items:Vector.<KeyValuePair> = null)
        {
            clear();
            
            for each (var pair:KeyValuePair in items)
            {
                add(pair.value, pair.key);
            }
        }
        
        protected var columns:Dictionary;
        protected var index:Dictionary;
        protected var count:uint;
        
        public function get isEmpty():Boolean
        {
            return count == 0;
        }
        
        public function add(key:*, item:*):void
        {
            var column:LinearSet = columns[key];
            if (!column)
                columns[key] = column = new LinearSet();
            
            column.add(item);
            
            var keys:LinearSet = index[item];
            if (!keys)
                index[item] = keys = new LinearSet();
            
            keys.add(key);
            
            count++;
        }

        public function remove(item:*):void
        {
            if (contains(item))
            {
                for each (var key:* in index[item])
                {
                    columns[key].remove(item);
                    
                    if (columns[key].isEmpty)
                        delete columns[key];
                }
                
                delete index[item];
            }
            
            count--;
        }
        
        public function removeKey(key:*):void
        {
            if (containsKey(key))
            {
                for each (var item:* in columns[key])
                {
                    index[item].remove(key);
                    
                    if (index[item].isEmpty)
                        delete index[item];
                }
                
                delete columns[key];
            }
        }
        
        public function get(key:*):*
        {
            return columns[key];
        }

        public function getKeys(item:*):Array
        {
            if (contains(item))
                return index[item].toArray();
            
            return [];
        }
        
        public function contains(item:*):Boolean
        {
            return index[item] !== undefined;
        }
        
        public function containsKey(key:*):Boolean
        {
            return columns[key] !== undefined;
        }
        
        public function iterate():Iterator
        {
            return new LinearIterator(toArray());
        }
        
        public function clear():void
        {
            columns = new Dictionary();
            index = new Dictionary();
            count = 0;
        }
        
        public function toArray():Array
        {
            var items:LinearSet = new LinearSet();
            
            for (var key:* in columns)
            {
                items = LinearSet(items.merge(columns[key]));
            }
            
            return items.toArray();
        }
    }
}
