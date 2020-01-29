#!/usr/bin/python3
# -*- coding: utf-8 -*-
import PyQt5
from PyQt5.QtWidgets import *
from PyQt5.QtGui import *
from PyQt5.QtCore import *
import sys, getopt
import numpy as np
import cv2
from scipy.spatial.distance import pdist, squareform
from tsp_solver.greedy_numpy import solve_tsp
import time
import threading

INPUT_IMAGE_FILE = "test.jpg"
NUMBER_OF_CITIES = 3500
WINDOW_MARGIN = (100, 100)
WINDOW_SIZE = (800, 600)

try:
    opts, args = getopt.getopt(sys.argv[1:], "hi:n:", ["ifile=", "n_cities="])
except getopt.GetoptError:
    print('python %s -i <input_file> -n <num_of_cities>' % (sys.argv[0]))
    sys.exit(2)

for opt, arg in opts:
    if opt == '-h':
        print('python %s -i <input_file> -n <num_of_cities>' % (sys.argv[0]))
        sys.exit()
    elif opt in ("-i", "--ifile"):
        INPUT_IMAGE_FILE = arg
        print('INPUT_IMAGE_FILE:', INPUT_IMAGE_FILE)
    elif opt in ("-n", "--n_cities"):
        NUMBER_OF_CITIES = min(int(arg), 9992500)
        print('NUMBER_OF_CITIES:', NUMBER_OF_CITIES)


class MyMainWindow(QMainWindow):
    def __init__(self):
        super().__init__()

        actionOpenFile = QAction("&Open File...", self)
        actionOpenFile.setShortcut("Ctrl+O")
        actionOpenFile.setStatusTip('Open an image file for input')
        actionOpenFile.triggered.connect(self.openFileDialog)
        self.actionOpenFile = actionOpenFile

        actionExitApp = QAction(QIcon('exit.png'), '&Exit', self)
        actionExitApp.setShortcut('Ctrl+Q')
        actionExitApp.setStatusTip('Exit application')
        actionExitApp.triggered.connect(qApp.quit)
        self.actionExitApp = actionExitApp

        mainMenu = self.menuBar()
        fileMenu = mainMenu.addMenu('&File')
        fileMenu.addAction(self.actionOpenFile)
        fileMenu.addAction(self.actionExitApp)

        self.widget = MyWidget(self)
        self.setCentralWidget(self.widget)
        self.setWindowTitle('CS512 - Project: TSP Art')
        self.setGeometry(WINDOW_MARGIN[0], WINDOW_MARGIN[1], WINDOW_SIZE[0], WINDOW_SIZE[1])
        self.show()

    def openFileDialog(self):
        dlg = QFileDialog()
        dlg.setFileMode(QFileDialog.AnyFile)
        dlg.setNameFilters(["Images (*.png *.jpg)"])

        filename = None
        if dlg.exec_():
            filenames = dlg.selectedFiles()
            filename = filenames[0]

        if filename != None:
            global INPUT_IMAGE_FILE
            INPUT_IMAGE_FILE = filename
            print(filename)
            self.actionOpenFile.setDisabled(True)
            self.widget.setupImage()

        print('INPUT_IMAGE_FILE', INPUT_IMAGE_FILE)
        return filename

    def closeEvent(self, event):
        print('closeEvent')
        can_exit = True

        if self.widget.workingthread:
            if self.widget.workingthread.isAlive():
                can_exit = False

        if can_exit:
            event.accept()  # let the window close
        else:
            event.ignore()
            print('thread not completed, please wait')


