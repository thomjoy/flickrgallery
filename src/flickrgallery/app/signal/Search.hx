package flickrgallery.app.signal;

import msignal.Signal;

class Search extends msignal.Signal0
{
	/**
	dispatched when Flickr API has returned
	*/
	//public var completed:Signal1<Dynamic>;

	/**
	Dispatched if application unable to load TodoList
	*/
	//public var failed:Signal1<Dynamic>;
	
	public function new()
	{
		super();
		trace('Search');
		//completed = new Signal1<TodoList>(TodoList);
		//failed = new Signal1<Dynamic>(Dynamic);
	}
}