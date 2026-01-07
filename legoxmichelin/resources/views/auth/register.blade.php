<x-layouts.app>  
  <div class="container_login container">
      <h2 class="titre_vert f-lucida">Inscription</h2>
      <div class="block_form_login f-montserrat">
        <form action="{{route('register')}}" method="post" class="">
          @csrf
          <input type="email" name="email" required placeholder="Votre email" />
          <input
            type="text"
            name="name"
            required
            placeholder="Votre nom d'utilisateur"
          />
          <input
            type="password"
            name="password"
            required
            placeholder="Votre mot de passe"
          />
          <input
            type="password"
            name="password_confirmation"
            required
            placeholder="Confirmez votre mot de passe"
          />
          <input type="submit" value="S'inscrire" class="btn_log" />
        </form>

        <div class="block_inscription_login">
          <p>Déjà un compte ?</p>
          <a href="{{ route('login') }}" class="btn_vert">Se connecter</a>
        </div>
      </div>
    </div>
</x-layouts.app>