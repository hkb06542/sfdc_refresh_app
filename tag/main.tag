<main>
<div class="uk-container">

<article class="uk-article">

    <h1 class="uk-heading-bullet"><a class="uk-link-reset" href="">{opts.heading}</a></h1>
<div class="uk-child-width-1-2@s uk-grid-match" uk-grid>
    <div>
        <div class="uk-card  uk-card-default uk-card-hover uk-card-body"  uk-scrollspy="cls: uk-animation-slide-top; repeat: true" onclick = { openSetup }>
        <div class="uk-card-badge uk-label" uk-icon="check"></span></div>
            <h3 class="uk-card-title">SetUp</h3>
            <p>Please use this option to configure, Object data via CSV script</p>
        </div>
    </div>

    <div>
        <div class="uk-card uk-card-default uk-card-hover uk-card-body" uk-scrollspy="cls: uk-animation-slide-right; repeat: true" onclick={ openDeploy}>
        <div hide= {'true'} class="uk-card-badge uk-label" uk-icon="check"></span></div>    
            <h3 class="uk-card-title">Deploy</h3>
            <p>Use this for deploying your setup data to the target Sandbox/Org </p>
        </div>
    </div>

    <div>
        <div class="uk-card uk-card-primary uk-card-hover uk-card-body uk-light" uk-scrollspy="cls: uk-animation-slide-left; repeat: true" onclick={ openHDticket }>
        <div  hide= {'true'}  class="uk-card-badge uk-label" uk-icon="check"></span></div>    
            <h3 class="uk-card-title">Raise Helpdesk ticket</h3>
            <p>Use this card to raise helpdesk ticket</p>
        </div>
    </div>
    <div>
        <div class="uk-card uk-card-secondary uk-card-hover uk-card-body uk-light" uk-scrollspy="cls: uk-animation-slide-bottom; repeat: true" onclick={ openDoc }>
        <div hide= {'true'}  class="uk-card-badge uk-label" uk-icon="check"></span></div>    
            <h3 class="uk-card-title">Document</h3>
            <p>Constains the documentation for the app.</p>
        </div>
    </div>
</div>

</div>
<script>
this.on('before-mount', ()=>{
    this.more = 'Read More guyz';
    this.screensize = size;
})
//Renderer process
  //renderer process
    const electronScreen = require('electron').screen
    const size = electronScreen.getPrimaryDisplay().size
//function for loading the setup
openSetup(e)
{
    e.prevenUpdate = true;
    riot.mount('#views','setupview');
} // 

openDeploy(e)
{
    e.prevenUpdate = true;
    riot.mount('#views','deploy');
} //

openHDticket(e)
{
    e.prevenUpdate = true;
    riot.mount('#views','helpdeskticket');
} // 

openDoc(e)
{
    e.prevenUpdate = true;
    riot.mount('#views','doc');
} //  


</script>


</main>