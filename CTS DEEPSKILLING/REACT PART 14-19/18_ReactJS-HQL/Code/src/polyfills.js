// Polyfills for old JSDOM environment in Jest running on modern Node.js
const { TextDecoder, TextEncoder } = require('util');
const { ReadableStream } = require('stream/web');
const { MessageChannel, MessagePort } = require('worker_threads');

if (!global.TextDecoder) {
  global.TextDecoder = TextDecoder;
}
if (!global.TextEncoder) {
  global.TextEncoder = TextEncoder;
}
if (!global.ReadableStream) {
  global.ReadableStream = ReadableStream;
}
if (!global.MessagePort) {
  global.MessagePort = MessagePort;
}
if (!global.MessageChannel) {
  global.MessageChannel = MessageChannel;
}
