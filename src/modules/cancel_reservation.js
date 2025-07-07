async function cancel_reservation(pool, reservation_id) {
    return new Promise((resolve, reject) => {
        pool.query(`DELETE FROM Reservations WHERE id = ${reservation_id}`, (err, result) => {
            if(err) {throw new Error("Ошибка в запросе");}
            resolve("Бронь отменена");
        })
    })
}

exports.cancel_reservation = cancel_reservation;