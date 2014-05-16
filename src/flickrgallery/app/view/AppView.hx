package flickrgallery.app.view;

import mmvc.api.IViewContainer;
import flickrgallery.core.View;

// subviews
import flickrgallery.app.view.GalleryView;
import flickrgallery.app.view.SearchBoxView;
import flickrgallery.app.view.FavouritesView;

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

	/**
	Overrides signal bubbling to trigger view added/removed handlers for IViewContainer
	@param event 	a string event type
	@param view 	instance of view that originally dispatched the event
	*/
	override public function dispatch(event:String, view:View)
	{
		switch(event)
		{
			case View.ADDED:
			{
				viewAdded(view);
			}
			case View.REMOVED:
			{
				viewRemoved(view);
			}
			default:
			{
				super.dispatch(event, view);
			}
		}
	}

	public function isAdded(view:Dynamic):Bool
	{
		return true;
	}

	public function createViews()
	{
		var searchBoxView = new SearchBoxView();
		addChild(searchBoxView);
		this.viewAdded(searchBoxView);

		// trying to add the button view to the context
		this.viewAdded(searchBoxView.children[1]);
		
		var galleryView = new GalleryView('gallery');
		addChild(galleryView);
		this.viewAdded(galleryView);

		var favouritesView = new FavouritesView('favourites');
		addChild(favouritesView);
		this.viewAdded(favouritesView);

		trace('AppView.createViews');
	}

	override function initialize()
	{
		super.initialize();
		js.Browser.document.body.appendChild(element);
	}
}