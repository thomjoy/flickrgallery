package flickrgallery.app.view;

import js.Browser;
import msignal.Signal;
import flickrgallery.core.View;
import mmvc.api.IViewContainer;
import flickrgallery.app.iface.Photo;

class FavouritesItemView extends View implements IViewContainer implements Photo
{
	public function new(imgId: String, imgSrc: String, favourite: Bool)
	{
		tagName = "li";
		super();
		element.className = "favourite-item";
		element.innerHTML = "<img id='img-" + imgId + "' src='" + imgSrc + "' />";
		element.setAttribute('data-favourite', "true");
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
	public function onClick(event:js.html.Event):Void
	{
		signal.dispatch("false", this);
	}
}