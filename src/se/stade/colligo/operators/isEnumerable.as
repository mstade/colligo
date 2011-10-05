package se.stade.colligo.operators
{
    import flash.utils.getQualifiedClassName;

    public function isEnumerable(object:Object):Boolean
    {
        if (object is Array)
        {
            return true;
        }
        else if (getQualifiedClassName(object).indexOf("Vector.<") > -1)
        {
            return true;
        }
        
        for each (var item:* in object)
        {
            return true;
        }
        
        return false;
    }
}
