package se.stade.colligo.iterators
{
    import se.stade.colligo.operators.toEnumerable;
    
    public class LinearIterator implements Iterator
    {
        public static const empty:LinearIterator = new LinearIterator([]);

        public function LinearIterator(... iterable)
        {
            this.iterable = toEnumerable(iterable);
            rewind();
        }
        
        protected var iterable:*;
        protected var currentIndex:int; 
        
        public function get current():*
        {
            try
            {
                return iterable[currentIndex];
            }
            catch (e:Error)
            {
                return undefined;
            }
        }

        public function get hasNext():Boolean
        {
            return (currentIndex + 1 < iterable.length);
        }
        
        public function rewind():void
        {
            currentIndex = -1;
        }
        
        public function getNext():*
        {
            if (hasNext)
                return iterable[++currentIndex];
            
            return undefined;
        }
        
        public function forEachItem(method:Function, ... parameters):void
        {
            for each (var item:* in iterable)
            {
                method.apply(null, [item].concat(parameters));
            }
        }
    }
}
