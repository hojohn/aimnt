<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
                    + request.getServerName() + ":" + request.getServerPort()
                    + path + "/";
%>
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=5,IE=9" ><![endif]-->
<!DOCTYPE html>
<html>
<head>
    <title>Grapheditor</title>
	<base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" type="text/css" href="static/plugins/mxGraph/styles/grapheditor.css">
	<script type="text/javascript">
		// Public global variables
		var MAX_REQUEST_SIZE = 10485760;
		var MAX_AREA = 10000 * 10000;
	
		// URLs for save and export
		var EXPORT_URL = '/export';
		var SAVE_URL = '/save';
		var OPEN_URL = '/open';
		var RESOURCES_PATH = 'static/plugins/mxGraph/resources';
		var RESOURCE_BASE = RESOURCES_PATH + '/grapheditor';
		var STENCIL_PATH = '<%=basePath%>/static/plugins/mxGraph/stencils';
		var IMAGE_PATH = '<%=basePath%>/static/plugins/mxGraph/images';
		var STYLE_PATH = 'static/plugins/mxGraph/styles';
		var CSS_PATH = 'static/plugins/mxGraph/styles';
		var OPEN_FORM = 'open.html';
	
		// Specifies connection mode for touch devices (at least one should be true)
		var tapAndHoldStartsConnection = false;
		var showConnectorImg = true;

		// Parses URL parameters. Supported parameters are:
		// - lang=xy: Specifies the language of the user interface.
		// - touch=1: Enables a touch-style user interface.
		// - storage=local: Enables HTML5 local storage.
		// - chrome=0: Chromeless mode.
		var urlParams = (function(url)
		{
			var result = new Object();
			var idx = url.lastIndexOf('?');
	
			if (idx > 0)
			{
				var params = url.substring(idx + 1).split('&');
				
				for (var i = 0; i < params.length; i++)
				{
					idx = params[i].indexOf('=');
					
					if (idx > 0)
					{
						result[params[i].substring(0, idx)] = params[i].substring(idx + 1);
					}
				}
			}
			
			return result;
		})(window.location.href);

		// Sets the base path, the UI language via URL param and configures the
		// supported languages to avoid 404s. The loading of all core language
		// resources is disabled as all required resources are in grapheditor.
		// properties. Note that in this example the loading of two resource
		// files (the special bundle and the default bundle) is disabled to
		// save a GET request. This requires that all resources be present in
		// each properties file since only one file is loaded.
		mxLoadResources = false;
		mxBasePath = 'static/plugins/mxGraph';
		mxLanguage = urlParams['lang'];
		mxLanguages = ['zh'];
	</script>
	<script type="text/javascript" src="static/plugins/mxGraph/jscolor/jscolor.js"></script>
	<script type="text/javascript" src="static/plugins/mxGraph/sanitizer/sanitizer.min.js"></script>
	<script type="text/javascript" src="static/plugins/mxGraph/js/mxClient.js"></script>
	<script type="text/javascript" src="static/plugins/mxGraph/js/EditorUi.js"></script>
	<script type="text/javascript" src="static/plugins/mxGraph/js/Editor.js"></script>
	<script type="text/javascript" src="static/plugins/mxGraph/js/Sidebar.js"></script>
	<script type="text/javascript" src="static/plugins/mxGraph/js/Graph.js"></script>
	<script type="text/javascript" src="static/plugins/mxGraph/js/Shapes.js"></script>
	<script type="text/javascript" src="static/plugins/mxGraph/js/Actions.js"></script>
	<script type="text/javascript" src="static/plugins/mxGraph/js/Menus.js"></script>
	<script type="text/javascript" src="static/plugins/mxGraph/js/Format.js"></script>
	<script type="text/javascript" src="static/plugins/mxGraph/js/Toolbar.js"></script>
	<script type="text/javascript" src="static/plugins/mxGraph/js/Dialogs.js"></script>
</head>
<body class="geEditor">
	<script type="text/javascript">
		// Extends EditorUi to update I/O action states
		(function()
		{
			var editorUiInit = EditorUi.prototype.init;
			
			EditorUi.prototype.init = function()
			{
				editorUiInit.apply(this, arguments);
				this.actions.get('export').setEnabled(false);

				// Updates action states which require a backend
				if (!useLocalStorage)
				{
					mxUtils.post(OPEN_URL, '', mxUtils.bind(this, function(req)
					{
						var enabled = req.getStatus() != 404;
						this.actions.get('open').setEnabled(enabled || fileSupport);
						this.actions.get('import').setEnabled(enabled || fileSupport);
						this.actions.get('save').setEnabled(enabled);
						this.actions.get('saveAs').setEnabled(enabled);
						this.actions.get('export').setEnabled(enabled);
					}));
				}
			};
		})();
	
		new EditorUi(new Editor(urlParams['chrome'] == '0'));
	</script>
</body>
</html>
