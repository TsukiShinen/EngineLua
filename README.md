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


- **Debug** : Module permettant de debugger dans la console si il est activer (via config.json)

Accessible partout dans le code via la variable _Debug_

Fonction utiliser : 
```lua
Debug:Log(Message)
```
Permet d'ecrire _[Log] Message_ dans la console

```lua
Debug:Error(Message)
```
Permet d'ecrire _[Error] Message_ dans la console
