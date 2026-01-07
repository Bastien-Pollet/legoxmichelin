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
    <script>
        const socks = document.querySelectorAll('.img_socks');

        socks.forEach(sock => {
            sock.addEventListener('click', () => {

                const card = sock.closest('.card_chaussette');
                const croix = card.querySelector('.croix');

                sock.classList.add("image_zoom", "active");
                croix.classList.add("active");
                document.documentElement.style.overflow = 'hidden';

                const close = () => {
                    sock.classList.remove("image_zoom", "active");
                    croix.classList.remove("active");
                    document.documentElement.style.overflow = 'visible';
                };

                croix.addEventListener('click', close, { once: true });
            });
        });


    </script> 
    @livewireScripts
</body>
</html>