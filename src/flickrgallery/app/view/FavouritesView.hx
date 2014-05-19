package flickrgallery.app.view;

import flickrgallery.app.view.GalleryView;

class FavouritesView extends GalleryView
{
	public function new(htmlId: String)
	{
		tagName = "ul";
		super(htmlId);
		element.setAttribute("id", htmlId);
		trace('FavouritesView.new');
	}

	override function createViews()
	{
		trace('FavouritesView.createViews');
	}

	override function update()
	{
		trace('here');
	}

	override function initialize()
	{
		super.initialize();
		js.Browser.document.getElementById('favourites-container').appendChild(element);
	}
}