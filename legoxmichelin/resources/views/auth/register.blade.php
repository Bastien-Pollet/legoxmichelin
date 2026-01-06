<x-layouts.app>  
   <div class="container_login container">
        <h2 class="titre_vert f-lucida">Inscription</h2>
        <div class="block_form_login f-montserrat">
            <form action="{{route('register')}}" method="post" class="">
                @csrf
                <input type="text" value="{{old('name')}}" name="name" required placeholder="Votre pseudo" class=""/>
                <input type="email" value="{{old('email')}}" name="email" required placeholder="Votre email" class=""/>
                <input type="password" name="password" required placeholder="Votre mot de passe" class=""/>
                <input type="password" name="password_confirmation" required placeholder="Confirmez votre mot de passe" class=""/>
                @error('password') <p class="text-red-500 mt-2">{{ $message }}</p> @enderror
                <input type="submit" value="Créer un compte" class="btn_vert"/>

            </form>
            <div class="">
                <p>Déjà un compte  ? <a href="{{route('login')}}">Connectez-vous</a></p>
            </div>
        </div>
    </div>
</x-layouts.app>