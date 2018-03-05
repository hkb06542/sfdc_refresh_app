<logindetails>
<div class="uk-container">
<form onsubmit={ add }>
    <fieldset class="uk-fieldset">

        <legend class="uk-legend">Add Account</legend>

        <div class="uk-margin">
            <input class="uk-input" type="text" placeholder="Username" ref="username">
        </div>
        <div class="uk-margin">
            <input class="uk-input" type="text" placeholder="Password" ref="password">
        </div>
        <div class="uk-margin">
            <input class="uk-input" type="text" placeholder="Security Token" ref="securitytoken">
        </div>

        <div class="uk-margin">
            <select class="uk-select" ref="orgtype">
                <option>Sandbox</option>
                <option>Production</option>
            </select>
        </div>

        <div class="uk-margin">
            <textarea class="uk-textarea" rows="5" placeholder="Notes" ref="notes"></textarea>
        </div>

        <div class="uk-margin uk-grid-small uk-child-width-auto uk-grid">
            <label><input class="uk-radio" type="radio" name="radio2" checked ref="active">Active</label>
            <label><input class="uk-radio" type="radio" name="radio2"> InActive</label>
        </div>
      <button type="submit" class="uk-button uk-button-default">Submit</button>
    </fieldset>
</form>
</div>
<script>
const ipc = require('electron').ipcRenderer;
var logindetail = null;
this.on('before-mount', function() {
//sending the fetch for login Details
ipc.send('login-fetch-req');
ipc.on('login-fetch-res',(event,arg)=>{
console.log(arg);
//now loading the UI elements 
logindetail = JSON.parse(arg);
this.refs.username.value = logindetail.username;
});

    console.log('Loaded the Login Details Tag');
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
     
  }

</script>
</logindetails>