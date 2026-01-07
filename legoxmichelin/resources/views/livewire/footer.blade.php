<div>
    <footer class="footer">
            <nav class="footer_nav">
                <a href="/home"><x-eva-home-outline class="icon_footer"/></a>
                <a href="/votes"><x-bx-message-check class="icon_footer"/></a>
                <a href="#"><x-zondicon-calendar class="icon_footer"/></a>
                @auth
                    <a href="#"><x-tabler-user class="icon_footer"/></a>
                @else
                    <a class="lien_connexion" href="{{route('login')}}"><x-tabler-user class="icon_footer"/></a>
                @endauth
            </nav>
    </footer>
</div>
