package flickrgallery.app.view;

import mmvc.api.IViewContainer;
import flickrgallery.core.View;

// subviews
import flickrgallery.app.view.GalleryView;
import flickrgallery.app.view.SearchBoxView;

import js.Lib;
import js.Browser;

class AppView extends View implements mmvc.api.IViewContainer
{
	public var viewAdded:Dynamic -> Void;
	public var viewRemoved:Dynamic -> Void;

	public function new()
	{
		super();
		element.className = "container";
		element.setAttribute("id", "app-container");
	}

	public function isAdded(view:Dynamic):Bool
	{
		return true;
	}

	public function createViews()
	{
		var searchBoxView = new SearchBoxView();
		this.viewAdded(searchBoxView);

		// trying to add the button view to the context
		this.viewAdded(searchBoxView.children[1]);
		
		var galleryView = new GalleryView();
		this.viewAdded(galleryView);

		trace('AppView.createViews');
	}

	override function initialize()
	{
		super.initialize();
		js.Browser.document.body.appendChild(element);
	}
}