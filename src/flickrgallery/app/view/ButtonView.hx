package flickrgallery.app.view;

import flickrgallery.core.View;

import js.Browser;
import js.html.*;

import msignal.Signal;

class ButtonView extends View implements mmvc.api.IViewContainer
{
	inline public static var DO_SEARCH = "DO_SEARCH";

	public var clickSignal:Signal2<String, String>;

	public var viewAdded:Dynamic -> Void;
	public var viewRemoved:Dynamic -> Void;

	public function isAdded(view:Dynamic):Bool
	{
		return true;
	}

	public function new()
	{
		tagName = "button";
		super();
		element.setAttribute("id", "btn-search");
		element.innerHTML = "Search";
		element.className = "btn btn-primary";
		element.onclick = clickHandler;

		this.clickSignal = new Signal2<String, String>();

		trace('ButtonView.new');
	}

	override function remove()
	{
		element.onclick = null;
	}

	function clickHandler(event:js.html.Event)
	{
		var searchTerm: js.html.InputElement;
		searchTerm = cast js.Browser.document.getElementById('input-search');

		this.clickSignal.dispatch(DO_SEARCH, searchTerm.value);

		/*
		var req = new js.html.XMLHttpRequest();
		var url = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=4111e112a393aefbf0a66241479722cd&tags=" + searchTerm.value + "&format=json&nojsoncallback=1";
		
		req.onreadystatechange = untyped __js__("function(){
			var allGood = (req.readyState == 4 && req.status == 200);
	    	if( allGood ) {
				document.getElementById('gallery').innerHTML = JSON.parse(req.responseText).photos.photo.map(function(p) {
	        		return '<li><img src=http://farm' + p.farm + '.staticflickr.com/' + p.server + '/' + p.id + '_' + p.secret + '.jpg /></li>';
	        	});
			}
		};");

		req.open("GET", url, true);
		req.send();
		*/
	}
}