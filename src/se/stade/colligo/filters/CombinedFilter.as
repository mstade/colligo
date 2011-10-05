package se.stade.colligo.filters
{
    public class CombinedFilter extends FilterBase implements Filter
    {
        public function CombinedFilter(... filters)
        {
            super(this);
            
            this.filters = Vector.<Filter>(filters);
        }
        
        private var filters:Vector.<Filter>;
        
        public function validates(item:*):Boolean
        {
            for each (var filter:Filter in filters)
            {
                if (!filter.validates(item))
                    return false;
            }
            
            return true;
        }
    }
}
