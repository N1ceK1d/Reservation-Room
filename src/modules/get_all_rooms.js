async function getAllRooms (pool) {
    return new Promise((resolve, reject) => {
            pool.query("SELECT * FROM Rooms", (err, result) => {
            if(err) { throw new Error(err); }
            resolve(JSON.stringify(result.rows));
        });
    })
    
}

exports.getAllRooms = getAllRooms;