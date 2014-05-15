package flickrgallery.app.mediator;

import flickrgallery.app.view.ButtonView;
import flickrgallery.app.signal.Search;

import flickrgallery.app.api.Flickr;
import haxe.Json;

class ButtonViewMediator extends mmvc.impl.Mediator<ButtonView>
{
	@inject public var FlickrSearch:Search;

	public function new()
	{
		super();
	}

	override function onRegister()
	{
		super.onRegister();
		mediate(this.view.clickSignal.add(searchHandler));
	}

	override function onRemove()
	{
		super.onRemove();
	}

	function searchHandler(event:String, searchTerm:String)
	{
		if(event == ButtonView.DO_SEARCH)
		{
			// This should be a request to a service, or instainatied somewhere else?
			var f = new Flickr();
			f.search( searchTerm );	
			f.signal.add(processSearch);
		}

	}
	
	function processSearch(searchResults: haxe.Json)
	{
		/*
			JSON.parse(req.responseText).photos.photo.map(function(p) {
	        	return '<li><img src=http://farm' + p.farm + '.staticflickr.com/' + p.server + '/' + p.id + '_' + p.secret + '_q.jpg /></li>';
	        });
		*/
		trace(searchResults.photos);
	}
}