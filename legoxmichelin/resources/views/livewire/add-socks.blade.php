<div class="container_login ">
    <div class="block_form_login">
        <form wire:submit="save">
            <input type="text" required placeholder="Nom de votre chaussette" wire:model="name">
    
            <input type="text" required placeholder="Description de votre chaussette"wire:model="description">

            <input type="text" required placeholder="Design de votre chaussette"wire:model="design">

            <input type="file" wire:model="image">
        
            <button type="submit">Valider</button>
        </form>
    </div>
</div>
