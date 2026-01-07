<?php

namespace App\Livewire;

use App\Models\Socks;
use Livewire\Component;
use Livewire\WithFileUploads;
use Livewire\Attributes\Validate;

class AddSocks extends Component
{
    use WithFileUploads;
    #[Validate('required|string|max:255')]
    public $name;

    #[Validate('required|string|max:255')]
    public $design;

    #[Validate('nullable|string')]
    public $description;

    #[Validate('required|image|max:1024')] // 1MB
    public $image;
    
    public function save()
    {

        $this->validate();

        $path = $this->image->store('socks', 'public');

        Socks::create([
            'name' => $this->name,
            'design' => $this->design,
            'description' => $this->description,
            'image_url' => $path,
        ]);

        session()->flash('status', 'Post successfully updated.');
 
        return $this->redirect('/votes');
    }

    public function render()
    {
        return view('livewire.add-socks');
    }
}
