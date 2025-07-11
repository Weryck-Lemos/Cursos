import cv2

def main():
    cap = cv2.VideoCapture(0)
    if not cap.isOpened():
        print("Não foi possível acessar a webcam.")
        return

    while True:
        ret, frame = cap.read()
        if not ret:
            break

        # redimensiona, converte em cinza, suaviza e aplica Canny
        frame = cv2.resize(frame, (900, 600))
        gray= cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        blur = cv2.GaussianBlur(gray, (7, 7), 0)
        edges = cv2.Canny(blur, 50, 100)

        cv2.resize(frame,( 400, 600))
        cv2.resize(edges, (400, 600))

        # mostra a webcam
        cv2.imshow("Camera", frame)
        cv2.imshow("Contornos (Canny)", edges)

        # sai com 'a'
        if cv2.waitKey(5) & 0xFF == ord('a'):
            break

    cap.release()
    cv2.destroyAllWindows()

if __name__ == "__main__":
    main()
