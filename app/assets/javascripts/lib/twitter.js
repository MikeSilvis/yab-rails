window.twttr = (function (d,s,id) {
  var t, js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return; js=d.createElement(s); js.id=id;
  js.src="//platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs);
  return window.twttr || (t = { _e: [], ready: function(f){ t._e.push(f) } });
}(document, "script", "twitter-wjs"));

$(document).ready(function() {
  function trackTwitter(intent_event) {
    if (intent_event) {
      _gaq.push(['_trackSocial', 'twitter', 'tweet']);
    }
  }

  twttr.ready(function (twttr) {
    twttr.events.bind('tweet', trackTwitter);
  });
});
