<navbar>
        <div class="uk-card uk-card-default uk-card-body uk-height-1-1">
    <ul class="uk-nav-default uk-nav-parent-icon" uk-nav>
        <li class="uk-active uk-nav-header"><a href="#" onclick={ main }>Menu</a></li>
        <li class="uk-parent">
            <a href="#">Login Settings</a>
            <ul class="uk-nav-sub">
                <li><a href="#" onclick={ logindetails }>Add Account</a></li>
                <li><a href="#" onclick={ managesession }>Manage Sessions</a></li>
            </ul>
        </li>

        <li class="uk-nav-header">Actions</li>
        <li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: table"></span>Refresh Pane</a></li>
        <li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: thumbnails"></span>Logs</a></li>
        <li class="uk-nav-divider"></li>
        <li><a href="#" onclick={exit}><span class="uk-margin-small-right" uk-icon="icon: trash"></span> Exit</a></li>
    </div>
    <script>
       //renderer process
    const ipc = require('electron').ipcRenderer;

   main(e){
   e.preventUpdate = true;
   riot.mount('#views','main',{heading:'Welcome'});
   }


    logindetails(e){
    e.preventUpdate = true;
    //sending the fetch for login Details
    ipc.send('login-fetch-req');
    ipc.on('login-fetch-res',(event,arg)=>{

    var logindetail = JSON.parse(arg);
    //console.log('Calling. .. .  .' +logindetail.username);
    console.log(logindetail);
    riot.mount('#views','logindetails',logindetail);
    
    });

      };//

    managesession(e){
        e.preventUpdate = true;
        ipc.send('session-fetch-req');
        ipc.on('session-fetch-res',(event, arg)=>{        
        var sessiondetailArray = JSON.parse(arg);
        console.log(sessiondetailArray);
        riot.mount('#views','managesession',{sessions:sessiondetailArray} );
        });
        
     }

//
    exit(e){
     e.preventUpdate = true;
     console.log('Quitting App')
     ipc.send('quit-app');
    }
          
    </script>
</navbar>