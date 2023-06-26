<nav class="navbar">
    <g:img dir="grails-app/assets/images/logo.svg" file="logo.svg" />
    <div class="nav">
        <div class="nav-links">
            <ul>
            <li><a href="/" class="nav-link">Home</a></li>
            <li><a href="/employee" class="nav-link">Employee</a></li>
            <li><a href="#" class="nav-link">About</a></li>
            </ul>
        </div>
    <g:img dir="grails-app/assets/images/Account circle.png" file="Account circle.png" />
    </div>
</nav>

<style>
.navbar {
    display: flex;
    align-items: center;
}

.nav-links {
    color: #1b262c;
    display: flex;
    list-style-type: none;
    margin-right: 190px;
    font-size: 18px;
}

.nav-link {
    text-decoration: none;
    color: black;
}

.nav-link.active {
    text-decoration: underline;
    text-underline-offset: 8px;
}

.nav {
    display: flex;
    align-items: center;
}

/*.logo {*/
/*    width: 161px;*/
/*    height: 57px;*/
/*}*/

/*.userprofile {*/
/*    height: 35px;*/
/*    width: 35px;*/
/*    border-radius: 0px;*/
/*    padding-right: 10px;*/
/*}*/
</style>

<script>
    const navLinks = document.querySelector(".nav-links");

    if (navLinks) {
        navLinks.addEventListener("click", (e) => {
            const clickedLink = e.target.closest(".nav-link");

            if (clickedLink) {
                e.preventDefault();

                // Remove the "active" class from all links
                const links = document.querySelectorAll(".nav-link");
                links.forEach((link) => {
                    link.classList.remove("active");
                });

                // Add the "active" class to the clicked link
                clickedLink.classList.add("active");

                // Get the href attribute of the clicked link
                const href = clickedLink.getAttribute("href");

                // Change the URL to the clicked link's href
                window.location.href = href;
            }
        });
    }
</script>

