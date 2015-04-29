package roshan.buffer {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import roshan.buffer.MapLayer;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class MapData extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const MAPNAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("roshan.buffer.MapData.mapName", "mapName", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var mapName$field:String;

		public function clearMapName():void {
			mapName$field = null;
		}

		public function get hasMapName():Boolean {
			return mapName$field != null;
		}

		public function set mapName(value:String):void {
			mapName$field = value;
		}

		public function get mapName():String {
			return mapName$field;
		}

		/**
		 *  @private
		 */
		public static const XOFFSET:FieldDescriptor_TYPE_UINT32 = new FieldDescriptor_TYPE_UINT32("roshan.buffer.MapData.xOffset", "xOffset", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var xOffset$field:uint;

		private var hasField$0:uint = 0;

		public function clearXOffset():void {
			hasField$0 &= 0xfffffffe;
			xOffset$field = new uint();
		}

		public function get hasXOffset():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set xOffset(value:uint):void {
			hasField$0 |= 0x1;
			xOffset$field = value;
		}

		public function get xOffset():uint {
			return xOffset$field;
		}

		/**
		 *  @private
		 */
		public static const YOFFSET:FieldDescriptor_TYPE_UINT32 = new FieldDescriptor_TYPE_UINT32("roshan.buffer.MapData.yOffset", "yOffset", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var yOffset$field:uint;

		public function clearYOffset():void {
			hasField$0 &= 0xfffffffd;
			yOffset$field = new uint();
		}

		public function get hasYOffset():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set yOffset(value:uint):void {
			hasField$0 |= 0x2;
			yOffset$field = value;
		}

		public function get yOffset():uint {
			return yOffset$field;
		}

		/**
		 *  @private
		 */
		public static const XSIZE:FieldDescriptor_TYPE_UINT32 = new FieldDescriptor_TYPE_UINT32("roshan.buffer.MapData.xSize", "xSize", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var xSize$field:uint;

		public function clearXSize():void {
			hasField$0 &= 0xfffffffb;
			xSize$field = new uint();
		}

		public function get hasXSize():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set xSize(value:uint):void {
			hasField$0 |= 0x4;
			xSize$field = value;
		}

		public function get xSize():uint {
			return xSize$field;
		}

		/**
		 *  @private
		 */
		public static const YSIZE:FieldDescriptor_TYPE_UINT32 = new FieldDescriptor_TYPE_UINT32("roshan.buffer.MapData.ySize", "ySize", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var ySize$field:uint;

		public function clearYSize():void {
			hasField$0 &= 0xfffffff7;
			ySize$field = new uint();
		}

		public function get hasYSize():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set ySize(value:uint):void {
			hasField$0 |= 0x8;
			ySize$field = value;
		}

		public function get ySize():uint {
			return ySize$field;
		}

		/**
		 *  @private
		 */
		public static const LAYER:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("roshan.buffer.MapData.layer", "layer", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return roshan.buffer.MapLayer; });

		[ArrayElementType("roshan.buffer.MapLayer")]
		public var layer:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasMapName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, mapName$field);
			}
			if (hasXOffset) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_UINT32(output, xOffset$field);
			}
			if (hasYOffset) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_UINT32(output, yOffset$field);
			}
			if (hasXSize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_UINT32(output, xSize$field);
			}
			if (hasYSize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_UINT32(output, ySize$field);
			}
			for (var layer$index:uint = 0; layer$index < this.layer.length; ++layer$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.layer[layer$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var mapName$count:uint = 0;
			var xOffset$count:uint = 0;
			var yOffset$count:uint = 0;
			var xSize$count:uint = 0;
			var ySize$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (mapName$count != 0) {
						throw new flash.errors.IOError('Bad data format: MapData.mapName cannot be set twice.');
					}
					++mapName$count;
					this.mapName = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 2:
					if (xOffset$count != 0) {
						throw new flash.errors.IOError('Bad data format: MapData.xOffset cannot be set twice.');
					}
					++xOffset$count;
					this.xOffset = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
					break;
				case 3:
					if (yOffset$count != 0) {
						throw new flash.errors.IOError('Bad data format: MapData.yOffset cannot be set twice.');
					}
					++yOffset$count;
					this.yOffset = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
					break;
				case 4:
					if (xSize$count != 0) {
						throw new flash.errors.IOError('Bad data format: MapData.xSize cannot be set twice.');
					}
					++xSize$count;
					this.xSize = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
					break;
				case 5:
					if (ySize$count != 0) {
						throw new flash.errors.IOError('Bad data format: MapData.ySize cannot be set twice.');
					}
					++ySize$count;
					this.ySize = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
					break;
				case 6:
					this.layer.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new roshan.buffer.MapLayer()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
