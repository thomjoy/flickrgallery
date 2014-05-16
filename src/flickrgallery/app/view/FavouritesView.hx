package flickrgallery.app.view;

import flickrgallery.app.view.GalleryView;

class FavouritesView extends GalleryView
{
	public function new(htmlId: String)
	{
		super(htmlId);
	}

	override function createViews()
	{
		trace('FavouritesView.createViews');
	}

	override function initialize()
	{
		super.initialize();
		js.Browser.document.getElementById('app-container').appendChild(element);
	}
}