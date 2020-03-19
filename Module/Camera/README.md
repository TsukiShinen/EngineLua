# Camera 
Module gérant la camera du jeu (et la resolution)

Accessible partout dans le code via la variable _Camera_

# Fonctions
------
|Nom de la fonction | Description de la fonction 
|-:|:-:
|Camera:Move(dx, dy) | Bouge la Camera
|Camera:Rotate(dr) | Tourne la Camera
|Camera:Scale(sx, sy) | Zoom la Camera (Utiliser pour set la Resolution)
|Camera:SetCenter(x, y) | La camera centre l'objet x,y
|Camera:SetPosition(x, y) | La camera se place a x,y
|Camera:MousePosition() | Recupere la position de la souris
