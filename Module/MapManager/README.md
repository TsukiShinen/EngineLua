# MapManage
Module gérant les maps de Tiled

Accessible dans chaque Scene via _mapManager_

# Fonctions
------
|Nom de la fonction | Description de la fonction 
|-:|:-:
|mapManager:AddMap(pMapName, pMap, pTexture) | Ajoute une map a la liste
|mapManager:LoadMap(pMapName)| Charge une map de la liste
|mapManager:DetectProperties(pProp, pX, pY)| Return si la tile au coordonné donner (pX, pY) a la proprieté (pProp) true
