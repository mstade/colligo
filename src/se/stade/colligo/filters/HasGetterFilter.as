package se.stade.colligo.filters
{
	import se.stade.daffodil.Reflect;
	import se.stade.daffodil.Reflection;

	public class HasGetterFilter extends FilterBase implements Filter
	{
		public function HasGetterFilter(name:String)
		{
            super(this);
			getterExists = Reflect.all.properties.named(name).withReadAccess;
		}
		
		private var getterExists:Reflection;
		
		public function validates(item:*):Boolean
		{
			return getterExists.on(item);
		}
	}
}