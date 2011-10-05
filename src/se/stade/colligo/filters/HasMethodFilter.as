package se.stade.colligo.filters
{
    public class HasMethodFilter extends FilterBase implements Filter
    {
        public function HasMethodFilter(name:String)
        {
            super(this);
            this.name = name;
        }
        
        private var name:String;
        
        public function validates(item:*):Boolean
        {
            return name in item && item[name] is Function;
        }
    }
}
