#EngineLua
==========

Presentation
------------
EngineLua est un framework pour faire des jeux 2D en Lua. Il est gratuit et fonctionne sur Windows.

Module où l'on doit écrire dedans :
- Util (Ajout de fonction accessible partout dans le code)
- GameState (Ajout de nouvelles scènes)
- AssetManager (Ajout des Assets : textures, ...)
- config.json (La configuration a modifier comme vous le souhaiter)
- Key (Ajout et modification des touche du clavier)
- Require (Ajout des nouvelles classe public)
- MapManager (Ajout de detection de proprieter)

Bibliothèques
-------------
- [Classic](https://github.com/rxi/classic) : Un petit module de classe pour Lua.
- [Json](https://github.com/rxi/json.lua) : Un module permettant de faire le lien entre Lua et Json.

Modules
-------
- **config.json** : Contient la configuration qui seras lua par certain module

Contient : 
1. La Version du jeu
2. L'activation du mode de debugage
3. La resolution de l'écran

- **Util** : Module permettant d'appeler des fonction partout dans le code

Accessible partout dans le code via la variable _Util_

Fonction :
```lua
Util:LoadJson(name)
```
_name_ est le chemin du fichier .json

- **Debug** : Module permettant de debugger dans la console si il est activer (via config.json)

Accessible partout dans le code via la variable _Debug_

Fonction : 
```lua
Debug:Log(Message)
```
Permet d'ecrire _[Log] Message_ dans la console

```lua
Debug:Error(Message)
```
Permet d'ecrire _[Error] Message_ dans la console

- **Require** : importe toute les classes public et donc accessible partout dans le code

Juste écrire _require "classe"_ dans Require pour l'importer (classe est le chemin de la classe)

- **GUI** : Module permettant la gestion d'une GUI

Accessible partout dans le code via la variable _GUI_

Elements :
1. Groupe
```lua
group = GUI.newGroup()
```
```lua
group:addElement(pElement) -- Ajoute un Element dans le groupe
```
```lua
group:setVisible(pVisible) -- Set Groupe visible ou pas
```
```lua
group:myGroup:update() -- Update the Groupe
```
```lua
group:myGroup:draw() -- Draw le Groupe
```
2. Panel
```lua
panel = GUI.newPanel(pX, pY, pW, pH, pColorOut)
```
```lua
panel:setImage(pImage) -- Set l'image du panel
```
```lua
panel:setEvent(pEventType, pFunction) -- Ajout des event (type : "hover")
```
```lua
panel:draw()
```
```lua
panel:update(dt)
```
3. Text (hérite de Panel)
```lua
text = GUI.newText(pX, pY, pW, pH, pText, pFont, pHAlign, pVAlign, pColor)
```
```lua
text:draw(dt)
```
4. Button (hérite de Panel)
```lua
button = GUI.newButton(pX, pY, pW, pH, pText, pFont, pColor)
```
```lua
button:setImages(pImageDefault, pImageHover, pImagePressed) -- Surcouche a Panel, permettant la gestion de plusieure images
```
5. CheckBox (hérite de Panel)
```lua
checkBox = GUI.newCheckbox(pX, pY, pW, pH)
```
```lua
checkBox:setImages(pImageDefault, pImagePressed) -- Surcouche a Panel, permettant d'afficher l'image correspondant a l'état
```
```lua
checkBox:setState(pbState) -- Modifie l'etat (boolean)
```
6. ProgressBar(hérite de Panel)
```lua
progressBar = GUI.newProgressBar(pX, pY, pW, pH, pMax, pColorOut, pColorIn)
```
```lua
progressBar:setImages(pImageBack, pImageBar) -- Surcouche a Panel, permettant l'affichage de la bar vide et x remplie
```
```lua
progressBar:setValue(pValue) -- set la valeur de la progressBar
```

- **Screen** : Module gérant la taille et les valeur de la resolution de la fenetre (via config.json)

Accessible partout dans le code via la variable _Screen_

- **Camera** : Module gérant la camera du jeu (et la resolution)

Accessible partout dans le code via la variable _Camera_

Fonction :
```lua
Camera:Move(dx, dy) -- Bouge la Camera
```
```lua
Camera:Rotate(dr) -- Tourne la Camera
```
```lua
Camera:Scale(sx, sy) -- Scale la Camera (Utiliser pour la Resolution)
```
```lua
Camera:SetCenter(x, y) -- La camera centre l'objet x,y
```
```lua
Camera:SetPosition(x, y) -- La camera se place a x,y
```
```lua
Camera:MousePosition() -- Recupere la position de la souris
```

- **Key** : Repertorie les touche du jeu

Accessible partout dans le code via la variable _Key_

- **GameState** : Module gérant les scene du jeu (on peut y rajouter des variable global)

Accessible partout dans le code via la variable _gameState_

Fonction :
```lua
GameState:ChangeScene(pScene) -- Permet de changer de scene
```

A rajouter si on ajoute des Scene :
```lua
if pScene == "NomScene" then
  self.currentScene = Scene()
  find = true
end
```
en dessous des autres décalration du même type. Remplacer NomScene par le nom que vous voulez donner, et Scene par le nom de la classe Scene que vous charger. Exemple : 
```lua
if pScene == "Gameplay" then
  self.currentScene = SceneGameplay()
  find = true
end
```

Vous avez un exemple de scene dans Engin/Scene/SceneExample.lua (vous pouvez copier coller et remplacer avec le bon nom)

- **MapManage** : Module gérant les map de Tiled

Accessible dans chaque Scene via _mapManager_

```lua
mapManager:AddMap(pMapName, pMap, pTexture) -- Ajoute une map a la liste
```
```lua
mapManager:MapManager:LoadMap(pMapName) -- Charge une map de la liste
```
```lua
mapManager:DetectProperties(pProp, pX, pY) -- Return si la tile au coordonné donner (pX, pY) a la proprieté (pProp) true
```

- **Sprite** : Module de sprite, avec animation et collision avec des tile ISSOLID

La scene gere automatiquement les sprite en les ajoutant a leur liste (on peut y ajouter tout les membre qui hérite Sprite) : 

```lua
table.insert(lstSprite, sprite)
```

Accessible : 
```lua
mySprite = Sprite(pTexture, pX, pY)
```
ou en fesant heriter une autre classe de celle ci : 
```lua
Player = Sprite:extend()
```
Animation :
```lua
Sprite:AddAnim(pAnimName, pTexture, pNbrFrame, pSizeX, pSizeY, pSpeed) -- Ajoute une anim a la liste
```
```lua
Sprite:PlayAnim(pAnimName) -- Joue l'anim (pres enregistrer)
```
Collision : 
```lua
Sprite.enableCollision = true -- par defaut = false, Permet d'activer la collision avec les tile ISSOLID
```
```lua
Sprite:CollideUp(pProp) -- Aussi CollideDown, CollideRight, CollideLeft, Permet de detecter un tile avec une proprieté de chaque coté
```
Mouvement : 
```lua
Sprite.vx -- aussi vy Met un velociter au Sprite
```
```lua
Sprite.frictionX -- aussi frictionY, Permet d'ajouter de la velociter au sprite (defaut : 99)
```
```lua
Sprite:Move(pX, pY) -- Bouge le sprite de facon simple
```
