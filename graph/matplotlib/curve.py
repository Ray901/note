#!/usr/bin/python
#encoding: utf-8

import math
import matplotlib.pyplot as plt
import numpy as np

def plot_sin():
	T = range(100)
	X = [(2 * math.pi * t) / len(T) for t in T]
	Y = [math.sin(value) for value in X]
	plt.plot(X, Y)
	plt.show()

## using numpy
def plot_cos():
	X = np.linspace(0, 2 * np.pi, 100)
	Y = np.cos(X)
	plt.plot(X, Y)
	plt.show()

def plot_plynomial():
	X = np.linspace(-2, 2, 200)
	Y = X ** 2 - 2 * X + 1.
	plt.plot(X, Y)
	plt.show()

def marker():
	X = np.linspace(-6, 6, 1024)
	Y1 = np.sinc(X)
	Y2 = np.sinc(X) + 1
	plt.plot(X, Y1, marker = 'o', color = '.75')
	plt.plot(X, Y2, marker = 'o', color = 'k', markevery = 32)
	plt.show()

plot_sin()
plot_cos()
plot_plynomial()
marker()

