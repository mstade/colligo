package se.stade.colligo.lists
{
	import se.stade.colligo.Processable;
	import se.stade.colligo.operators.toEnumerable;
	import se.stade.daffodil.Reflect;
	import se.stade.daffodil.methods.Method;
	import se.stade.daffodil.properties.Property;

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
		public function call(methodName:String, ... parameters):*
		{
            var methods:Array = Reflect.all.methods
                                       .named(methodName)
                                       .on(list);
            
            var commonResult:* = undefined;
            
            if (methods.length)
            {
                
                methods.slice(1);
                
                for each (var method:Method in methods)
                {
                    var result:* = method.invoke(parameters);
                    commonResult = (result === commonResult) ? result : undefined;
                }
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
		public function get(propertyName:String):*
		{
			var properties:Array = Reflect.all.properties
                                          .named(propertyName)
                                          .withReadAccess
                                          .on(list);
			
            var value:* = undefined;
            
			if (properties.length)
            {
    			value = properties[0].value;
            
                properties.slice(1);
    			
                for each (var property:Property in properties)
                {
                    if (property.value === value)
                        continue;
    				
    				return undefined;
    			}
            }
			
			return value;
		}
		
		/**
		 * @inheritDoc
		 */
		public function set(values:Object):void
		{
			for (var propertyName:String in values)
			{
                var properties:Array = Reflect.all.properties
                                              .named(propertyName)
                                              .withWriteAccess
                                              .on(list);
				
				for each (var property:Property in properties)
				{
                    property.value = values[propertyName];
				}
			}
		}
	}
}