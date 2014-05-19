package flickrgallery.app.view;

import flickrgallery.app.view.GalleryView;
import js.Browser;

class FavouritesView extends GalleryView
{
	public function new(htmlId: String)
	{
		tagName = "ul";
		super(htmlId);
		element.setAttribute("id", htmlId);

		var status = Browser.document.createElement("div");
		status.setAttribute("id", "favourites-status");
		status.className = "";
		element.appendChild(status);
		
		trace('FavouritesView.new');
	}

	override function initialize()
	{
		super.initialize();
	}
}