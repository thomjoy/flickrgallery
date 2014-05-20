package flickrgallery.app.view;

import flickrgallery.core.View;
import msignal.Signal;
import js.Browser;
import mmvc.api.IViewContainer;
import flickrgallery.app.iface.Photo;

class GalleryItemView extends View implements IViewContainer implements Photo
{
	public function new(imgId: String, imgSrc: String, favourite: Bool)
	{
		tagName = "li";
		super();
		element.className = "gallery-item";
		element.innerHTML = "<img id='img-" + imgId + "' src='" + imgSrc + "' />";
		element.setAttribute('data-favourite', "false");
		element.setAttribute('data-img-id', imgId);
		element.onclick = onClick;
	}

	public var viewAdded:Dynamic -> Void;
	public var viewRemoved:Dynamic -> Void;

	public function isAdded(view:Dynamic):Bool
	{
		return true;
	}

	// From Photo interface
	public function onClick(event:js.html.Event)
	{
		var favouriteStatus = untyped __js__('event.target.parentNode.getAttribute("data-favourite")');

		untyped __js__(' 
			var b = event.target.parentNode.getAttribute("data-favourite");
			var n = b == "true" ? "false" : "true";
			event.target.parentNode.setAttribute("data-favourite", n)');

		signal.dispatch(favouriteStatus, this);
	}
}