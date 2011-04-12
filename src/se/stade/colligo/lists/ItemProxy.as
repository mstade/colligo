package se.stade.colligo.lists
{
	import se.stade.colligo.Processable;
	import se.stade.colligo.filters.HasMethodFilter;
	import se.stade.colligo.filters.HasSetterFilter;
	import se.stade.colligo.operators.toEnumerable;
	import se.stade.daffodil.Reflect;

	/**
	 * 
	 * @author marcus
	 */
	public class ItemProxy extends ImmutableArray implements Processable
	{
		/**
		 * @param items
		 */
		public function ItemProxy(...items)
		{
			super(toEnumerable(items));
		}
		
		/**
		 * @inheritDoc
		 */
		public function call(method:String, ... parameters):*
		{
			var items:Array = new HasMethodFilter(method).applyTo(list);
			if (items.length == 0)
				return undefined;
			
			var item:Object = items.shift();
			var commonResult:* = item[method].apply(item, parameters);
			
			for each (item in items)
			{
				var result:* = item[method].apply(item, parameters);
				
				if (result !== commonResult)
					commonResult = undefined;
			}
			
			return commonResult;
		}

		/**
		 * @inheritDoc
		 */
		public function every(method:Function, ... parameters):void
		{
			for each (var item:Object in list)
			{
				method.apply(item, parameters.concat([item]));
			}
		}

		
		/**
		 * @inheritDoc
		 */
		public function get(property:String):*
		{
			var properties:Array = Reflect.properties
                                          .named(property)
                                          .thatAreReadable
                                          .on(this);
			
			if (properties.length == 0)
				return undefined;
			
			var commonValue:* = properties[0].value;
			
			for (var i:int = 1; i < properties.length; i++)
			{
				if (properties[i].value === commonValue)
					continue;
				
				return undefined;
			}
			
			return commonValue;
		}
		
		/**
		 * @inheritDoc
		 */
		public function set(properties:Object):void
		{
			for (var name:String in properties)
			{
				var items:Array = new HasSetterFilter(name).applyTo(list);
				
				for each (var item:* in items)
				{
					item[name] = properties[name];
				}
			}
		}
	}
}