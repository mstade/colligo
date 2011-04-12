package se.stade.colligo.filters
{
	import se.stade.daffodil.Reflect;
	import se.stade.daffodil.Reflection;

	public class HasSetterFilter extends FilterBase implements Filter
	{
		public function HasSetterFilter(name:String)
		{
            super(this);
			setter = Reflect.properties.named(name).thatAreWritable;
		}
		
		private var setter:Reflection;
		
		public function validates(item:*):Boolean
		{
			return Reflect.properties
                          .thatAreWritable
                          .on(item)
                          .length > 0;
		}
	}
}