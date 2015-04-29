package roshan.buffer {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import roshan.buffer.ACTION;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ClientChange extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ACTION:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("roshan.buffer.ClientChange.action", "action", (1 << 3) | com.netease.protobuf.WireType.VARINT, roshan.buffer.ACTION);

		private var action$field:int;

		private var hasField$0:uint = 0;

		public function clearAction():void {
			hasField$0 &= 0xfffffffe;
			action$field = new int();
		}

		public function get hasAction():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set action(value:int):void {
			hasField$0 |= 0x1;
			action$field = value;
		}

		public function get action():int {
			return action$field;
		}

		/**
		 *  @private
		 */
		public static const DIRECTION:FieldDescriptor_TYPE_UINT32 = new FieldDescriptor_TYPE_UINT32("roshan.buffer.ClientChange.direction", "direction", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var direction$field:uint;

		public function clearDirection():void {
			hasField$0 &= 0xfffffffd;
			direction$field = new uint();
		}

		public function get hasDirection():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set direction(value:uint):void {
			hasField$0 |= 0x2;
			direction$field = value;
		}

		public function get direction():uint {
			return direction$field;
		}

		/**
		 *  @private
		 */
		public static const SAY:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("roshan.buffer.ClientChange.say", "say", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var say$field:String;

		public function clearSay():void {
			say$field = null;
		}

		public function get hasSay():Boolean {
			return say$field != null;
		}

		public function set say(value:String):void {
			say$field = value;
		}

		public function get say():String {
			return say$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasAction) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, action$field);
			}
			if (hasDirection) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_UINT32(output, direction$field);
			}
			if (hasSay) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, say$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var action$count:uint = 0;
			var direction$count:uint = 0;
			var say$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (action$count != 0) {
						throw new flash.errors.IOError('Bad data format: ClientChange.action cannot be set twice.');
					}
					++action$count;
					this.action = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 2:
					if (direction$count != 0) {
						throw new flash.errors.IOError('Bad data format: ClientChange.direction cannot be set twice.');
					}
					++direction$count;
					this.direction = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
					break;
				case 3:
					if (say$count != 0) {
						throw new flash.errors.IOError('Bad data format: ClientChange.say cannot be set twice.');
					}
					++say$count;
					this.say = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
