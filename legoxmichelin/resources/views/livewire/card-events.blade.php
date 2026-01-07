<div>
    @if (session()->has('success'))
        <div class="bg-green-100 p-4 rounded mb-4">
            {{ session('success') }}
        </div>
    @endif

    @if (session()->has('error'))
        <div class="bg-red-100 p-4 rounded mb-4">
            {{ session('error') }}
        </div>
    @endif

    <div class="container_votes">
        @foreach($events as $event)
            <div class="card_events">
                <p class="entete_events">{{$event->type}}</p>
                <div class="block_events">
                    <p class="event_title">{{$event->title}}</p>
                    <p class="text_event"><x-zondicon-calendar class="icon_footer"/> {{$event->event_date}}</p>
                    <p class="text_event"><x-eva-pin-outline class="icon_footer"/>{{$event->location}}</p>
                    <p class="text_event"><x-feathericon-users class="icon_footer"/>{{$event->slots_available}} places restantes sur {{$event->max_slots}}</p>        
                    <p class="event_description">{{$event->description}}</p>
                </div>
                
                @auth
                    @if($event->isUserRegistered(auth()->id()))
                        <button disabled class="btn_inscrire opacity-50">
                            Déjà inscrit
                        </button>
                    @elseif($event->slots_available <= 0)
                        <button disabled class="btn_inscrire opacity-50">
                            Complet
                        </button>
                    @else
                        <button wire:click="register({{$event->id}})" class="btn_inscrire">
                            S'inscrire
                        </button>
                    @endif
                @else
                    <a href="{{ route('login') }}" class="btn_inscrire">
                        Connexion requise
                    </a>
                @endauth
            </div>
        @endforeach
    </div>
</div>