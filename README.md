EngineLua
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
group:addElement(pElement) -- Add Element to the groupe
```
```lua
group:setVisible(pVisible) -- Set Groupe visible or not
```
```lua
group:myGroup:update() -- Update the Groupe
```
```lua
group:myGroup:draw() -- Draw the Groupe
```
2. Panel
```lua
panel = GUI.newPanel(pX, pY, pW, pH, pColorOut)
```
```lua
panel:setImage(pImage) -- Set Image of the panel
```
```lua
panel:setEvent(pEventType, pFunction) -- Add event to the panel, name it "hover" to set the event hover
```
```lua
panel:draw()
```
```lua
panel:update(dt)
```
3. Text
```lua
GUI.newText(pX, pY, pW, pH, pText, pFont, pHAlign, pVAlign, pColor)
```
4. Button
```lua
GUI.newButton(pX, pY, pW, pH, pText, pFont, pColor)
```
5. CheckBox
```lua
GUI.newCheckbox(pX, pY, pW, pH)
```
6. ProgressBar
```lua
GUI.newProgressBar(pX, pY, pW, pH, pMax, pColorOut, pColorIn)
```
