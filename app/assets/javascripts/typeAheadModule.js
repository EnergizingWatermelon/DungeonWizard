/* Example 
    <ANY id="parmsContainer"></ANY>
	<INPUT type="text" class="typeahead" data-query="/lookups" data-name="thisFilterName" data-parms="#parmsContainer" />
	<!-- all other scripts like jQuery, Bootstrap, and typeahead.js-->
	<script src="~/scripts/typeaheadmodule.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function() {// tell jQuery to run this when the DOM loads
			var typeaheads = $('.typeahead');
			typeAheadModule.init(typeaheads);
		});
	</script>
*/
var typeAheadModule = (function() {
	
	// data-query=/lookups
	const DataAttrQuery = "query";
	
	// data-params="in-scope of element object with fields on it"
	const DataAttrSharedParms = "parms"
	
	// data-name
	const DataAttrName = "name";
	
	function cloneObject(obj) {
		var keys = Object.keys(obj);
		var key = null;
		var val = {};
		for(var i = 0; i < keys.length; i++) {
			key = keys[i];
			val[key] = obj[key];
		}
		
		return val;
	}
	
	function getAttrParm($e, name) {
		return $e.attr('data-'+name);
	}
	// init a set of typeahead elements using the jQuery selected elements
	function makeTypeahead($elems) {
		var parms = {};
		const sharedParmName = 'dat';
		// for all matched elements
		$elems.each(function(ix, elem) {
			var $elem = $(elem);
			var name = getAttrParm($elem, DataAttrName);
			var dataId = getAttrParm($elem, DataAttrSharedParms);
			var dataKey = dataId.substr(1);
			var dataElem = null;
			if(parms.hasOwnProperty(dataKey))
			{
				dataElem = parms[dataKey];
			} 
			else 
			{
				dataElem = $(dataId).eq(0);
				parms[dataKey] = dataElem;
			}
			
			
			// create a getter method for this element's data object
			var data = function(obj) {
				
				
				if(arguments.length) {
					$.data(parms[dataKey], sharedParmName, obj);
					return;
				}
				
				var d = $.data(parms[dataKey], sharedParmName);
				
				if(d) {
					return d;
				}
				
				d = {};
				$.data(parms[dataKey], sharedParmName, d);
				
				return d;//has all query properties on it
			};
			
			// where we send the HTTP GET
			var action = getAttrParm($elem, DataAttrQuery);// where to send request
			
			// create the typeahead.js compat delegate for getting the matches
			function remoteQuery(filter, syncResults, asyncResults) {
				var d = data();//get the data with our getter
				var clone = cloneObject(d);// make a copy
				clone.target = name;//append the well-known target property so the controller knows what typeahead is asking
				
				// return the Deferred/Promise from the HTTP GET Ajax request with the then(success) callback arranged already
				// such that it tells typeahead.js about the data fetched asyncronously
				return $.get(action, clone)
				.then(function(serverData) {
					/// results.data should be there from ajax request
					asyncResults(serverData);//[{ id: ##, name: ""}, ...]
				});//returns a Deferred
			}
			
			// when we init the typeahead, we want a that reference so we can listen to events
			var that = $elem.typeahead(
			{
				highlight: true,
				hint: true,
				minLength: 1// must type at-least one character before remoteQuery invoked
			}, 
			{
				name: name,//name of this lookup/target
				source: remoteQuery,//does the query on the remote & local end
				async: true,//does do a remote query
				limit: 20,// only show top 20 results regardless of getting more
				display: function(item) { // what to display from the item; assumes a particular structure, but can just be a list of strings (so return item;)
					console.log('Display return: ' + JSON.stringify(item));
					return item[name];//item = { id: ##, name: "string" }
				}
			});
			
			// ensure that when a selection is made, we update the shared typeahead object
			// this is how other typeaheads can always get the value of all other related 
			// fields without having to do too much horsing around
			that.bind('typeahead:selected', function(event, suggestion) {
				var d = data();
				d[name] = suggestion[name];
				data(d);
				console.log('Suggestion for ' + name + ': ' + JSON.stringify(suggestion));
			});
		});
	}
	
	
	// return module API surface area
	return { init: makeTypeahead };
	
})();

/// app scripts run after here!