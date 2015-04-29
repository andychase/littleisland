package roshan.buffer {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import roshan.buffer.CharacterAction;
	import roshan.buffer.MapChange;
	import roshan.buffer.MapData;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class WorldChange extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CHARACTERACTIONS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("roshan.buffer.WorldChange.characterActions", "characterActions", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return roshan.buffer.CharacterAction; });

		[ArrayElementType("roshan.buffer.CharacterAction")]
		public var characterActions:Array = [];

		/**
		 *  @private
		 */
		public static const MAPDATA:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("roshan.buffer.WorldChange.mapData", "mapData", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return roshan.buffer.MapData; });

		[ArrayElementType("roshan.buffer.MapData")]
		public var mapData:Array = [];

		/**
		 *  @private
		 */
		public static const MAPCHANGE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("roshan.buffer.WorldChange.mapChange", "mapChange", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return roshan.buffer.MapChange; });

		[ArrayElementType("roshan.buffer.MapChange")]
		public var mapChange:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var characterActions$index:uint = 0; characterActions$index < this.characterActions.length; ++characterActions$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.characterActions[characterActions$index]);
			}
			for (var mapData$index:uint = 0; mapData$index < this.mapData.length; ++mapData$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.mapData[mapData$index]);
			}
			for (var mapChange$index:uint = 0; mapChange$index < this.mapChange.length; ++mapChange$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.mapChange[mapChange$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.characterActions.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new roshan.buffer.CharacterAction()));
					break;
				case 2:
					this.mapData.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new roshan.buffer.MapData()));
					break;
				case 3:
					this.mapChange.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new roshan.buffer.MapChange()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
