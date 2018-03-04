<main>
<div class="uk-container">

<article class="uk-article">

    <h1 class="uk-article-title"><a class="uk-link-reset" href="">{opts.heading}</a></h1>

    <p class="uk-article-meta">Written by <a href="#">Super User</a> on 12 April 2012. Posted in <a href="#">Blog</a></p>

    <p class="uk-text-lead">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.</p>

    <p>Your Current Screen resolution is :{screensize.width}px x {screensize.height}px</p>

    <div class="uk-grid-small uk-child-width-auto" uk-grid>
        <div>
            <a class="uk-button uk-button-text" href="#">{more}</a>
        </div>
    </div>

</article>

</div>
<script>
this.on('before-mount', ()=>{
    console.log('Loading...');
    this.more = 'Read More guyz';
    this.screensize = size;
})
//Renderer process
  //renderer process
    const electronScreen = require('electron').screen
    const size = electronScreen.getPrimaryDisplay().size
    


</script>


</main>