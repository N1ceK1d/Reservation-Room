async function getFreeRooms(pool, select_date) {
    return new Promise((resolve, reject) => {

        pool.query(`SELECT room_number FROM Rooms
            INNER JOIN Reservations on Reservations.room_id = Rooms.id 
            WHERE '${select_date}' NOT BETWEEN start_reservation AND end_reservation
            `, (err, result) => {
                if(err) { console.log(err) } 
                resolve(JSON.stringify(result.rows));
            });
    })
}

exports.getFreeRooms = getFreeRooms;