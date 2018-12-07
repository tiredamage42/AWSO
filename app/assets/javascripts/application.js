// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

//when page loads remove any instances of tinymce and then initialize again
document.addEventListener('turbolinks:load', function (){
    tinymce.remove();
    tinymce.init({
        // change this value according to your HTML
        selector: "textarea#post_body",  
        plugins: "codesample image media link code textcolor autolink autoresize",
        toolbar: "undo redo | styleselect | bold italic | forecolor backcolor | codesample image media link code",
        
        autoresize_bottom_margin: 50,
        autoresize_max_height: 500,
        autoresize_min_height: 350,
        autoresize_overflow_padding: 50

    });
})
















