package se.stade.colligo.filters
{
    internal class FilterBase
    {
        public function FilterBase(filter:Filter)
        {
            this.filter = filter;
        }
        
        private var filter:Filter;
        
        public function applyTo(enumerable:Object):Array
        {
            var result:Array = [];
            
            for each (var item:* in enumerable)
            {
                if (filter.validates(item))
                    result.push(item);
            }
            
            return result;
        }
    }
}