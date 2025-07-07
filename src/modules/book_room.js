async function book_room(pool, query_info) {
    const room_id = query_info.room_id;
    const client_id = query_info.client_id;
    const res_start = query_info.res_start;
    const res_end = query_info.res_end;
    

    return new Promise((resolve, reject) => {    
        pool.query(`select count(id) as count FROM Reservations where start_reservation <= '${res_start}'
 and end_reservation >= '${res_end}';`, (error, count) => {
    
    if(count.rows[0].count >= 1) 
    {
        console.log('дата для бронирования занята');
    } else {
            pool.query(`insert into Reservations (client_id, room_id, start_reservation, end_reservation)
values  (${client_id}, ${room_id}, '${res_start}', '${res_end}');`, (err, result) => {
        if(err) {
            throw new Error(err);
        } 
        console.log('Данные записаны в бд');
        
        resolve(JSON.stringify(result));
    });
    }
 });

    })
}

exports.book_room = book_room;