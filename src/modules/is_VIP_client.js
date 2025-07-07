async function is_VIP_client() {
    return new Promise((resolve, reject) => {

        fetch('https://jsonplaceholder.typicode.com/todos')
        .then(response =>  {
            console.log(response.json());
            
            //resolve(response.json())
        })
        .then(json => console.log(json))
    })
}

exports.is_VIP_client = is_VIP_client;