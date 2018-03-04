
var createmenu = (menuObj,appobj)=>{

let template = [{
    label:'Menu',
    submenu:[{
        label:'Quit',
        accelerator:'CmdOrCtrl+Q',
        click: ()=>{
            appobj.quit();
        }
    }],

}];    
 const newmenu = menuObj.buildFromTemplate(template)
 menuObj.setApplicationMenu(newmenu)

};

//avant gaurde : ravindra :9845099990

module.exports = {
    createmenu
}