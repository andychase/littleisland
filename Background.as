package
{
	import roshan.buffer.MapData;
	import roshan.buffer.MapLayer;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Canvas;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;

	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	import com.adobe.serialization.json.JSON;
	
	public class Background extends Entity
	{
		private var hitgrid:Grid;
		public var fg:Entity;
		
		public function Background(in_fg:Entity)
		{
			fg = in_fg;
			fg.layer = 0;
			layer = 10;
			
			hitgrid = new Grid(640, 640, 32, 32);
			mask = hitgrid;
			type = "wall";
		}
		
		override public function update():void 
		{

		}
		
		public function loadMap(mapData: MapData):void {
			var _tiles:Tilemap;
			var layer:MapLayer;
			var tile:int;
			var col:int = 0;
			var row:int = 0;
			var layer_index:int = 0;
			var tile_size:int = 32;
			col = 0;
			row = 0;
			for each (layer in mapData.layer) {
				col = 0;
				row = 0;
				_tiles = new Tilemap(Assets.TILE_GRASSLAND, 640, 640, tile_size, tile_size);
				for each (tile in layer.tile) {
					if (tile != 0) _tiles.setTile(col, row, tile - 1);
					if (layer_index == mapData.layer.length-1 && tile != 0) hitgrid.setTile(col, row, true);
					col += 1;
					if (col >= 20) {
						col = 0;
						row += 1;
					}
				};
				if (layer_index < 2) addGraphic(_tiles);
				else if(layer_index == mapData.layer.length-2) fg.graphic = _tiles;
				layer_index += 1;
			};
		}
		
 
	}
}