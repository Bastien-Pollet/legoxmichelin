<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="{{ asset('img/logo_boko.jpg') }}"/>
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">

    <title>Lego x Michelin</title>
  

</head>
<body>
    <main>
        {{ $slot }}
    </main> 
    <livewire:footer />
 
    @livewireScripts
</body>
</html>