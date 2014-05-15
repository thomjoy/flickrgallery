package flickrgallery.app.context;

import mmvc.api.IViewContainer;

// Flickr API Service
import flickrgallery.app.api.Flickr;

// Load Views and Mediators
import flickrgallery.app.view.*;
import flickrgallery.app.mediator.*;

// Models
import flickrgallery.app.model.*;

// Command
import flickrgallery.app.signal.Search;
import flickrgallery.app.command.SearchCommand;

class AppContext extends mmvc.impl.Context
{
	public function new(?contextView:IViewContainer=null)
	{
		super(contextView);
	}

	/**
	Overrides startup to configure all context commands, models and mediators
	@see mmvc.impl.Context
	*/
	override public function startup()
	{
		trace('AppContext.startup');

		// Flickr API Service
		injector.mapSingleton(Flickr);

		// Gallery Model
		injector.mapSingleton(Gallery);

		// Subviews
		mediatorMap.mapView(GalleryView, GalleryViewMediator);
		mediatorMap.mapView(GalleryItemView, GalleryViewMediator);
		mediatorMap.mapView(SearchBoxView, SearchBoxViewMediator);
		mediatorMap.mapView(ButtonView, ButtonViewMediator);

		// map Signals -> Commands
		commandMap.mapSignalClass(Search, SearchCommand);

		// wiring for main application module
		mediatorMap.mapView(AppView, AppViewMediator);
	}

	/**
	Overrides shutdown to remove/cleanup mappings
	@see mmvc.impl.Context
	*/
	override public function shutdown()
	{
		
	}
}