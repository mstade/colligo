package se.stade.colligo
{
    public interface IndexableList extends Collection, Indexable, List
    {
        function addItemAt(index:uint, item:*):void;
        function removeItemAt(index:uint):void;
    }
}
