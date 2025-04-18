import cv2

img = cv2.imread("imagem.jpg")
dim = cv2.selectROI("Selecione a area de recorte", img, False)# aperte enter
cv2.destroyWindow("Selecione a area de recorte")

v1= int(dim[0])
v2= int(dim[1])
v3= int(dim[2])
v4 = int(dim[3])

recorte = img[v2:v2+v4, v1:v1+v3]
caminho = "imagens recortadas/"
nome_arquivo = input("Digite o nome do Arquivo: ")
cv2.imwrite(f'{caminho}{nome_arquivo}.jpg', recorte)

cv2.imshow("imagem recortada",  recorte)
cv2.waitKey(0)