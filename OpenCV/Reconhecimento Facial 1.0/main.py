import cv2
import mediapipe as mp

webcam = cv2.VideoCapture(0)
rosto = mp.solutions.face_detection
reconhecedor = rosto.FaceDetection()
desenho = mp.solutions.drawing_utils

while True:
    #informacoes webcam
    verif, frame = webcam.read()
    if not verif: break

    frame = cv2.resize(frame, (900, 600))
    #reconhecer rostos
    lista_rostos = reconhecedor.process(frame)
    if lista_rostos.detections:
        for rosto in lista_rostos.detections:
            desenho.draw_detection(frame, rosto)

    cv2.imshow("Detector de Rostos",frame)
    if cv2.waitKey(5) == ord('a'): break

webcam.release()