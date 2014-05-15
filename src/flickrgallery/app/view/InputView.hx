package flickrgallery.app.view;

import flickrgallery.core.View;

import js.Browser;
import js.html.Event;

class InputView extends View
{
	public function new()
	{
		tagName = "input";
		super();
		element.setAttribute("type", "text");
		element.setAttribute("placeholder", "Search...");
		element.setAttribute("id", "input-search");
		element.className = "form-control";
		trace('InputView.new');
	}
}