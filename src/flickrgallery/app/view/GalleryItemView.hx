package flickrgallery.app.view;

import flickrgallery.core.View;
import msignal.Signal;
import js.Browser;

import mmvc.api.IViewContainer;

class GalleryItemView extends View implements mmvc.api.IViewContainer
{
	public var viewAdded:Dynamic -> Void;
	public var viewRemoved:Dynamic -> Void;

	public function isAdded(view:Dynamic):Bool
	{
		return true;
	}

	public function new(imgSrc: String)
	{
		tagName = "li";
		super();
		element.className = "gallery-item";
		element.innerHTML = "<img id='img-" + this.id.substring(4, this.id.length) + "' src='" + imgSrc + "' />";
		element.setAttribute('data-favourite', 'false');
		element.onclick = onToggleFavourite;
	}

	public function onToggleFavourite(event:js.html.Event)
	{
		var favouriteStatus = untyped __js__('event.target.parentNode.getAttribute("data-favourite")');
		trace('Dispatching: ' + favouriteStatus);
		
		signal.dispatch(favouriteStatus, this);
	}
}