package se.stade.colligo.operators
{
    import se.stade.colligo.lists.ItemProxy;

    public function expand(... items):ItemProxy
    {
        return new ItemProxy(items);
    }
}
