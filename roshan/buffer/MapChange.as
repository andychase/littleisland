package roshan.buffer {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import roshan.buffer.CHANGE;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class MapChange extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CHANGE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("roshan.buffer.MapChange.change", "change", (1 << 3) | com.netease.protobuf.WireType.VARINT, roshan.buffer.CHANGE);

		public var change:int;

		/**
		 *  @private
		 */
		public static const MAPBOXX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("roshan.buffer.MapChange.MapBoxX", "mapBoxX", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var mapBoxX:uint;

		/**
		 *  @private
		 */
		public static const MAPBOXY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("roshan.buffer.MapChange.MapBoxY", "mapBoxY", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		public var mapBoxY:uint;

		/**
		 *  @private
		 */
		public static const CHANGEDXS:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("roshan.buffer.MapChange.ChangedXs", "changedXs", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("uint")]
		public var changedXs:Array = [];

		/**
		 *  @private
		 */
		public static const CHANGEDYS:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("roshan.buffer.MapChange.ChangedYs", "changedYs", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("uint")]
		public var changedYs:Array = [];

		/**
		 *  @private
		 */
		public static const CHANGEDLAYERS:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("roshan.buffer.MapChange.ChangedLayers", "changedLayers", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("uint")]
		public var changedLayers:Array = [];

		/**
		 *  @private
		 */
		public static const NEWTILE:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("roshan.buffer.MapChange.newTile", "newTile", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("uint")]
		public var newTile:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, this.change);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.mapBoxX);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.mapBoxY);
			for (var changedXs$index:uint = 0; changedXs$index < this.changedXs.length; ++changedXs$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.changedXs[changedXs$index]);
			}
			for (var changedYs$index:uint = 0; changedYs$index < this.changedYs.length; ++changedYs$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.changedYs[changedYs$index]);
			}
			for (var changedLayers$index:uint = 0; changedLayers$index < this.changedLayers.length; ++changedLayers$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.changedLayers[changedLayers$index]);
			}
			for (var newTile$index:uint = 0; newTile$index < this.newTile.length; ++newTile$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.newTile[newTile$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var change$count:uint = 0;
			var MapBoxX$count:uint = 0;
			var MapBoxY$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (change$count != 0) {
						throw new flash.errors.IOError('Bad data format: MapChange.change cannot be set twice.');
					}
					++change$count;
					this.change = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 2:
					if (MapBoxX$count != 0) {
						throw new flash.errors.IOError('Bad data format: MapChange.mapBoxX cannot be set twice.');
					}
					++MapBoxX$count;
					this.mapBoxX = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 3:
					if (MapBoxY$count != 0) {
						throw new flash.errors.IOError('Bad data format: MapChange.mapBoxY cannot be set twice.');
					}
					++MapBoxY$count;
					this.mapBoxY = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 4:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_UINT32, this.changedXs);
						break;
					}
					this.changedXs.push(com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input));
					break;
				case 5:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_UINT32, this.changedYs);
						break;
					}
					this.changedYs.push(com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input));
					break;
				case 6:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_UINT32, this.changedLayers);
						break;
					}
					this.changedLayers.push(com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input));
					break;
				case 7:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_UINT32, this.newTile);
						break;
					}
					this.newTile.push(com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
