/*
This is connection Worker class that will read the same file for the session and will try to reuse Session else refresh the session if the session is INVALID. 
*/
//var sf = require('node-salesforce');
const jsforce = require('jsforce');
const _ = require('lodash');
const fsd = require('./fetchSessionDetails');
const art = require('ascii-art');


//Method for re-using session ID, please use Connection worker for connecting to the salesforce servers
var connectionWorkerMethod = ()=>{
    
var availableSessions = fsd.getSessionDetailsformFile();

var availableSessionsObj = JSON.parse(availableSessions);

//Login to the salesforce server
var  conn = new  jsforce.Connection({
    instanceUrl : availableSessionsObj[0].serverUrl,
    accessToken : availableSessionsObj[0].sessionId
});


//console.log(conn);
var records = [];
conn.query("SELECT Id, Name FROM Account", function(err, result) {
  if (err) { 
      //calling the refresh fucntion is the session is invalid
      if(err.errorCode === 'INVALID_SESSION_ID')
      {
        console.log('Session is invalid, reconnecting  to the server');
        fsd.connectSFDCSaveSessionPromise()  //need to create promise for this method
        .then((result)=>{
            var  conn = new  jsforce.Connection({
                instanceUrl : availableSessionsObj[0].serverUrl,
                accessToken : availableSessionsObj[0].sessionId
            });
        })
        .catch((errorMsg)=>{
            conn = null;
            console.log('Promise Error :');
            console.log(errorMsg);
        }); 
        
        conn = null;
      }

    return console.error(conn);

}//End of error function
  console.log("total : " + result.totalSize);
  console.log("fetched : " + result.records.length);
});

return conn;
};


module.exports = {
    connectionWorkerMethod
}