.PHONY: all clean

CC = xelatex
BUILD_DIR = build

EXPERIENCES = $(wildcard experiences/*.tex)
SRCS = $(wildcard src/*.tex) src/resume-cv.cls

all: coverletter cv resume

coverletter: coverletter.tex $(EXPERIENCES) $(SRCS)
	$(CC) -output-directory=$(BUILD_DIR) $<

cv: cv.tex $(EXPERIENCES) $(SRCS)
	$(CC) -output-directory=$(BUILD_DIR) $<

resume: resume.tex $(EXPERIENCES) $(SRCS)
	$(CC) -output-directory=$(BUILD_DIR) $<

clean:
	find $(BUILD_DIR) -mindepth 1 ! -regex '.*\.pdf' -delete
