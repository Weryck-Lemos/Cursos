import cv2
import mediapipe as mp
import math
import time

video = cv2.VideoCapture(0)
mpFaceMash = mp.solutions.face_mesh
FaceMash = mpFaceMash.FaceMesh()
mp_drawing = mp.solutions.drawing_utils

inicio = 0
status = ""
while True:
    check, img = video.read()

    if not check:
        continue

    img = cv2.resize(img,(1000,720))
    imgRGB = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    result = FaceMash.process(imgRGB)
    h, w, _ = img.shape

    if result.multi_face_landmarks:
        for face in result.multi_face_landmarks:
            #print(face)
            #mp_drawing.draw_landmarks(img, face, mpFaceMash.FACEMESH_FACE_OVAL)
            di1x, di1y = int((face.landmark[159].x) * w), int((face.landmark[159].y)* h)
            di2x, di2y = int((face.landmark[145].x) * w), int((face.landmark[145].y)* h)
            es1x, es1y = int((face.landmark[386].x) * w), int((face.landmark[386].y) * h)
            es2x, es2y = int((face.landmark[374].x) * w), int((face.landmark[374].y) * h)

            cv2.circle(img, (di1x, di1y), 1, (255,0,0),2)
            cv2.circle(img, (di2x, di2y), 1, (255, 0, 0), 2)
            cv2.circle(img, (es1x, es1y), 1, (255, 0, 0), 2)
            cv2.circle(img, (es2x, es2y), 1, (255, 0, 0), 2)


            distDI = math.hypot(di1x- di2x, di1y - di2y)
            distES = math.hypot(es1x - es2x, es1y - es2y)

            if distDI <=10 and distES <=10:
                cv2.rectangle(img, (100,30), (390,80), (0,0,255), -1)
                cv2.putText(img,"OLHOS FECHADOS", (105, 65),cv2.FONT_HERSHEY_SIMPLEX,1, (255,255,255), 3)
                situacao = "F"
                if situacao != status:
                    inicio = time.time()
            else:
                cv2.rectangle(img, (100, 30), (390, 80), (0, 255, 0), -1)
                cv2.putText(img, "OLHOS ABERTOS", (105, 65), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 3)
                situacao = "A"
                inicio = time.time()
                tempo = int(time.time()- inicio)


            if situacao == "F":
                tempo = int(time.time()-inicio)

            status = situacao

            if tempo >= 2:
                cv2.rectangle(img, (250,290), (850, 220), (0,0, 255), -1)
                cv2.putText(img, f"DORMINDO {tempo} SEG", (310, 280), cv2.FONT_HERSHEY_SIMPLEX,1.7,(255,255,255), 5)
            print(tempo)

    cv2.imshow("IMG",img)
    cv2.waitKey(1)