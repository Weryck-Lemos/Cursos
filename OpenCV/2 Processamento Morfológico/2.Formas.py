import cv2

img = cv2.imread("piramide.jpg")
cv2.rectangle(img,(50,50),(200,200), (0,0,0), 5)#eixo x eixo y, rgb, expesura(-1 pinta tudo)
cv2.circle(img, (300,300), 50, (0,0,255), 5)#eixo x, raio, eixo y, rgb, expessura
cv2.line(img, (400,400), (500,300), (0,255,0), 5)
texto = "piramides do egito"
cv2.putText(img, texto, (200, 200), cv2.FONT_HERSHEY_PLAIN, 2, (255,0,0),2) #string, eixo x, fonte, tamanho, rgb, expessura

cv2.imshow("imagem",img)
cv2.waitKey(0)