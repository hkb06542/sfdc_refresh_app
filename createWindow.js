
const electron = require('electron');
const app = electron.app;
const BrowserWindow = electron.BrowserWindow;
const path = require('path')
const url = require('url')

let win;
var createWindow = (debug)=>{
win = new BrowserWindow({
    width:'1024',
    height:'800'
});

win.loadURL(url.format({
pathname:path.join(__dirname,'app.html'),
protocol: 'file:',
slashes: true
}))

if(debug)
{
    win.webContents.openDevTools();
}

win.on('closed',()=>{
    win = null;
});

return win;

};//


module.exports ={
    createWindow
}