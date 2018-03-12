<main>
<div class="uk-container">

<article class="uk-article">

    <h1 class="uk-article-title"><a class="uk-link-reset" href="">{opts.heading}</a></h1>
<div class="uk-child-width-1-2@s uk-grid-match" uk-grid>
    <div>
        <div class="uk-card  uk-card-default uk-card-hover uk-card-body"  uk-scrollspy="cls: uk-animation-slide-top; repeat: true">
        <div class="uk-card-badge uk-label" uk-icon="check"></span></div>
            <h3 class="uk-card-title">SetUp</h3>
            <p>Please use this option to configure, Object data via CSV script</p>
        </div>
    </div>
    <div>
        <div class="uk-card uk-card-default uk-card-hover uk-card-body" uk-scrollspy="cls: uk-animation-slide-right; repeat: true">
        <div class="uk-card-badge uk-label" uk-icon="check"></span></div>    
            <h3 class="uk-card-title">Default</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
        </div>
    </div>
    <div>
        <div class="uk-card uk-card-primary uk-card-hover uk-card-body uk-light" uk-scrollspy="cls: uk-animation-slide-left; repeat: true">
        <div class="uk-card-badge uk-label" uk-icon="check"></span></div>    
            <h3 class="uk-card-title">Primary</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
        </div>
    </div>
    <div>
        <div class="uk-card uk-card-secondary uk-card-hover uk-card-body uk-light" uk-scrollspy="cls: uk-animation-slide-bottom; repeat: true">
        <div class="uk-card-badge uk-label" uk-icon="check"></span></div>    
            <h3 class="uk-card-title">Secondary</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
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
    


</script>


</main>