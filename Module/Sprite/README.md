# Sprite
Module de sprite, avec animation et collision avec des tile ISSOLID

La scène gere automatiquement les sprite en les ajoutant à leur liste (on peut y ajouter tous les membre qui héritent Sprite) :
```lua
table.insert(lstSprite, sprite)
```
* Accessible :
```lua
mySprite = Sprite(pTexture, pX, pY)
```
ou en faisant hériter une autre classe de celle ci :
```lua
Player = Sprite:extend()
```

# Fonctions
* Animation

|Nom de la fonction | Description de la fonction 
|:-:|:-:
|Sprite:AddAnim(pAnimName, pTexture, pNbrFrame, pSizeX, pSizeY, pSpeed)| Ajoute une anim a la liste
|Sprite:PlayAnim(pAnimName)| Joue l'anim (pre-enregistrer)


* Collision

|Nom de la fonction | Description de la fonction 
|:-:|:-:
|Sprite.enableCollision = true| par defaut = false, Permet d'activer la collision avec les tile ISSOLID
|Sprite:CollideUp(pProp)| Aussi CollideDown, CollideRight, CollideLeft, Permet de detecter un tile avec une proprieté de chaque coté

* Mouvement

|Nom de la fonction | Description de la fonction 
|:-:|:-:
|Sprite.vx| aussi vy Met un velociter au Sprite
|Sprite.frictionX| aussi frictionY, Permet d'ajouter de la velociter au sprite (defaut : 99)
|Sprite:Move(pX, pY)| Bouge le sprite de facon simple
