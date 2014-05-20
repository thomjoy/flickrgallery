package flickrgallery.app.view;

import flickrgallery.app.view.GalleryView;
import js.Browser;

class FavouritesView extends GalleryView
{
	public var status: js.html.Element;

	public function new(htmlId: String)
	{
		tagName = "ul";
		super(htmlId);
		element.setAttribute("id", htmlId);

		// status element thingy
		status = Browser.document.createElement("div");
		status.setAttribute("id", "favourites-status");
		status.className = "";
		element.appendChild(status);
		
		trace('FavouritesView.new');
	}

	override function initialize()
	{
		super.initialize();
	}

	public function updateStatus(numItems: Int)
	{
		status.innerHTML = numItems == 0 ? "No favourites" : numItems + " favourites";
	}
}