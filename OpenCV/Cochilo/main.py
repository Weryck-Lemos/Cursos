import cv2
import mediapipe as mp
import math
import time
import subprocess

video = cv2.VideoCapture(0)
mp_face_mesh = mp.solutions.face_mesh
face_mesh = mp_face_mesh.FaceMesh()
alarm_process = None
state = None
start_time = None

while True:
    ok, img = video.read()
    if not ok:
        continue

    img = cv2.resize(img, (1000, 720))
    img_rgb = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    results = face_mesh.process(img_rgb)
    h, w, _ = img.shape

    if results.multi_face_landmarks:
        for face in results.multi_face_landmarks:
            di1 = (int(face.landmark[159].x * w), int(face.landmark[159].y * h))
            di2 = (int(face.landmark[145].x * w), int(face.landmark[145].y * h))
            es1 = (int(face.landmark[386].x * w), int(face.landmark[386].y * h))
            es2 = (int(face.landmark[374].x * w), int(face.landmark[374].y * h))

            for p in (di1, di2, es1, es2):
                cv2.circle(img, p, 1, (255, 0, 0), 2)

            dist_di = math.hypot(di1[0] - di2[0], di1[1] - di2[1])
            dist_es = math.hypot(es1[0] - es2[0], es1[1] - es2[1])
            current = "F" if dist_di <= 10 and dist_es <= 10 else "A"

            if current != state:
                state = current
                start_time = time.time()
                if alarm_process:
                    alarm_process.terminate()
                    alarm_process = None

            if state == "F":
                cv2.circle(img, (100, 30), 10, (0, 0, 255), 30)
                elapsed = time.time() - start_time
                if elapsed >= 1 and alarm_process is None:
                    alarm_process = subprocess.Popen(['play', 'alarme.mp3'])
            else:
                cv2.circle(img, (100, 30), 10, (0, 255, 0), 30)

    cv2.imshow("IMG", img)
    if cv2.waitKey(1) & 0xFF == 27:
        break

video.release()
cv2.destroyAllWindows()
