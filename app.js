const express = require("express");
const cors = require("cors");

const app = express();
const pool = require('./src/config/db').pool;

const bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(cors());

app.get("/room_list", async(req, res) => {
    require('./src/modules/get_all_rooms').getAllRooms(pool)
    .then((data) => {
        console.log(data);
    })
});

app.get("/getFreeRooms", async(req, res) => {
    if(req.query.select_date != null)
    {
        const select_date = req.query.select_date;
        
        require('./src/modules/get_free_rooms').getFreeRooms(pool, select_date)
        .then((data) => {
            console.log(data);
        })
    }
});

app.get("/bookRoom", async(req, res) => {
    if(req.query != null) 
    {
        require('./src/modules/book_room').book_room(pool, req.query)
        .then((data) => {
            console.log(data);
        })
    }
});

app.get("/cancelReservation", async(req, res) => {
    if(req.query.reservation_id != null)
    {
        require('./src/modules/cancel_reservation').cancel_reservation(pool, req.query.reservation_id)
        .then((data) => {
            console.log(data);
        })
    }
});

app.get("/is_vip", (req, res) => {
    if(req.query.client_id != null) 
    {
        console.log(req.query.client_id);
        
        fetch('https://jsonplaceholder.typicode.com/todos')
        .then(response => response.json())
        .then(json => 
            {
                json.map((elem => {
                    if(elem.id == req.query.client_id)
                    {
                        if(elem.completed) {
                            console.log("Это ВИП клиент")
                        } else {
                            console.log("Обычный клиент")
                        }
                    }

                }))
            })
    }
});

app.get("/", (request, response)=> {
    response.send("<h1>Hello</h1>");
})

app.listen(3002);