//this is kind of import Packages
const express = require('express');
const mongoose =require('mongoose');

//import From Other files
const authRouter = require('./routers/auth');
const adminRouter = require('./routers/admin');

//INIT
const PORT = 3000;
const app=express();
const DB="mongodb+srv://abhishekmvit91:flutter@cluster0.th6asij.mongodb.net/?retryWrites=true&w=majority";


//middleware
 app.use(express.json());
 app.use(authRouter);
 app.use(adminRouter);


//connections
mongoose.connect(DB)
    .then(() => {
    console.log('connection succesfully');
})
.catch((e) => {
    console.log(e);
})

app.get('/user',(req,res)=>{
    res.json({hi:'chetan'});
})

app.listen(PORT,"0.0.0.0",() => {
    console.log(`connected at port ${PORT} hello`);
})