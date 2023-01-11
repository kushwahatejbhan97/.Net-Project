const toggleSwitch = document.querySelector('.theme-switch input[type="checkbox"]');
const currentTheme = localStorage.getItem('theme');

const logo = document.querySelector('.logo');
const aboutContent = document.querySelector('.about-content');

if (currentTheme) {
    document.documentElement.setAttribute('data-theme', currentTheme);

    if (currentTheme === 'dark') {
        toggleSwitch.checked = true;
    }
}

function switchTheme(e) {
    if (e.target.checked) {
        document.documentElement.setAttribute('data-theme', 'dark');
        localStorage.setItem('theme', 'dark');
        // aboutContent.style.background = "#212020";
        // aboutContent.style.color = "#fff";
        logo.setAttribute("src", "assets/images/logo/logot2_sidvin.png");
    }
    else {        document.documentElement.setAttribute('data-theme', 'light');
        localStorage.setItem('theme', 'light');
        logo.setAttribute("src", "assets/images/logo/logo.png");
        aboutContent.classList.add("txt-dark");
        // aboutContent.style.background = "#fff";
        // aboutContent.style.color = "#000";
    }
}

toggleSwitch.addEventListener('change', switchTheme, false);


$(document).ready(function () {
  $(".vid-link").click(function () {
    vidLink = $(this).attr("data-vidLink") + "?autoplay=1";

    $(".modal-body iframe").attr("src", vidLink);
  });


    $(".brand-section .owl-carousel").owlCarousel({
        loop: true,
        autoplay: true,
        dots: false,
        responsive: {
        0: {
          items: 1,
        },
        600: {
          items: 2,
        },
        1000: {
          items: 6,
        },
      },
    });



});

function openPage(pageName, elmnt) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].style.backgroundColor = "";
    tablinks[i].style.color = "";
  }
  document.getElementById(pageName).style.display = "block";
  elmnt.style.backgroundColor = "#b31010";
  elmnt.style.color = "#fff";
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();