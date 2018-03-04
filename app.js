const electron = require('electron');
const createWin = require('./createWindow');
const appmenu = require('./appMenu');
const app = electron.app;
const Menu = electron.Menu;
const ipc = electron.ipcMain;
const fs = require('fs');

//This is Main Process for the app
let win;

app.on('ready',()=>{
   win =  createWin.createWindow(true);
   appmenu.createmenu(Menu,app);
});

//for windows
app.on('window-all-closed',()=>{
if( process.platform !== 'darwin')
{
    app.quit();
}
});

//for mac
app.on('activate',()=>{

    if(win === null)
    {
      win =  createWin.createWindow();
    }

});

//ipc Section for handeling events
ipc.on('quit-app',(event)=>{
  console.log('Closing app.....');  
  app.quit();
});

//ipc for saving the login details
ipc.on('login-add',(event,arg)=>{
  console.log('saving login details.....');
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