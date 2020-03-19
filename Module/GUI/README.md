# GUI
Module permettant la gestion d'une GUI

Accessible partout dans le code via la variable GUI

# Elements
* **Groupe**

|Nom de la fonction | Description de la fonction 
|:-:|:-:
|group = GUI.newGroup()| Creer un groupe
|group:addElement(pElement)| Ajoute un Element dans le groupe
|group:setVisible(pVisible)| Set Groupe visible ou pas
|group:myGroup:update()| Update le Groupe
|group:myGroup:draw()| Draw le Groupe

* **Panel**

|Nom de la fonction | Description de la fonction 
|:-:|:-:
|panel = GUI.newPanel(pX, pY, pW, pH, pColorOut) | Creer un panel
|panel:setImage(pImage) | Donne l'image d'affichage
|panel:setEvent(pEventType, pFunction) | Creer un Event (type : "hover" et/ou "pressed" pour un button)
|panel:draw() | Draw l'élement
|panel:update(dt) | Update l'élement

* **Text** (hérite de Panel)

|Nom de la fonction | Description de la fonction 
|:-:|:-:
|text = GUI.newText(pX, pY, pW, pH, pText, pFont, pHAlign, pVAlign, pColor) | Creer un élement text pour la GUI

* **Button** (hérite de Panel)

|Nom de la fonction | Description de la fonction 
|:-:|:-:
|button = GUI.newButton(pX, pY, pW, pH, pText, pFont, pColor) | Creer un button
|button:setImages(pImageDefault, pImageHover, pImagePressed) | Donne les images d'affichage

* **CheckBox** (hérite de Panel)

|Nom de la fonction | Description de la fonction 
|:-:|:-:
|checkBox = GUI.newCheckbox(pX, pY, pW, pH) | Creer une checkBox
|checkBox:setImages(pImageDefault, pImagePressed) | Donne les images d'affichage
|checkBox:setState(pbState) | Modifie l'état (boolean)

* **ProgressBar**(hérite de Panel)

|Nom de la fonction | Description de la fonction 
|:-:|:-:
|progressBar = GUI.newProgressBar(pX, pY, pW, pH, pMax, pColorOut, pColorIn) | Creer une progressBar
|progressBar:setImages(pImageBack, pImageBar) | Donne les images d'affichage
|progressBar:setValue(pValue) | Set la veleur de la progressBar
