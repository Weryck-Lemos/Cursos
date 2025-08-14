import cv2
import cvzone
from cvzone.PoseModule import PoseDetector
import math
import time
from datetime import datetime
import openpyxl

video = cv2.VideoCapture('vd02.mp4')

detector = PoseDetector()

contador = 0
controle = False
meta = 10
tempoInicial = 0
tempoDecorrido = 0
dhInicial = ''
dhFinal = ''

arqPlan = openpyxl.load_workbook('dados.xlsx')
plan = arqPlan['dados']
def salvarDados(dhInicial,dhFinal,tempoDecorrido,contador,meta):
    ultimaLinhaA = len(plan['A'])
    proximaLinha = ultimaLinhaA+1
    id = ultimaLinhaA
    plan[f'A{proximaLinha}'].value = id
    plan[f'B{proximaLinha}'].value = dhInicial
    plan[f'C{proximaLinha}'].value = dhFinal
    plan[f'D{proximaLinha}'].value = tempoDecorrido
    plan[f'E{proximaLinha}'].value = contador
    plan[f'F{proximaLinha}'].value = meta
    arqPlan.save('dados.xlsx')
    print('Dados salvos com sucesso!')

while True:
    check,img = video.read()
    img = cv2.resize(img,(1280,720))
    detector.findPose(img,draw=False)
    lmlist,_ = detector.findPosition(img,draw=False)

    if len(lmlist)>=1:
        ombroDx = lmlist[12][0]
        ombroDy = lmlist[12][1]

        cotoDx = lmlist[14][0]
        cotoDy = lmlist[14][1]

        maoDx = lmlist[16][0]
        maoDy = lmlist[16][1]

        cv2.circle(img,(ombroDx,ombroDy),15,(0,0,255),-1)
        cv2.circle(img, (cotoDx, cotoDy), 15, (0, 0, 255), -1)
        cv2.circle(img, (maoDx, maoDy), 15, (0, 0, 255), -1)

        cv2.circle(img,(ombroDx,ombroDy),10,(255,255,255),-1)
        cv2.circle(img, (cotoDx, cotoDy), 10, (255,255,255), -1)
        cv2.circle(img, (maoDx, maoDy), 10, (255,255,255), -1)

        cv2.line(img,(ombroDx,ombroDy),(cotoDx,cotoDy),(255,255,255),2)
        cv2.line(img, (cotoDx, cotoDy), (maoDx, maoDy), (255, 255, 255), 2)

        xDeclive = abs(maoDx-ombroDx)
        yDeclive = abs(maoDy-ombroDy)
        tangArc = math.atan2(yDeclive,xDeclive)
        graus = math.degrees(tangArc)
        valorFinal = int(graus)

        cv2.putText(img,f'{valorFinal} graus',(cotoDx+10,cotoDy),cv2.FONT_HERSHEY_COMPLEX,0.7,
                    (255,255,255),2)

        #acima de 55 graus (decrescente)
        if valorFinal <=55 and controle==False:
            contador +=1
            controle= True
        elif valorFinal >55:
            controle=False

        if contador==1 and tempoInicial==0:
            tempoInicial = time.time()
            dhInicial = datetime.now().strftime('%d/%m/%Y %H:%M:%S')
        elif contador>=1 and contador <meta:
            tempoDecorrido = time.time()-tempoInicial
        elif contador==meta:
            dhFinal = datetime.now().strftime('%d/%m/%Y %H:%M:%S')
            salvarDados(dhInicial,dhFinal,tempoDecorrido,contador,meta)
            tempoInicial=0
            tempoDecorrido=0
            contador=0

        cvzone.putTextRect(img,f'QT: {contador}',(ombroDx+10,ombroDy+100),3.5,4,colorR=(0,0,255))
        cvzone.putTextRect(img, f'Tempo: {round(tempoDecorrido,2)}', (50,100), 4, 4, colorR=(0, 0, 255))

    cv2.imshow('Img',img)
    cv2.waitKey(30)