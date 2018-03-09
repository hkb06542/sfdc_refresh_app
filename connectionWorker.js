/*
This is connection Worker class that will read the same file for the session and will try to reuse Session else refresh the session if the session is INVALID. 
*/
const _ = require('lodash');
const fsd = require('./fetchSessionDetails');
const art = require('ascii-art');

connectionWorkerMethod;
//Method for re-using session ID, please use Connection worker for connecting to the salesforce servers
var connectionWorkerMethod = ()=>{
    
var availableSessions = fsd.getSessionDetailsformFile();

var availableSessionsObj = JSON.parse(availableSessions);
console.log(availableSessionsObj[0].serverUrl);
//Login to the salesforce server


return null;
};


module.exports = {
    connectionWorkerMethod
}