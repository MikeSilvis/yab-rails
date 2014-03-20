window.fbAsyncInit = function() {
  FB.init({
    appId      : '417175008425995',
    status     : true,
    xfbml      : true
  });
  FB.Event.subscribe('message.send', function(targetUrl) {
    _gaq.push(['_trackSocial', 'facebook', 'share']);
  });
  FB.Event.subscribe('edge.create', function(targetUrl) {
    _gaq.push(['_trackSocial', 'facebook', 'like', targetUrl]);
  });
};

(function(d, s, id){
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) {return;}
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
