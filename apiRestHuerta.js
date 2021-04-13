let port=process.env.PORT || 300;
/*////////////////////////////////////*/ 
const express = require("express");
const { response } = require('express');
let cors = require('cors')
const app = express();

app.use(express.urlencoded({extended:false}));
app.use(express.json());
app.use(cors());

/*////////////////////////////////////*/      
let mysql = require("mysql")
let connection = mysql.createConnection(
    {
        host:"huerta.c2iy07imwo9h.us-east-2.rds.amazonaws.com",
        user:"admin",
        password:"+-=3Huerta",
        database:"ProyectoHuerta"
    })

/*////////////////////////////////////*/ 
// connection.connect()
connection.connect(function (err){
    if(err)
    {
        console.log(err);
    }
    else
    {
        console.log("Conexión correcta.")
    }
});
/*///////////////GET USER/////////////////////*/ 

app.get("/user",

function (request,response) 
{
    let params = [request.query.id];
    console.log(request.query.id);
    if(request.query.id != null)
    {
        let userInfo = "SELECT * FROM user WHERE iduser = ?";
        connection.query(userInfo, params, function (err, result) 
        {
            if (err) response.send(err)
            else 
            {
                response.send(result)
            }
        })
    }
    else
    {
        let userInfo = "SELECT * FROM user"
        connection.query(userInfo, function (err,result)
        {
            if (err)
            {
                response.send(err)
            }
            else
            {
                response.send(result)
            }
        }) 
    }
});
/*/////////////////POST USER///////////////////*/
app.post ("/user",

function (request,response) 
{
    let params = [request.body.name, request.body.surname1, request.body.surname2, request.body.birthyear, request.body.username, request.body.localidad, request.body.cp, request.body.email, request.body.password]
    let usuario = "INSERT INTO user (name, surname1, surname2, birthyear, username, localidad, cp, email, password) VALUES (?,?,?,?,?,?,?,?,?)";
    connection.query(usuario, params, function (err, result)
    {
        if (err)
        {
            if((err.code == "ER_BAD_NULL_ERROR"))
            {
                response.send({"mensaje":"No se puede introducir un valor nulo"})
            }
            else if (err.code == "ER_NO_REFERNCED_ROW_2")
            {
                response.send({"mensaje":"Introduce un grupo válido"})
            }
            else {response.send(err)}
        }
        else 
        {
            let respuesta = {"mensaje":"Usuario añadido"}
            response.send(respuesta)
        }
    })
});

/*/////////////////PUT USER///////////////////*/

app.put("/user",

function (request,response) 
{
    let params = [request.body.name, request.body.surname1, request.body.surname2, request.body.birthyear, request.body.username, request.body.localidad, request.body.cp, request.body.email, request.body.password, request.body.iduser]
    if (request.body.iduser == null)
    {
        response.send({"mensaje":"Introduce un ID"})
    }
    else
    {
        let usuario = "UPDATE user SET name = COALESCE(?, name), surname1 = COALESCE (?, surname1), surname2 = COALESCE(?, surname2), birthyear = COALESCE(?, birthyear), username = COALESCE(?, username), localidad = COALESCE(?, localidad), cp = COALESCE(?, cp), email = COALESCE(?, email), password = COALESCE(?, password) WHERE iduser = ?";
    
    connection.query(usuario, params, function (err, result)
    {
        if (err) 
        {
            if (err)
            {
                response.send(err)
            }
        }
        else {response.send({"mensaje":"Modificación aplicada"})}
    });
    }
});

/*/////////////////DELETE USER///////////////////*/

app.delete("/user",

function (request,response) 
{
    let params = [request.query.id]
    let user = "DELETE FROM user WHERE iduser = ?";
    connection.query(user, params, function (err, result)
    {
        if (err) 
        {
            response.send(err)
        }
        
        else
        {
            if(response.affectedRows == 0)
            {
                response.send ({"mensaje":"El ID introducido no es válido"})
            }
            else 
            {
                response.send ({"mensaje":"Usuario eliminado"})}
            }
        })
});

app.use(function(request, response, next){
    respuesta = {codigo: 404, mensaje: "URL no encontrada"}
    response.status(404).send(respuesta)
})

app.listen(port);
