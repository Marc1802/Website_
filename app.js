(function() {
    const express = require("express");
    const server = express();

    // make server write a no-cache header
    function addNoCacheHeaders (request, response, next) {
        response.header('Cache-Control', 'private, no-cache, no-store, must-revalidate');
        response.header('Expires', '-1');
        response.header('Pragma', 'no-cache');
        next();
    }

    server.use(addNoCacheHeaders)
    server.use(express.static(__dirname + "/app"));
    server.listen(1337);
})()
