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
    
    if(request.query.id)
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


app.post("/login",

function (request,response) 
{
    let params = [request.body.email, request.body.password];
    
    if(request.body.email != null || request.body.password != null)
    {
        let userInfo = "SELECT * FROM user WHERE email = ? AND password = ?";

        connection.query(userInfo, params, function (err, result) 
        {
            if (err) response.send(err)
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
    let params = [request.body.name, request.body.surname1, request.body.birthyear, request.body.username, request.body.localidad, request.body.telefono, request.body.email, request.body.password, request.body.userImg]
    let usuario = "INSERT INTO user (name, surname1, birthyear, username, localidad, telefono, email, password) VALUES (?,?,?,?,?,?,?,?,?)";
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
    let params = [request.body.name, request.body.surname1, request.body.birthyear, request.body.username, request.body.localidad, request.body.telefono, request.body.email, request.body.password, request.body.userImg, request.body.iduser]
    if (request.body.iduser == null)
    {
        response.send({"mensaje":"Introduce un ID"})
    }
    else
    {
        let user = "UPDATE user SET name = COALESCE(?, name), surname1 = COALESCE (?, surname1), birthyear = COALESCE(?, birthyear), username = COALESCE(?, username), localidad = COALESCE(?, localidad), telefono = COALESCE(?, telefono), email = COALESCE(?, email), password = COALESCE(?, password), userImg = COALESCE(?, userImg)  WHERE iduser = ?";
    
    connection.query(user, params, function (err, result)
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


/*///////////////////////////////////////ENDPOINTS PRODUCTOS//////////////////////////////////////////////////////*/

/*///////////////GET PRODUCT/////////////////////*/ 
app.get("/product",

function (request,response) 
{
    let params = [request.query.id, request.query.productName, 
        request.query.productType, request.query.productAmount, 
        request.query.productLocality, request.query.productPrice, 
        request.query.productEco, request.query.productChange, 
        request.query.iduser];

        if(request.query.id != null || request.query.productName != null || request.query.productType != null || request.query.productAmount != null || request.query.productLocality != null || request.query.productPrice != null || request.query.productEco != null || request.query.productChange != null || request.query.iduser != null)
    {
        let productQuery = "SELECT * FROM product WHERE idproduct = COALESCE(?, idproduct)"+
        " AND productName = COALESCE(?, productName) "+
        " AND productType = COALESCE (?, productType) "+
        " AND productAmount = COALESCE(?, productAmount)"+
        " AND productLocality = COALESCE(?, productLocality)"+
        " AND productPrice = COALESCE(?, productPrice)"+
        " AND productEco = COALESCE(?, productEco)"+
        " AND productChange = COALESCE(?, productChange)"+
        " AND iduser = COALESCE(?, iduser)";
        console.log(productQuery)
        console.log("parametros"+params)
        connection.query(productQuery,params, function (err, result){
            if (err) response.send(err)
            else 
            {
                response.send(result)
            }
        })
    }

    else if(request.query.productName == null && request.query.id == null && request.query.productType == null && request.query.productAmount == null && request.query.productLocality == null && request.query.productPrice == null && request.query.productEco == null && request.query.productChange == null)
    {
        let productInfo = "SELECT * FROM product ORDER BY idproduct DESC LIMIT 9"
        connection.query(productInfo, function (err,result)
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
/*///////////////POST PRODUCT/////////////////////*/ 
app.post ("/product",

function (request,response) 
{
    let params = [request.body.productName, request.body.productType, request.body.productAmount, request.body.productLocality, request.body.productPrice, request.body.productEco, request.body.productChange, request.body.iduser, request.body.productImg, request.body.productDescription]
    let product = "INSERT INTO product (productName, productType, productAmount, productLocality, productPrice, productEco, productChange, iduser, productImg) VALUES (?,?,?,?,?,?,?,?,?)";
    connection.query(product, params, function (err, result)
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
            let respuesta = {"mensaje":"Producto añadido"}
            response.send(respuesta)
        }
    })
});
/*/////////////////PUT PRODUCT///////////////////*/

app.put("/product",

function (request,response) 
{
    let params = [request.body.productName, request.body.productType, 
        request.body.productAmount, request.body.productLocality, 
        request.body.productPrice, request.body.productEco, 
        request.body.productChange, request.body.productImg, 
        request.body.iduser, request.body.idproduct]

    if (request.body.idproduct != null)
    {
        console.log("entroooo")

        let product = `UPDATE product SET productName = COALESCE(?, productName), 
        productType = COALESCE (?, productType), 
        productAmount = COALESCE(?, productAmount), 
        productLocality = COALESCE(?, productLocality), 
        productPrice = COALESCE(?, productPrice), 
        productEco = COALESCE(?, productEco), 
        productChange = COALESCE(?, productChange), 
        productImg = COALESCE(?, productImg),
        iduser = COALESCE(?, iduser)
        
        WHERE idproduct = ?`;

        connection.query(product,params, function(err,res){

        response.send(res)

        })
    }
    else
    {
        response.send({"mensaje":"Introduce un ID"})
   
    }
});


/*/////////////////DELETE USER///////////////////*/

app.delete("/product", function (request,response){
    let idProduct = request.body.idproduct
    if(idProduct !== undefined){
        console.log(idProduct)
        let deleteProduct = "DELETE FROM product WHERE idproduct=?"
        console.log(idProduct)
        connection.query(deleteProduct, [idProduct], function (err, resultado, field){
            if(err){
                response.send( "Error" + err);
               
            } else {
                if(resultado.affectedRows == 0) {
                    console.log(resultado)

                    response.status(404).send({"error":"El id introducido no existe"})
                } else{
                    response.status(200).send({"texto":`El producto con el id ${idProduct} ha sido eliminado`});
                }
            }
        })
    }else{
        response.status(404).send("No has introducido el id"); 
    }
})

/*///////////////////////////////////////ENDPOINTS CHAT//////////////////////////////////////////////////////*/
/*///////////////GET CHAT/////////////////////*/ 
app.get("/chat",

function (request,response) 
{
    let params = [request.query.id];
    console.log(request.query.id);
    if(request.query.id != null)
    {
        let chatInfo = "SELECT * FROM chat WHERE idchat = ?";
        connection.query(chatInfo, params, function (err, result) 
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
        let chatInfo = "SELECT * FROM chat"
        connection.query(chatInfo, function (err,result)
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
/*///////////////POST CHAT/////////////////////*/ 
app.post ("/chat",

function (request,response) 
{
    let params = [request.body.idmessenger1, request.body.idmessenger2]
    let chat = "INSERT INTO chat (idmessenger1, idmessenger2) VALUES (?,?)";
    connection.query(chat, params, function (err, result)
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
            let respuesta = {"mensaje":"Chat añadido"}
            response.send(respuesta)
        }
    })
});
/*/////////////////DELETE CHAT///////////////////*/
app.delete("/chat",

function (request,response) 
{
    let params = [request.query.id]
    let chat = "DELETE FROM chat WHERE idchat = ?";
    connection.query(chat, params, function (err, result)
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
                response.send ({"mensaje":"Chat eliminado"})}
            }
        })
});
/*///////////////////////////////////////ENDPOINTS MENSAJE//////////////////////////////////////////////////////*/
/*///////////////GET MENSAJE/////////////////////*/ 
app.get("/message",

function (request,response) 
{
    let params = [request.query.id];

    if(request.query.id != null)
    {
        let messageInfo = "SELECT * FROM message WHERE idmessage = ?";
        connection.query(messageInfo, params, function (err, result) 
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
        let messageInfo = "SELECT * FROM message"
        connection.query(messageInfo, function (err,result)
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
/*///////////////POST MENSAJE/////////////////////*/ 
app.post ("/message",

function (request,response) 
{
    let params = [request.body.idchat, request.body.idsender, request.body.idreciever, request.body.messageText]
    let message = "INSERT INTO message (idchat, idsender, idreciever, messageText) VALUES (?,?,?,?)";
    connection.query(message, params, function (err, result)
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
            let respuesta = {"mensaje":"Mensaje añadido"}
            response.send(respuesta)
        }
    })
});

/*///////////////////////////////////////ENDPOINTS TRANSACTION//////////////////////////////////////////////////////*/
/*///////////////GET TRANSACTION/////////////////////*/ 
app.get("/transaction",

function (request,response) 
{
    let params = [request.query.id, request.query.id_buyer, request.query.id_seller];

    if(request.query.id != null || request.query.id_buyer != null || request.query.id_seller != null)
    {

        
        let transactionInfo = "SELECT * FROM transaction WHERE idtransaction = COALESCE(? , idtransaction) "+
        " AND id_buyer = COALESCE(? , id_buyer) " +
        " AND id_seller = COALESCE(? , id_seller)";

        connection.query(transactionInfo, params, function (err, result) 
        {
            if (err) response.send(err)
            else 
            {
                response.send(result)
            }
        })
    }

    else if (request.query.id == null && request.query.id_buyer == null && request.query.id_seller == null)
    {
        let transactionInfo = "SELECT * FROM transaction"
        connection.query(transactionInfo, function (err,result)
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
/*///////////////POST TRANSACTION/////////////////////*/ 
app.post ("/transaction",

function (request,response) 
{
    let params = [request.body.id_buyer, request.body.id_seller, request.body.id_product, request.body.transactionAmount]
    let transaction = "INSERT INTO transaction (id_buyer, id_seller, id_product, transactionAmount) VALUES (?,?,?,?)";
    connection.query(transaction, params, function (err, result)
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
            let respuesta = {"mensaje":"Transacción añadida"}
            response.send(respuesta)
        }
    })
});


/*///////////////////////////////////////ENDPOINTS HISTORIAL PEDIDOS//////////////////////////////////////////////////////*/
/*///////////////GET  HISTORIAL PEDIDOS/////////////////////*/ 

app.get("/pedidos", function(request, response){


    let params = [request.query.id]

    let pedidos = `SELECT id_product, id_seller, user.name, productName, productType,productAmount,productLocality,
    productPrice,productEco,productChange,productImg FROM product
    
    INNER JOIN transaction ON (transaction.id_product = product.idproduct)
    INNER JOIN user ON (user.iduser = transaction.id_seller)
    
    WHERE transaction.id_buyer = COALESCE(?,transaction.id_buyer)`

        connection.query(pedidos,params,function(err,res){
            
            if ( err ){
                if ( request.query.id == null){

                    response.send({"mensaje":"usuario no logueado"})

                } 
            } else
            response.send(res)
            console.log(res)
        })     
  
})

/*///////////////////////////////////////ENDPOINTS HISTORIAL ENVIOS//////////////////////////////////////////////////////*/
/*///////////////GET HISTORIAL PEDIDOS/////////////////////*/ 

app.get("/envios", function(request,response){

    let params = [request.query.id]

    let envios = `SELECT id_product, id_seller, user.name, productName, productType,productAmount,productLocality,
    productPrice,productEco,productChange,productImg FROM product
    
    INNER JOIN transaction ON (transaction.id_product = product.idproduct)
    INNER JOIN user ON (user.iduser = transaction.id_seller)
    
    WHERE transaction.id_seller = ?`

    connection.query(envios,params,function(err,res){
        
        response.send(res)
        console.log(res)
    })
})



app.use(function(request, response, next){
    respuesta = {codigo: 404, mensaje: "URL no encontrada"}
    response.status(404).send(respuesta)
})



app.listen(port);