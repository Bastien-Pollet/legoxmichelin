<?php

namespace App\Livewire;

use App\Models\Events;
use Livewire\Component;

class CardEvents extends Component
{
    public $events;

    public function mount()
    {
          $this->events = Events::with('users')->get();
    }

    public function register($eventId)
    {
        if (!auth()->check()) {
            return redirect()->route('login');
        }

        $event = Events::findOrFail($eventId);

        if ($event->isUserRegistered(auth()->id())) {
            session()->flash('error', 'Vous êtes déjà inscrit !');
            return;
        }

        if ($event->slots_available <= 0) {
            session()->flash('error', 'Plus de places disponibles !');
            return;
        }

        auth()->user()->events()->attach($eventId);

        $event->decrement('slots_available');

        session()->flash('success', 'Inscription réussie !');
        
        $this->events = Events::all();
    }

    public function render()
    {
        return view('livewire.card-events');
    }
}