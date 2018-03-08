<managesession>
<div class="uk-container">
<ul uk-accordion hide={!opts.sessions}>
    <li class={ index == 0? 'uk-open': ''} each = { session, index in opts.sessions }>
        <a class="uk-accordion-title" href="#">{ index == 0? 'Current Session': 'Previous Session'}</a>
        <div class="uk-accordion-content">
            <p>Session : { session.sessionId }</p>
            <p>serverUrl : { session.serverUrl } </p>
            <p>UserId : { session.UserId }</p>
            <p>OrgID : {session.OrgID } </p>

        </div>
    </li>
</ul>
<h4  hide={opts.sessions} class="uk-heading-primary">No Session Information.</h4>
</div>


<script>
this.one('before-mount', function() {
  console.log(this.opts.session); 
   
  });
</script>
</managesession>