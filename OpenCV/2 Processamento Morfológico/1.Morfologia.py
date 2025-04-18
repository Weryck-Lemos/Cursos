import cv2

img = cv2.imread("piramide.jpg")
img = cv2.resize(img,(500, 400))
imgCinza = cv2.cvtColor(img , cv2.COLOR_RGB2GRAY)
imgBlur = cv2.GaussianBlur(imgCinza,(7,7), 0)# suavizar a imagem ajuda na detecção de pontos
imgCanny = cv2.Canny(img, 50, 100) #extrai o contorno da imagem ajustando 
imgDilat = cv2.dilate(imgCanny,(5,5), iterations=5)#expande
imgErode = cv2.erode(imgCanny, (5,5), iterations=2)#desfragmenta

imgOpening = cv2.morphologyEx(imgCanny, cv2.MORPH_OPEN, (5,5))
imgClosing = cv2.morphologyEx(imgCanny, cv2.MORPH_CLOSE, (5,5))

#cv2.imshow("1", img)
#cv2.imshow("2",imgCinza)
#cv2.imshow("3", imgBlur)
cv2.imshow("4", imgCanny)
cv2.imshow("open", imgOpening) #retirar ruidos da imagem
cv2.imshow("close", imgClosing) #tentar fechar o objeto


cv2.waitKey(0)