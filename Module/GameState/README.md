# GameState
Module gérant les scene du jeu (on peut y rajouter des variable global)

Accessible partout dans le code via la variable _gameState_

# Fonctions

|Nom de la fonction | Description de la fonction 
|:-:|:-:
|GameState:ChangeScene(pScene)| Permet de changer de scene1

# A rajouter si on ajoute des Scene

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
Vous avez un exemple de scene dans Engine/Scene/SceneExample.lua (vous pouvez copier coller et remplacer avec le bon nom)

