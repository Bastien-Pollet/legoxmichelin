<x-layouts.app>
     <div class="container_login container">
      <h2 class="titre_vert f-lucida">Connexion</h2>
      <div class="block_form_login f-montserrat">
        <form action="{{route('login')}}" method="post" class="">
          <!-- @csrf -->
          <input type="email" name="email" required placeholder="Votre email" />
          <input
            type="password"
            name="password"
            required
            placeholder="Votre mot de passe"
          />
          <input type="submit" value="Se connecter" class="btn_log" />
        </form>

        <div class="block_inscription_login">
          <p>Pas encore de compte ?</p>
          <a href="{{ route('register') }}" class="btn_vert">Créer un compte</a>
        </div>
      </div>
    </div>
</x-layouts.app>
