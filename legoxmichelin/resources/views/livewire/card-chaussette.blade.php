<div class="container_votes">
    @foreach($socks as $sock)
        <div class="card_chaussette">
            <x-radix-cross-1 class="croix"/>
            <div class="block_haut">
                <img class="img_socks" src="{{ $sock->image_url }}" alt="{{ $sock->name }}">
                <div class="title_socks" >
                    <h2>{{ $sock->name }}</h2>
                    <p>{{ $sock->description }}</p>
                    <p>( {{$sock->rating_count}} avis )</p>
                </div>
            </div>
               <div class="block_bas">
                <p class="text_vote">Votre vote :</p>
                <div class="vote_socks" >
                    <button type="button" wire:click="vote({{$sock->id}}, 1)"><x-bi-star-fill class="icon_footer"/></button>
                    <button type="button" wire:click="vote({{$sock->id}}, 2)"><x-bi-star-fill class="icon_footer"/></button>
                    <button type="button" wire:click="vote({{$sock->id}}, 3)"><x-bi-star-fill class="icon_footer"/></button>
                    <button type="button" wire:click="vote({{$sock->id}}, 4)"><x-bi-star-fill class="icon_footer"/></button>
                    <button type="button" wire:click="vote({{$sock->id}}, 5)"><x-bi-star-fill class="icon_footer"/></button>
                </div>
                <p class="text_vote">Vous avez donné {{ $notes[$sock->id] }} briques</p>
            </div>

        </div>
    @endforeach
</div>
