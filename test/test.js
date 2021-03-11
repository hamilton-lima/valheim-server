const Gamedig = require('gamedig');
Gamedig.query({
    type: 'valheim',
    host: '127.0.0.1'
}).then((state) => {
    console.log(state);
}).catch((error) => {
    console.log("Server is offline", error);
});