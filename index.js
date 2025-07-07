const express = require("express");
const cors = require("cors");

const app = express();

const bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({ extended: false }));

app.use(bodyParser.json());

app.use(cors());

const Pool = require('pg').Pool;
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'room_reservation',
  password: 'admin',
  port: 5436,
});

app.get("/getAllRooms", async(req, res) => {
    let rooms = Array();
        await pool.query("SELECT * FROM Rooms", (err, result) => {
        if(err) {
            console.log(err)
        } else {
            result["rows"].forEach(element => {
                rooms.push(element['room_number']);
            });
            res.send(rooms);
        }
    });
})

app.get("/getFreeRooms", async(req, res) => {
    if(req.query.selected_date != null)
    {

        await pool.query(`SELECT room_number FROM Rooms
            INNER JOIN Reservations on Reservations.room_id = Rooms.id 
            WHERE '${req.query.selected_date}' BETWEEN start_reservation AND end_reservation'
            `, (err, result) => {
                if(err) {
                    console.log(err);
                } else {
                    result["rows"].forEach(element => {
                        rooms.push(element['room_number']);
                    });
                    res.send(rooms);
                }
            });
    } else {
        console.log('дата не указана');
    }
})

app.get("/bookRoom", async(req, res) => {
    const room_id = req.query.room_id;
    const client_id = req.query.client_id;
    const reservation_date = req.query.reservation_date;
    
    await pool.query(`insert into Reservations (client_id, room_id, reservation_date)
values  (${client_id}, ${room_id}, '${reservation_date}');`, (err, result) => {
        if(err) {
            console.log(err)
        } else {
            console.log(result);
        }});
})

app.post("cancelReservation", async(req, res) => {

})

app.get("isVIP", async(req, res) => {

})

app.get("/", (request, response)=> {
    response.send("<h1>Hello</h1>");
})

app.listen(3002);