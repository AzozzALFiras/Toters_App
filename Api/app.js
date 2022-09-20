

const express = require('express'); // make flexible Node.js web application framework
var app = express(); // make variable
const mysql = require('mysql'); // make Node.js work with database (MYSQL)
const bodyparser = require('body-parser'); // Node.js body parsing middleware.
app.use(bodyparser.json());
app.use(bodyparser.urlencoded({
    extended: true
}));

app.use(function (req, res, next) {
    // Website you wish to allow to connect
    res.setHeader('Access-Control-Allow-Origin', '*');
    // Request methods you wish to allow
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
    // Request headers you wish to allow
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
    // Set to true if you need the website to include cookies in the requests sent
    // to the API (e.g. in case you use sessions)
    res.setHeader('Access-Control-Allow-Credentials', true);

    // Pass to next layer of middleware
    next();
});


app.all('*', function(req, res,next) {
    /**
     * Response settings
     * @type {Object}
     */
    var responseSettings = {
        "AccessControlAllowOrigin": req.headers.origin,
        "AccessControlAllowHeaders": "Content-Type,X-CSRF-Token, X-Requested-With, Accept, Accept-Version, Content-Length, Content-MD5,  Date, X-Api-Version, X-File-Name",
        "AccessControlAllowMethods": "POST, GET, PUT, DELETE, OPTIONS",
        "AccessControlAllowCredentials": true
    };

    /**
     * Headers
     */
    res.header("Access-Control-Allow-Credentials", responseSettings.AccessControlAllowCredentials);
    res.header("Access-Control-Allow-Origin",  responseSettings.AccessControlAllowOrigin);
    res.header("Access-Control-Allow-Headers", (req.headers['access-control-request-headers']) ? req.headers['access-control-request-headers'] : "x-requested-with");
    res.header("Access-Control-Allow-Methods", (req.headers['access-control-request-method']) ? req.headers['access-control-request-method'] : responseSettings.AccessControlAllowMethods);

    if ('OPTIONS' == req.method) {
        res.send(200);
    }
    else {
        next();
    }
});

//connecting to database
const mc = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'Toters',
    multipleStatements: true
});


// open broswer on this -> "localhost:4000/FirstItemNew"
var port = process.env.PORT || 4000
console.log("Running on port:" + port)
app.listen(port);



app.get('/FirstItemNew/:id', function (req, res) {
    let page_id = req.params.id;

    mc.query('SELECT * FROM FirstItemNew where Pageid=?', page_id, function (error, results, fields) {
        if (error) throw error;
        return res.send(results);
    });

});

// For Show Three Item Down in App
app.get('/Stores', (request, response) => {
    mc.query(`SELECT *  FROM Stores`, function (error, results, fields) {
        if (error) throw error;
        return response.send(results);
    });

});

// For Show Three Item Down in App
app.get('/Tags', (request, response) => {
    mc.query(`SELECT *  FROM Tags`, function (error, results, fields) {
        if (error) throw error;
        return response.send(results);
    });

});

// For Show Three Item Down in App
app.get('/Searchs', (request, response) => {
    mc.query(`SELECT *  FROM Search`, function (error, results, fields) {
        if (error) throw error;
        return response.send(results);
    });

});


/// GET


app.get('/HomePage_Dinner/:id', function (req, res) {
    let page_id = req.params.id;

    mc.query('SELECT * FROM HomePage_Dinner where Store_Collection_id=?', page_id, function (error, results, fields) {
        if (error) throw error;
        return res.send(results);
    });

});

app.get('/Tags/:id', function (req, res) {
    let page_id = req.params.id;

    mc.query('SELECT * FROM HomePage_Dinner where Tags_id=?', page_id, function (error, results, fields) {
        if (error) throw error;
        return res.send(results);
    });

});

app.get('/Store_Items/:id', function (req, res) {
    let Store_id = req.params.id;
    mc.query('SELECT * FROM Store_Items where Store_id=?', Store_id, function (error, results, fields) {
        if (error) throw error;
        return res.send(results);
    });

});
