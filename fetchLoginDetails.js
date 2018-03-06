const fs = require('fs');
//method to fetch the login details from file
var fetchLoginDetails = ()=>{
  
    var logindetailFetched = {
      username:'',
      password:'',
      securitytoken:'',
      orgtype:'',
      notes:'',
      active:''
    }; 
    
    if(fs.existsSync('logindetail.config'))
    {
      var content = fs.readFileSync('logindetail.config','utf8');
      var logindetailFetched = content;
      //console.log(logindetailFetched);
      
    }
    else{
      logindetailFetched = null;
    }
    return logindetailFetched
  };

  module.exports = {
    fetchLoginDetails
  }