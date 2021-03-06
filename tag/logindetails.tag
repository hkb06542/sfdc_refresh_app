<logindetails>
<div class="uk-container">
<form ref="logindetail" onsubmit={ add }>
    <fieldset class="uk-fieldset">

        <legend class="uk-legend">Add Account</legend>

        <div class="uk-margin">
            <input class="uk-input" type="text" placeholder="Username" ref="username" value="{opts.username}">
        </div>
        <div class="uk-margin">
            <input class="uk-input" type="text" placeholder="Password" ref="password" value="{opts.password}">
        </div>
        <div class="uk-margin">
            <input class="uk-input" type="text" placeholder="Security Token" ref="securitytoken" value="{opts.securitytoken}">
        </div>

        <div class="uk-margin">
            <select class="uk-select" ref="orgtype" value="{opts.orgtype}">
                <option>Sandbox</option>
                <option>Production</option>
            </select>
        </div>

        <div class="uk-margin">
            <textarea class="uk-textarea" rows="5" placeholder="Notes" ref="notes" value="{opts.notes}"></textarea>
        </div>

        <div class="uk-margin uk-grid-small uk-child-width-auto uk-grid">
            <label><input class="uk-radio" type="radio" name="radio2" checked ref="active">Active</label>
            <label><input class="uk-radio" type="radio" name="radio2"> InActive</label>
        </div>
      <button type="submit" class="uk-button uk-button-default">Save</button>
    </fieldset>
</form>
</div>
<script>

//adding Code for Copy and paste option

const electron = require('electron');
const ipc = electron.ipcRenderer;
const remote = electron.remote;
const Menu = remote.Menu;

const InputMenu = Menu.buildFromTemplate([{
        label: 'Undo',
        role: 'undo',
    }, {
        label: 'Redo',
        role: 'redo',
    }, {
        type: 'separator',
    }, {
        label: 'Cut',
        role: 'cut',
    }, {
        label: 'Copy',
        role: 'copy',
    }, {
        label: 'Paste',
        role: 'paste',
    }, {
        type: 'separator',
    }, {
        label: 'Select all',
        role: 'selectall',
    },
]);

document.body.addEventListener('contextmenu', (e) => {
    e.preventDefault();
    e.stopPropagation();

    let node = e.target;

    while (node) {
        if (node.nodeName.match(/^(input|textarea)$/i) || node.isContentEditable) {
            InputMenu.popup(remote.getCurrentWindow());
            break;
        }
        node = node.parentNode;
    }
});

//END adding Code for Copy and paste option


this.one('before-mount', function() {
  console.log(this.opts); 
   
  });

  add(e)
  { 
   e.preventDefault();
    var logindetail = {
    username: this.refs.username.value,
    password: this.refs.password.value,
    securitytoken: this.refs.securitytoken.value,
    orgtype: this.refs.orgtype.value,
    notes: this.refs.notes.value,
    active: this.refs.active.value
  }; 
      
      console.log('form submitted ! with values'+JSON.stringify(logindetail));
      ipc.send('login-add',logindetail);
      UIkit.notification('Login saved',{pos: 'top-right',status:'success'});
     
  }

</script>
</logindetails>