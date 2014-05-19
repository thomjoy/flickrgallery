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

	public function new(imgId: String, imgSrc: String)
	{
		tagName = "li";
		super();
		element.className = "gallery-item";
		element.innerHTML = "<img id='img-" + imgId + "' src='" + imgSrc + "' />";
		element.setAttribute('data-favourite', 'false');
		element.setAttribute('data-img-id', imgId);
		element.onclick = onToggleFavourite;
	}

	public function onToggleFavourite(event:js.html.Event)
	{
		var favouriteStatus = untyped __js__('event.target.parentNode.getAttribute("data-favourite")');

		untyped __js__(' 
			var b = event.target.parentNode.getAttribute("data-favourite");
			var n = b == "true" ? "false" : "true";
			event.target.parentNode.setAttribute("data-favourite", n)');

		signal.dispatch(favouriteStatus, this);
	}
}