const jwt = require('jsonwebtoken');

const auth = async (req,res,next) => {
    try{
        const token = req.header('x-auth-token');
        if(!token)
            return res.status(401).json({msg: "no auth token access denied"});

             const verifed = jwt.verify(token, "passwordKey");
                    if(!verifed) return res.status(401).json({msg :"token verifiacation faild, autherization denied"});
            req.user = verifed.id;
            req.token = token;
            next();
    }catch(e){
        res.status(500).json({error : err.message});
    }
};

module.exports = auth;