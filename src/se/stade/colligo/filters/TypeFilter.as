package se.stade.colligo.filters
{
    public class TypeFilter extends FilterBase implements Filter
    {
        public function TypeFilter(type:Class)
        {
            super(this);
            _type = type;
        }
        
        private var _type:Class;
        public function get type():Class
        {
            return _type;
        }
        
        public function validates(item:*):Boolean
        {
            return item is type;
        }
    }
}
