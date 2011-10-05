package se.stade.colligo.filters
{
    public class NegatedFilter extends FilterBase implements Filter
    {
        public function NegatedFilter(filter:Filter)
        {
            super(this);
            this.filter = filter;
        }
        
        private var filter:Filter;
        
        public function validates(item:*):Boolean
        {
            return !filter.validates(item);
        }
    }
}
