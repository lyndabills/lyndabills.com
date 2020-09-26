<?xml version=1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<!-- this is spawned from the https://aframe.io/aframe/examples/ examples -->
<!-- TODO: Add aframe an unpkgs to gitrepo, to remove dependency on external sites -->
<!-- TODO: Make it look pretty and have a non 3D fallback. -->
<html>
  <head>
    <meta charset="utf-8">
    <title>A-Frame Image Gallery Tutorial</title>
    <meta name="description" content="360&deg; Image Gallery - A-Frame">
    <script src="https://aframe.io/releases/1.0.4/aframe.min.js"></script>
    <script src="https://unpkg.com/aframe-event-set-component@5/dist/aframe-event-set-component.min.js"></script>
    <script src="https://unpkg.com/aframe-layout-component@5.3.0/dist/aframe-layout-component.min.js"></script>
    <script src="https://unpkg.com/aframe-template-component@3.2.1/dist/aframe-template-component.min.js"></script>
    <script src="https://unpkg.com/aframe-proxy-event-component@2.1.0/dist/aframe-proxy-event-component.min.js"></script>
    
    <!-- Image link template to be reused. -->
    <script id="link" type="text/html">
      <a-entity class="link"
        geometry="primitive: plane; height: 1; width: 1"
        material="shader: flat; src: ${thumb}"
        event-set__mouseenter="scale: 1.2 1.2 1"
        event-set__mouseleave="scale: 1 1 1"
        event-set__click="_target: #image-360; _delay: 300; material.src: ${src}"
        proxy-event="event: click; to: #image-360; as: fade"
        sound="on: click; src: #click-sound"></a-entity>
    </script>
  </head>
  <body>
    <a-scene>
      <a-assets>
	<xsl:for-each select="works/work">
        	<img id="{name}" crossorigin="anonymous" src="data:image/jpeg;base64,{data}">
        	<img id="{name}-thumb" crossorigin="anonymous" src="data:image/jpeg;base64,{thumb}">
	</xsl:for-each>
      </a-assets>

      <!-- Image links. -->
      <a-entity id="links" layout="type: line; margin: 1.5" position="0 -1 -4">
	<xsl:for-each select="works/work">
      		<a-entity template="src: #link" data-src="#{name}" data-thumb="#{name}-thumb"></a-entity>
	</xsl:for-each>
      </a-entity>

    </a-scene>
  </body>
</html>
</xsl:template>
</xsl:stylesheet>
