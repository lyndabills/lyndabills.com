<?xml version="1.0"?>
<!DOCTYPE html>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<!-- TODO: Add aframe an unpkgs to gitrepo, to remove dependency on external sites -->
<!-- TODO: Make it look pretty and have a non 3D fallback. -->
<html>
  <head>
    <meta charset="utf-8" />
    <title>Lynda Bills Watercolor Gallery</title>
    <meta name="description" content="Lynda Bills Watercolour Gallery" />
    <!--script src="http://127.0.0.1:9000/dist/aframe-master.js" /-->
    <script src="https://aframe.io/dist/aframe-master.js" />
    <script type="text/javascript">
	    function addscene()
	    {
		var scene = new window.AFRAME.AScene();
		document.getRootNode().body.appendChild(scene);

	    	var assets = document.createElement("a-assets");

		<xsl:for-each select="works/work">
			var image_asset = document.createElement("img");
			image_asset.setAttribute('id', 'ci');//'<xsl:value-of select="name"/>');
			image_asset.setAttribute('crossorigin', 'anonymous');
			image_asset.setAttribute('src', 'data:image/jpeg;base64,<xsl:value-of select="data"/>');
			assets.appendChild(image_asset);

			//var thumb_asset = document.createElement("img");
			//thumb_asset.setAttribute('id', 'ci-thumb');//'<xsl:value-of select="name"/>-thumb');
			//thumb_asset.setAttribute('crossorigin', 'anonymous');
			//thumb_asset.setAttribute('src', 'data:image/jpeg;base64,<xsl:value-of select="th"/>');
			//assets.appendChild(thumb_asset);
		</xsl:for-each>
	
		scene.appendChild(assets);
		assets.attachedCallback();

		<xsl:for-each select="works/work">
			var image = document.createElement("a-image");
			image.setAttribute('src', '#ci');//'#<xsl:value-of select="name"/>-thumb');
			//			image.setAttribute('rotation', '0, 90, 0'); 
			image.setAttribute('position', '0 2 0');
			image.setAttribute('scale', '1 1 1');
			scene.appendChild(image);
			image.attachedCallback();
		</xsl:for-each>

		var camera_entity = document.createElement("a-entity");
		camera_entity.setAttribute('position', '0 0 1.5');

		var camera = document.createElement("a-camera");
		camera_entity.appendChild(camera);
		scene.appendChild(camera_entity);
		camera_entity.attachedCallback();
		camera.attachedCallback();

		scene.attachedCallback();
	    }
    </script>
  </head>
  <body onload="javascript:addscene()">
  </body>
</html>
</xsl:template>
</xsl:stylesheet>
