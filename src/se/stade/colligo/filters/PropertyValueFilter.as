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
			namedProperty = Reflect.properties.named(name).thatAreWritable;
		}
		
		private var namedProperty:Reflection;
		private var value:*;
		
		public function validates(item:*):Boolean
		{
			var property:Property = Reflect.on(item)
                                           .findFirst(namedProperty) as Property;
            
			return property
                   && property.value === value;
		}
	}
}