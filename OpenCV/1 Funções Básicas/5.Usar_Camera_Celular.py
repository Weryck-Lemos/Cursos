import cv2

video = cv2.VideoCapture()
ip = "https://192.168.100.50:8080/video" #insira o ip https
video.open(ip)

while True:
    check, img = video.read()
    cv2.imshow("img", img)
    cv2.waitKey(1)