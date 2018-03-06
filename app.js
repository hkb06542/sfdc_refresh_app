const electron = require('electron');
const createWin = require('./createWindow');
const appmenu = require('./appMenu');
const app = electron.app;
const Menu = electron.Menu;
const ipc = electron.ipcMain;
//const ipcRenderer = electron.ipcRenderer;
const fs = require('fs');

//This is Main Process for the app
let win;

app.on('ready',()=>{
   win = createWin.createWindow(false);
   appmenu.createmenu(Menu,app);
   console.log(''+win);
   fetchLoginDetails();

   
});

//for windows
app.on('window-all-closed',()=>{
if( process.platform !== 'darwin')
{
  console.log(''+win);
    app.quit();
}
else if(process.platform === 'darwin' ){ //making explicity null for MAC OS as its easily to recreate the window in mac OS
  win = null;
}
});

//for mac
app.on('activate',()=>{
  console.log(''+win);
    if(win === null)
    {
     win = createWin.createWindow(false);
    }
   // win = createWin.createWindow(false);

});

//ipc Section for handeling events
ipc.on('quit-app',(event)=>{
  console.log('Closing app.....');  
  app.quit();
});

//ipc for saving the login details
ipc.on('login-add',(event,arg)=>{
  console.log('saving login details.....');
  //login details object
  var logindetail = {
    username:'',
    password:'',
    securitytoken:'',
    orgtype:'',
    notes:'',
    active:false
  }; 
  logindetail = arg;
  console.log(`argument : ${JSON.stringify(logindetail,null,2)}`);
  fs.writeFileSync('logindetail.config',JSON.stringify(logindetail,null,2));
});
 
//method to fetch the login details from file
var fetchLoginDetails = ()=>{
  
  var logindetailFetched = {
    username:'',
    password:'',
    securitytoken:'',
    orgtype:'',
    notes:'',
    active:false
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
//sending the call for fetching the data
ipc.on('login-fetch-req',(event,args)=>{
event.sender.send('login-fetch-res',fetchLoginDetails());
});