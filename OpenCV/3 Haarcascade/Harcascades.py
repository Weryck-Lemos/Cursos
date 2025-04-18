import cv2

camera = cv2.VideoCapture(0)
classificador = cv2.CascadeClassifier(r"arquivos/cascades/haarcascade_eye.xml")

while True:
    check, img = camera.read()
    imgGray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    objetos = classificador.detectMultiScale(imgGray)
    #print(objetos)

    for x,y,l,a in objetos:
        cv2.rectangle(img,(x,y), (x+l, y+a), (255,0,0), 2)

    cv2.imshow("imagem", img)
    if cv2.waitKey(1) == ord('q'): break

camera.release()