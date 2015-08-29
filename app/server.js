// Load required modules
var http    = require("http");              // http server core module
var express = require("express");           // web framework external module
var io      = require("socket.io");         // web socket external module
var easyrtc = require("easyrtc");           // EasyRTC external module
var port = 47121;
// Setup and configure Express http server. Expect a subfolder called "static" to be the web root.
var httpApp = express();
httpApp.use(express.static(__dirname + "/static/"));

// Start Express http server on port 8080
var webServer = http.createServer(httpApp).listen(port);
console.log("port: " + port);
// Start Socket.io so it attaches itself to Express server
var socketServer = io.listen(webServer, {"log level":1});

// Start EasyRTC server
var rtc = easyrtc.listen(httpApp, socketServer);

var myIceServers = [{url:'stun:stun01.sipphone.com'},
    {url:'stun:novisse.ru:3478'}];

easyrtc.setOption("appIceServers", myIceServers);

easyrtc.on("getIceConfig", function(connectionObj, callback){
    callback(null, myIceServers);
});
