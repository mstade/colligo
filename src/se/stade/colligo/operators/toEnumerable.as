package se.stade.colligo.operators
{
    import se.stade.colligo.Arrayable;
    import se.stade.colligo.Collection;
    import se.stade.colligo.iterators.Iterator;

    public function toEnumerable(object:*):Array
    {   
        var items:Array = [];
        
        if (!object)
            return items;
        else if (object is Array)
        {
            if (object.length == 1)
                return toEnumerable(object[0]);
            
            return object; 
        }
        else if (isEnumerable(object))
        {
            for each (var item:* in object)
            {
                items.push(item);
            }
            
            return items;
        }
        else if (object is Arrayable)
        {
            return object.toArray();
        }
        else if (object is Collection)
        {
            return toEnumerable(Collection(object).iterate());
        }
        else if (object is Iterator)
        {
            var iterator:Iterator = object;
            
            while (iterator.hasNext)
            {
                items.push(iterator.getNext());
            }
            
            return items;
        }
        
        return [object];
    }
}
