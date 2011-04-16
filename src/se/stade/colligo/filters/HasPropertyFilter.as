package se.stade.colligo.filters
{
	import se.stade.daffodil.Reflect;
	import se.stade.daffodil.Reflection;

	public class HasPropertyFilter extends FilterBase implements Filter
	{
		public function HasPropertyFilter(name:String)
		{
            super(this);
            propertyExists = Reflect.first.property.named(name);
		}
		
		private var propertyExists:Reflection;
		
		public function validates(item:*):Boolean
		{
			return propertyExists.on(item);
		}
	}
}