package se.stade.colligo.lists
{
	import se.stade.colligo.Arrayable;
	import se.stade.colligo.Collection;
	import se.stade.colligo.Countable;
	import se.stade.colligo.Enumerator;
	import se.stade.colligo.Indexable;
	import se.stade.colligo.Inspectable;
	import se.stade.colligo.associative.KeyValuePair;
	import se.stade.colligo.iterators.Iterator;
	import se.stade.colligo.iterators.LinearIterator;
	import se.stade.colligo.operators.toEnumerable;
	
	public dynamic class ImmutableArray extends Enumerator implements Collection, Countable, Indexable, Inspectable, Arrayable
	{
		public function ImmutableArray(... items)
		{
			list = se.stade.colligo.operators.toEnumerable(items);
			super(KeyValuePair.fromList(list));
		}
		
		protected var list:Array;
		
		public function getItemAt(index:int):*
		{
			return this[index];
		}
		
		public function indexOf(item:*, fromIndex:int = 0):int
		{
			if (contains(item))
				return pairs.indexOf(values[item], fromIndex);
			
			return -1;
		}

		public function lastIndexOf(item:*, fromIndex:int=0x7fffffff):int
		{
			if (contains(item))
				return pairs.lastIndexOf(values[item], fromIndex);
			
			return -1;
		}
		
		public function get isEmpty():Boolean
		{
			return count == 0;
		}

		public function contains(value:*):Boolean
		{
			return value in values;
		}
		
		public function iterate():Iterator
		{
			return new LinearIterator(toArray());
		}
		
		public function toArray():Array
		{
			return list.slice();
		}
		
		override protected function setProperty(name:*, value:*):void { }
		override protected function deleteProperty(name:*):Boolean { return false; }
	}
}