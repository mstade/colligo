package se.stade.colligo.filters
{
	import se.stade.daffodil.Reflect;
	import se.stade.daffodil.Reflection;

	public class HasPropertyFilter extends FilterBase implements Filter
	{
		public function HasPropertyFilter(name:String)
		{
            super(this);
			property = Reflect.properties.named(name);
		}
		
		private var property:Reflection;
		
		public function validates(item:*):Boolean
		{
			return Reflect.properties
                          .on(item)
                          .length > 0;
		}
	}
}