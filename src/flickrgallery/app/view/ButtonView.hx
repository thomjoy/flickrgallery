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
		element.onclick = onSearch;
		element.onkeyup = detectEnter;

		this.clickSignal = new Signal2<String, String>();
	}

	override function remove()
	{
		element.onclick = null;
	}

	function detectEnter(event:js.html.Event)
	{
		//event.which = event.which || event.keyCode;
    	//if(event.which == 13)
    	//{
        	onSearch(event);
    	//}
	}

	function onSearch(event:js.html.Event)
	{
		var searchTerm: js.html.InputElement;
		searchTerm = cast js.Browser.document.getElementById('input-search');

		this.clickSignal.dispatch(DO_SEARCH, searchTerm.value);
	}
}