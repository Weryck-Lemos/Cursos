import cv2

camera = cv2.VideoCapture(0)

camera.set(3, 640) #3 representa a largura
camera.set(4, 420) #4 representa a altura
camera.set(10, 60) #10 representa o brilho

while True:
    check, img = camera.read()
    cv2.imshow("webcam", img)

    if cv2.waitKey(1) == ord('a') : break #parar execução se clicar 'a'


camera.release() #fechar webcam