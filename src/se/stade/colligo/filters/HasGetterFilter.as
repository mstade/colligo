package se.stade.colligo.filters
{
	import se.stade.daffodil.Reflect;
	import se.stade.daffodil.Reflection;

	public class HasGetterFilter extends FilterBase implements Filter
	{
		public function HasGetterFilter(name:String)
		{
            super(this);
			getter = Reflect.properties.named(name).thatAreReadable;
		}
		
		private var getter:Reflection;
		
		public function validates(item:*):Boolean
		{
			return Reflect.properties
                          .thatAreReadable
                          .on(item)
                          .length > 0;
		}
	}
}