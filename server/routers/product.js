const express = require('express');
const productRoute = express.Router();
const auth = require('../middleware/auth');
const admin = require('../middleware/admin');
const Product = require('../models/product');


//
productRoute.get('/api/products',auth, async (req,res) => {
    try{
        console.log(req.query.category);
        const products =await Product.find({category:req.query.category});
        res.json(products);


    }catch(e){
    res.status(500).json({error: e.message});
    }
});

module.exports = productRoute;