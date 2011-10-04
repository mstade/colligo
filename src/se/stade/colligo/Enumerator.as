package se.stade.colligo
{
	import flash.utils.Dictionary;
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	
	import se.stade.colligo.associative.KeyValuePair;
	
	public dynamic class Enumerator extends Proxy
	{
		public function Enumerator(pairs:Vector.<KeyValuePair>)
		{
			initialize(pairs);
		}
		
		protected function initialize(pairs:Vector.<KeyValuePair>):void
		{
			keys = new Dictionary();
			values = new Dictionary();
			
			for each (var pair:KeyValuePair in pairs)
			{
				keys[pair.key] = pair;
				values[pair.value] = pair;
			}
			
			this.pairs = pairs;
		}
		
		protected var keys:Dictionary;
		protected var values:Dictionary;
		protected var pairs:Vector.<KeyValuePair>;
		
		public function get length():uint
		{
			return pairs.length;
		}
		
		protected function getValue(index:int):*
		{
			return pairs[index].value;
		}
		
		protected function getName(index:int):String
		{
			return pairs[index].key;
		}
		
		protected function getNextIndex(currentIndex:int):int
		{
			if (currentIndex < length)
				return currentIndex + 1;
			else
				return 0;
		}
		
		protected function hasProperty(name:*):Boolean
		{
			return name in keys;
		}
		
		protected function getProperty(name:*):*
		{
			if (name in keys)
				return keys[name].value;
			
			return undefined;
		}
		
		protected function setProperty(name:*, value:*):void
		{
			if (name in keys)
			{
				deleteProperty(name);
				var newPair:KeyValuePair = new KeyValuePair(name, value);
				
				pairs.push(newPair);
				keys[name] = newPair;
			}
		}
		
		protected function deleteProperty(name:*):Boolean
		{
			if (name in keys)
			{
				var index:int = pairs.indexOf(keys[name]);
				
				delete keys[name];
				pairs.splice(index, 1);
				
				return true;
			}
			
			return false;
		}
		
		protected function callMethod(name:*, ... rest):*
		{
			if (name in keys && keys[name].value is Function)
				return (keys[name].value as Function).apply(this, rest);
		}
		
		override flash_proxy function getProperty(name:*):*
		{
			return protected::getProperty(name);
		}
		
		override flash_proxy function hasProperty(name:*):Boolean
		{
			return protected::hasProperty(name);
		}
		
		override flash_proxy function callProperty(name:*, ... rest):*
		{
			return callMethod.apply(this, [name].concat(rest));
		}
		
		override flash_proxy function setProperty(name:*, value:*):void
		{
			protected::setProperty(name, value);
		}
		
		override flash_proxy function deleteProperty(name:*):Boolean
		{
			return protected::deleteProperty(name);
		}
		
		override flash_proxy function nextNameIndex(index:int):int
		{
			return getNextIndex(index);
		}
		
		override flash_proxy function nextName(index:int):String
		{
			return getName(index);
		}
		
		override flash_proxy function nextValue(index:int):*
		{
			return getValue(index - 1);    	        	
		}
	}
}