const electron = require('electron');
const createWin = require('./createWindow');
const appmenu = require('./appMenu');
const app = electron.app;
const Menu = electron.Menu;
const ipc = electron.ipcMain;

//This is Main Process for the app
let win;

app.on('ready',()=>{
   win =  createWin.createWindow(false);
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