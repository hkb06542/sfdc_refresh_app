const fs = require('fs');
const sf = require('node-salesforce');
const fld = require('./fetchLoginDetails');
const _  = require('lodash');



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
            serverUrl: conn.instanceUrl ,
            sessionId:conn.accessToken  ,
            UserId: userInfo.id,
            OrgID: userInfo.organizationId,
            datetime: new Date().toString()
                           };

        if(fs.existsSync(session_filename))
        {
          var sessionFilesread = fs.readFileSync(session_filename,'utf8');
          sessionDetailsArray = JSON.parse(sessionFilesread);
        }                   
        sessionDetailsArray.push(sessionDetails); 
        _.reverse(sessionDetailsArray); //reverse the array
        var unique_sessionDetailsArray = _.uniqBy(sessionDetailsArray,'sessionId'); //getting the unique session Arrays
        var sort_sessionDetailsArray = _.sortBy(unique_sessionDetailsArray,['datetime']); //getting the unique session Arrays
        var arrange_sessionDetailsArray = _.reverse(sort_sessionDetailsArray);
        //console.log(_.uniqBy(sessionDetailsArray,'sessionId'));
        fs.writeFileSync(session_filename,JSON.stringify(arrange_sessionDetailsArray,null, 2));
        
        });
    }else{
        console.log('No Login Configuration found !');
    }

};//


//Method for fetching the session File
var getSessionDetailsformFile =()=>{

    var sessionDetails = {
        serverUrl:  '',
        sessionId:  '',
        UserId: '',
        OrgID: ''
                };
  if(fs.existsSync(session_filename))
  {
    var sessionsjsonString = fs.readFileSync(session_filename,'utf8');
    return sessionsjsonString;
  }
  
   return null;
};//


module.exports = {
    getSessionDetailsformFile,
    connectSFDCSaveSession
}