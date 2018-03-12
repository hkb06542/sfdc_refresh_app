<managesession>
<div class="uk-container">
<ul uk-accordion hide={!opts.sessions}>
    <li class={ index == 0? 'uk-open uk-text-small ': 'uk-text-small'} each = { session, index in opts.sessions }   >
        <a class="uk-accordion-title" href="#">{ index == 0? 'Current Session': 'Previous Session'}</a>
        <div class="uk-accordion-content uk-overflow-auto uk-height-small">

        <table class="uk-table uk-table-striped uk-table-condensed uk-text-nowrap">
        <thead>
            <tr>
                <th>Session</th>
                <th>ServerUrl</th>
                <th>UserId</th>
                <th>OrgID</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="uk-text-break uk-text-truncate">{ session.sessionId }</td>
                <td>{ session.serverUrl }</td>
                <td>{ session.UserId }</td>
                <td>{session.OrgID }</td>
            </tr>

        </tbody>
    </table>
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