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
import flickrgallery.app.signal.GalleryUpdateSignal;
import flickrgallery.app.command.GalleryUpdateCommand;

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
		injector.mapSingleton(GalleryModel);

		// Gallery Item Models
		injector.mapClass(GalleryItemModel, GalleryItemModel);

		// map Signals -> Commands
		commandMap.mapSignalClass(GalleryUpdateSignal, GalleryUpdateCommand);

		// Subviews
		mediatorMap.mapView(GalleryView, GalleryViewMediator);
		mediatorMap.mapView(SearchBoxView, SearchBoxViewMediator);
		mediatorMap.mapView(ButtonView, ButtonViewMediator);

		// Dynamically added
		mediatorMap.mapView(GalleryItemView, GalleryItemViewMediator);

		// wiring for main application module
		mediatorMap.mapView(AppView, AppViewMediator);
	}

	override public function shutdown()
	{
		trace('shutdown');
	}
}