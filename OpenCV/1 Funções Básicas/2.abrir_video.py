import cv2

video = cv2.VideoCapture("video.mp4")

while True:#um video é um loop de imagem
    check, img = video.read()#uma variavel booleana e outra será a imagem produzida
    imgRedim = cv2.resize(img,(480, 360)) #redimencionar imagem
    cv2.imshow("whoa", imgRedim)

    cv2.waitKey(18) 
    #0 você tem que passar manual
    #1 muito rapido
    #10 velocidade normal

