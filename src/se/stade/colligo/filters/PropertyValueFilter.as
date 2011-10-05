package se.stade.colligo.filters
{
    import se.stade.daffodil.Reflect;
    import se.stade.daffodil.Reflection;
    import se.stade.daffodil.properties.Property;

    public class PropertyValueFilter extends FilterBase implements Filter
    {
        public function PropertyValueFilter(name:String, value:*)
        {
            super(this);
            this.value = value;
            findProperty = Reflect.first.property.named(name).withReadAccess;
        }
        
        private var findProperty:Reflection;
        private var value:*;
        
        public function validates(item:*):Boolean
        {
            var property:Property = findProperty.on(item);
            return property && property.value === value;
        }
    }
}
