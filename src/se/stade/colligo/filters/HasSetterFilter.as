package se.stade.colligo.filters
{
	import se.stade.daffodil.Reflect;
	import se.stade.daffodil.Reflection;

	public class HasSetterFilter extends FilterBase implements Filter
	{
		public function HasSetterFilter(name:String)
		{
            super(this);
			setterExists = Reflect.first.property.named(name).withWriteAccess;
		}
		
		private var setterExists:Reflection;
		
		public function validates(item:*):Boolean
		{
			return setterExists.on(item);
		}
	}
}