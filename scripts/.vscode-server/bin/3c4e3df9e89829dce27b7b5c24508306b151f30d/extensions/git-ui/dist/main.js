!function(e,t){for(var n in t)e[n]=t[n]}(exports,function(e){var t={};function n(r){if(t[r])return t[r].exports;var o=t[r]={i:r,l:!1,exports:{}};return e[r].call(o.exports,o,o.exports,n),o.l=!0,o.exports}return n.m=e,n.c=t,n.d=function(e,t,r){n.o(e,t)||Object.defineProperty(e,t,{enumerable:!0,get:r})},n.r=function(e){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},n.t=function(e,t){if(1&t&&(e=n(e)),8&t)return e;if(4&t&&"object"==typeof e&&e&&e.__esModule)return e;var r=Object.create(null);if(n.r(r),Object.defineProperty(r,"default",{enumerable:!0,value:e}),2&t&&"string"!=typeof e)for(var o in e)n.d(r,o,function(t){return e[t]}.bind(null,o));return r},n.n=function(e){var t=e&&e.__esModule?function(){return e.default}:function(){return e};return n.d(t,"a",t),t},n.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)},n.p="",n(n.s=0)}([function(e,t,n){"use strict";Object.defineProperty(t,"__esModule",{value:!0}),t.exec=t.activate=t.deactivate=void 0;const r=n(1),o=n(2);t.deactivate=async function(){},t.activate=async function(e){e.subscriptions.push(r.commands.registerCommand("git.credential",async e=>({stdout:"",stderr:"",code:0})))},t.exec=function(e,t={}){return new Promise((n,r)=>{const i=o.exec(e,t,(e,t,o)=>{(e?r:n)({error:e,stdout:t,stderr:o})});t.stdin&&i.stdin.write(t.stdin,e=>{e?r(e):i.stdin.end(e=>{e&&r(e)})})})}},function(e,t){e.exports=require("vscode")},function(e,t){e.exports=require("child_process")}]));
//# sourceMappingURL=https://ticino.blob.core.windows.net/sourcemaps/3c4e3df9e89829dce27b7b5c24508306b151f30d/extensions/git-ui/dist/main.js.map