import "controllers"

var _gaq = _gaq || [];
// NEW 
_gaq.push(['_setAccount', 'UA-16941033-2']);
_gaq.push(['_trackPageview']);
// OLD
_gaq.push(['_setAccount', 'UA-4736643-2']);
_gaq.push(['_trackPageview']);

(function() {
  var ga = document.createElement('script'); 
  ga.type = 'text/javascript';
  ga.async = true;
  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
  (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(ga);
})(); 

