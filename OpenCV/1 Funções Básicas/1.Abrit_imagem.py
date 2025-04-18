import cv2

img = cv2.imread('imagem.jpg') #le uma imagem
imgCinza = cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)
print(img.shape)#tamanho da imagem
cv2.imshow('exemplo',img) #mostra a imagem
cv2.imshow("cinza", imgCinza)
cv2.waitKey(0)#manter a imagem(ela abre e fecha sozinha sem esse comando)