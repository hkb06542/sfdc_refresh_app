<managesession>
<div class="uk-container">
<ul uk-accordion>
    <li class="uk-open" each = { opts }>
        <a class="uk-accordion-title" href="#">Current Session</a>
        <div class="uk-accordion-content">
            <p>Session : { opts.sessionId }</p>
            <p>serverUrl : </p>
            <p>UserId : </p>
            <p>OrgID : </p>

        </div>
    </li>
        <li>
        <a class="uk-accordion-title" href="#">Previous Session</a>
        <div class="uk-accordion-content">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
        </div>
    </li>
</ul>
</div>
<script>
this.one('before-mount', function() {
  console.log(this.opts.Object); 
   
  });
</script>
</managesession>