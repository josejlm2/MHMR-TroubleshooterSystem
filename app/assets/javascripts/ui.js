//Currently, this file is not being called properly by rails
//menuLink.onclick() is not being attached as an js event
//The js does not run all the way. It stops right before menuLink.onclick()
(function (window, document) {

    var layout   = document.getElementById('layout'),
        menu     = document.getElementById('menu'),
        menuLink = document.getElementById('menuLink');
    


    function toggleClass(element, className) {
        alert("toogle function");
        
        var classes = element.className.split(/\s+/),
            length = classes.length,
            i = 0;

        for(; i < length; i++) {
          if (classes[i] === className) {
            classes.splice(i, 1);
            break;
          }
        }
        // The className is not found
        if (length === classes.length) {
            classes.push(className);
        }

        element.className = classes.join(' ');
    }
   
 

    $('menuLink').onclick(function (event) {
      alert('Hooray!');
      event.preventDefault(); // Prevent link from following its href
    });
 

      menuLink.onclick = function (e) {
        var active = 'active';

        e.preventDefault();
        toggleClass(layout, active);
        toggleClass(menu, active);
        toggleClass(menuLink, active);
    };
       
  }(this, this.document));