class MyWidget(QWidget):
    rBtns = []
    CANVAS_SIZE = QSize(WINDOW_SIZE[1], WINDOW_SIZE[1])
    optimized_path_points = None
    time = 0
    image_prepared = False
    workingthread = None

    def __init__(self, mainWindow):
        super().__init__()
        self.mainWindow = mainWindow
        self.initUI()
        self.image_prepared = False

    def initUI(self):
        self.txt_canvas = QLabel("Go to \"File\" -> \"Open File... (Ctrl+O)\" to select an input image.", self)
        self.txt_canvas.move(10, 10)

        self.canvas = QLabel(self)
        self.canvas.setGeometry(0, 0, self.CANVAS_SIZE.width(), self.CANVAS_SIZE.height())

        vboxbound = QWidget(self)
        vbox = QVBoxLayout()
        self.rBtns = [
            QRadioButton("Input Image"),
            QRadioButton("Greyscale"),
            QRadioButton("Contrast-Enhanced"),
            QRadioButton("Binary"),
            QRadioButton("Cities"),
            QRadioButton("TSP")
        ]

        self.rBtns[0].toggled.connect(lambda: self.onRadioBtnChecked(self.rBtns[0]))
        self.rBtns[1].toggled.connect(lambda: self.onRadioBtnChecked(self.rBtns[1]))
        self.rBtns[2].toggled.connect(lambda: self.onRadioBtnChecked(self.rBtns[2]))
        self.rBtns[3].toggled.connect(lambda: self.onRadioBtnChecked(self.rBtns[3]))
        self.rBtns[4].toggled.connect(lambda: self.onRadioBtnChecked(self.rBtns[4]))
        self.rBtns[5].toggled.connect(lambda: self.onRadioBtnChecked(self.rBtns[5]))
        self.rBtns[5].setEnabled(False)

        vbox.addWidget(self.rBtns[0])
        vbox.addWidget(self.rBtns[1])
        vbox.addWidget(self.rBtns[2])
        vbox.addWidget(self.rBtns[3])
        vbox.addWidget(self.rBtns[4])
        vbox.addWidget(self.rBtns[5])

        vboxbound.setLayout(vbox)
        vboxbound.setFixedWidth(200)
        vboxbound.move(WINDOW_SIZE[1], 0)

        self.slider = QSlider(Qt.Horizontal)
        self.slider.valueChanged.connect(self.onSliderValueChanged)
        self.slider.setEnabled(False)
        vbox.addWidget(self.slider)

    def start(self, chosen_black_indices):
        distances = pdist(chosen_black_indices)
        distance_matrix = squareform(distances)

        self.workingthread = threading.Thread(target=self.solver, args=(distance_matrix, chosen_black_indices))
        self.workingthread.start()

        self.waitforfinished = threading.Thread(target=self.waitforfinished_fn)
        self.waitforfinished.start()

    def setupImage(self):
        self.txt_canvas.setText('')

        cvImgBGR = cv2.imread(INPUT_IMAGE_FILE, cv2.IMREAD_COLOR)
        cvImg_shape = cvImgBGR.shape

        # RGB image
        cvImgRGB = cv2.cvtColor(cvImgBGR, cv2.COLOR_BGR2RGB)
        self.img_source = self.convertCVMat2QImage(cvImgRGB, _format=QImage.Format_RGB888)

        # Grayscale image
        cvImgGRAY = cv2.cvtColor(cvImgRGB, cv2.COLOR_BGR2GRAY)
        self.img_gray = self.convertCVMat2QImage(cvImgGRAY, _format=QImage.Format_Grayscale8)

        # Enhanced image
        cv2.normalize(cvImgGRAY, cvImgGRAY, alpha=0, beta=255, norm_type=cv2.NORM_MINMAX, dtype=cv2.CV_8U)
        cvImgEnhanced = np.float32(cvImgGRAY)
        cvImgEnhanced = cvImgEnhanced[:] * cvImgEnhanced[:] / 256
        cvImgEnhanced = cvImgEnhanced.astype(np.uint8)
        self.img_enhanced = self.convertCVMat2QImage(cvImgEnhanced, _format=QImage.Format_Grayscale8)

        # Binarized image
        cvImgBinary = cvImgEnhanced.copy()
        threshold = 45
        cvImgBinary[cvImgBinary < threshold] = 0
        cvImgBinary[cvImgBinary >= threshold] = 255
        self.img_binary = self.convertCVMat2QImage(cvImgBinary, _format=QImage.Format_Grayscale8)

        # Cities
        black_indices = np.argwhere(cvImgBinary == 0)
        chosen_black_indices = black_indices[
            np.random.choice(black_indices.shape[0], size=NUMBER_OF_CITIES)]
        cvImgCities = np.zeros((cvImg_shape[0], cvImg_shape[1], 3), np.uint8)
        cvImgCities[:] = (255, 255, 255)
        for x, y in chosen_black_indices:
            cv2.circle(cvImgCities, (y, x), 3, (0, 0, 255), thickness=-1)
        self.img_cities = self.convertCVMat2QImage(cvImgCities, _format=QImage.Format_RGB888)

        # TSP Art image
        self.mat_tsp = cvImgCities.copy()
        self.img_tsp = self.convertCVMat2QImage(self.mat_tsp, _format=QImage.Format_RGB888)

        self.canvas.show()
        self.image_prepared = True
        self.rBtns[0].setChecked(True)
        self.start(chosen_black_indices)

    def solver(self, distance_matrix, chosen_black_indices):
        if not self.image_prepared: return
        t1 = time.time()
        optimized_path = solve_tsp(distance_matrix)
        t2 = time.time()
        self.time = t2 - t1
        self.optimized_path_points = [chosen_black_indices[x] for x in optimized_path]
        print('solved in %.2f seconds' % self.time)
        self.mainWindow.actionOpenFile.setDisabled(False)
        return

    def waitforfinished_fn(self):
        self.workingthread.join()
        self.slider.setEnabled(True)
        self.rBtns[5].setEnabled(True)
        return

    def onSliderValueChanged(self):
        if not self.image_prepared: return
        percent = self.slider.value()
        self.mat_tsp[:] = (255, 255, 255)
        if self.optimized_path_points != None:
            for i in range(1, len(self.optimized_path_points) * percent // 99):
                x0, y0 = self.optimized_path_points[i - 1]
                x1, y1 = self.optimized_path_points[i]
                cv2.line(self.mat_tsp, (y0, x0), (y1, x1), (0, 0, 0), thickness=2, lineType=cv2.LINE_AA)
            self.rBtns[len(self.rBtns) - 1].setChecked(True)
            self.updateImage(self.img_tsp)
        else:
            print('optimized_path_points == None')

    def keyPressEvent(self, event):
        if not self.image_prepared: return
        if event.key() == Qt.Key_Enter:
            self.proceed()  # this is called whenever the continue button is pressed
        elif event.key() == Qt.Key_Up or event.key() == Qt.Key_Left:
            for i in range(0, len(self.rBtns)):
                if self.rBtns[i].isChecked():
                    self.rBtns[max(0, i - 1)].setChecked(True)
                    break
        elif event.key() == Qt.Key_Down or event.key() == Qt.Key_Right:
            for i in range(0, len(self.rBtns)):
                if self.rBtns[i].isChecked():
                    self.rBtns[min(i + 1, len(self.rBtns) - 1)].setChecked(True)
                    break

    def convertCVMat2QImage(self, src, _format=QImage.Format_Grayscale8):
        if len(src.shape) == 3:
            return QImage(src, src.shape[1], src.shape[0], 3 * src.shape[1], _format)
        else:
            return QImage(src, src.shape[1], src.shape[0], src.shape[1], _format)

    def updateImage(self, img):
        if not self.image_prepared: return
        pixmap = QPixmap.fromImage(img)
        pixmap = pixmap.scaled(self.CANVAS_SIZE, PyQt5.QtCore.Qt.KeepAspectRatio)
        self.canvas.setPixmap(pixmap)
        self.canvas.setGeometry(
            (self.CANVAS_SIZE.width() - pixmap.size().width()) / 2, 0,
            self.CANVAS_SIZE.width(), self.CANVAS_SIZE.height())

    def onRadioBtnChecked(self, b):
        if not self.image_prepared: return
        images = [
            self.img_source,
            self.img_gray,
            self.img_enhanced,
            self.img_binary,
            self.img_cities,
            self.img_tsp
        ]
        for i in range(0, len(images)):
            if b == self.rBtns[i] and self.rBtns[i].isChecked():
                self.updateImage(images[i])


if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = MyMainWindow()
    sys.exit(app.exec_())