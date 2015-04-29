package roshan.buffer {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import roshan.buffer.TOKEN;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class StatusToken extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TOKEN:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("roshan.buffer.StatusToken.token", "token", (1 << 3) | com.netease.protobuf.WireType.VARINT, roshan.buffer.TOKEN);

		public var token:int;

		/**
		 *  @private
		 */
		public static const TICKS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("roshan.buffer.StatusToken.ticks", "ticks", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var ticks$field:uint;

		private var hasField$0:uint = 0;

		public function clearTicks():void {
			hasField$0 &= 0xfffffffe;
			ticks$field = new uint();
		}

		public function get hasTicks():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set ticks(value:uint):void {
			hasField$0 |= 0x1;
			ticks$field = value;
		}

		public function get ticks():uint {
			return ticks$field;
		}

		/**
		 *  @private
		 */
		public static const SIZE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("roshan.buffer.StatusToken.size", "size", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var size$field:uint;

		public function clearSize():void {
			hasField$0 &= 0xfffffffd;
			size$field = new uint();
		}

		public function get hasSize():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set size(value:uint):void {
			hasField$0 |= 0x2;
			size$field = value;
		}

		public function get size():uint {
			return size$field;
		}

		/**
		 *  @private
		 */
		public static const END:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("roshan.buffer.StatusToken.end", "end", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var end$field:Boolean;

		public function clearEnd():void {
			hasField$0 &= 0xfffffffb;
			end$field = new Boolean();
		}

		public function get hasEnd():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set end(value:Boolean):void {
			hasField$0 |= 0x4;
			end$field = value;
		}

		public function get end():Boolean {
			return end$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, this.token);
			if (hasTicks) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, ticks$field);
			}
			if (hasSize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, size$field);
			}
			if (hasEnd) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, end$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var token$count:uint = 0;
			var ticks$count:uint = 0;
			var size$count:uint = 0;
			var end$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (token$count != 0) {
						throw new flash.errors.IOError('Bad data format: StatusToken.token cannot be set twice.');
					}
					++token$count;
					this.token = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 2:
					if (ticks$count != 0) {
						throw new flash.errors.IOError('Bad data format: StatusToken.ticks cannot be set twice.');
					}
					++ticks$count;
					this.ticks = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 3:
					if (size$count != 0) {
						throw new flash.errors.IOError('Bad data format: StatusToken.size cannot be set twice.');
					}
					++size$count;
					this.size = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 4:
					if (end$count != 0) {
						throw new flash.errors.IOError('Bad data format: StatusToken.end cannot be set twice.');
					}
					++end$count;
					this.end = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
