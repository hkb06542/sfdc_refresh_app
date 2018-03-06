const fs = require('fs');
const sf = require('node-salesforce');
const fld = require('./fetchLoginDetails');



let session_filename = 'sessionsdetails.json';
let login_filename = 'logindetail.config';


//login to the salesforce
var conn = new sf.Connection({
    loginUrl: 'https://test.salesforce.com'

});

//a function for getting session details
var connectSFDCSaveSession = ()=>
{
    if(fs.existsSync(login_filename))
    {  
     //accessing file now   
    var loginDetails = JSON.parse(fld.fetchLoginDetails()); 
    console.log(loginDetails); 
    conn.login(loginDetails.username, loginDetails.password+loginDetails.securitytoken, (err, userInfo)=>{
        if(err)
        {    return console.error(err); }
        //saving this connection to use them next time
        var sessionDetailsArray = [];//List for holding session details
        //object structure of sessions
       var sessionDetails = {
            serverUrl:  conn.accessToken,
            sessionId:  conn.instanceUrl,
            UserId: userInfo.id,
            OrgID: userInfo.organizationId
                           };

        if(fs.existsSync(session_filename))
        {
          var sessionFilesread = fs.readFileSync(session_filename,'utf8');
          sessionDetailsArray = JSON.parse(sessionFilesread);
        }                   
        sessionDetailsArray.push(sessionDetails);                   
        console.log(sessionDetailsArray);
        fs.writeFileSync(session_filename,JSON.stringify(sessionDetailsArray,null, 2));
        
        });
    }else{
        console.log('No Login Configuration found !');
    }

};//



var getSessionDetailsformFile =()=>{

    var sessionDetails = {
        serverUrl:  '',
        sessionId:  '',
        UserId: '',
        OrgID: ''
                };
  var sessionsjson = fs.readFileSync(session_filename,'utf8');
  sessionDetails = sessionsjson;
   return sessionDetails;
};//

var saveSessionDetails =()=>{
    

};//

module.exports = {
    getSessionDetailsformFile,
    connectSFDCSaveSession
}